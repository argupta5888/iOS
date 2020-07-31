//
//  FirebaseHelper.swift
//  TharTrak
//
//  Created by esoftuser2 on 13/12/19.
//  Copyright © 2019 eSoft Technologies. All rights reserved.
//

import Foundation

import UIKit
import Firebase
import FirebaseFirestoreSwift

protocol FirebaseHelperType {
    static func insertOne<T:Codable> (collection: CollectionReference?, newRecord: T, type: T.Type, completion: @escaping ((Bool, String?) -> ()))
    static func selectAll<T:Codable> (collection: CollectionReference?, type: T.Type, completion: @escaping (([T]?, String?) -> ()))
    static func updateOne<T:Codable> (documentUpdate: DocumentReference?, updateRecord: T, type: T.Type, completion: @escaping ((Bool, String?) -> ()))
    static func DeleteOne<T:Codable> (documentDelete: DocumentReference?, type: T.Type, completion: @escaping ((Bool, String?) -> ()))
    
    static func isRecordAvailable<T: Codable>(collection: CollectionReference?, query: NSPredicate, type: T.Type, completion: @escaping (Bool, CustomError?) -> Void)
    static func getCollectionRef(path: String) -> CollectionReference?
    static func getDocumentRef(path: String) -> DocumentReference?

}

class FirebaseHelper : FirebaseHelperType {
    
    static func isRecordAvailable<T: Codable>(collection: CollectionReference?, query: NSPredicate, type: T.Type, completion: @escaping (Bool, CustomError?) -> Void) {
        collection?.filter(using: query)
            .getDocuments { (queryResult, error) in
                if let err = error {
                    completion(false, CustomError.HTTPError(err: err))
                }
                else {
                    if (queryResult?.count ?? 0) > 0 {
                        _ = queryResult?.documents.map({ print($0.data()) })
                        completion(true, nil)
                    }
                    else {
                        completion(false, .InvalidCredentials)
                    }
                }
        }
    }
    
    static func DeleteOne<T>(documentDelete: DocumentReference?, type: T.Type, completion: @escaping ((Bool, String?) -> ())) where T : Decodable, T : Encodable {
        documentDelete?.delete(completion: { (error) in
            if let err = error {
                completion(false, err.localizedDescription)
            }
            else{
                completion(true,nil)
            }
        })
        
    }
    
    
    static func updateOne<T>(documentUpdate: DocumentReference?, updateRecord: T, type: T.Type, completion: @escaping ((Bool, String?) -> ())) where T : Decodable, T : Encodable {
        
        do {
            try documentUpdate?.setData(from: updateRecord) { error in //.updateData(updateRecord as! [AnyHashable : Any], completion: { (error) in
                if let err = error {
                    completion(false, err.localizedDescription)
                }
                else {
                    completion(true,nil)
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    static func selectAll<T: Codable>(collection: CollectionReference?, type: T.Type, completion: @escaping (([T]?, String?) -> ())) {
        
        collection?.getDocuments(completion: { (querySnapshot, error) in
            if let err = error {
                completion(nil,err.localizedDescription)
            }
            else {
                let result = querySnapshot?.documents.map({ (document) -> T in
                    let finalResult: T?
                    
                    do {
                        finalResult = try JSONDecoder().decode(type, fromJSONObject: document.prepareForDecoding())
                    } catch {
                        completion(nil, error.localizedDescription)
                        fatalError("Unable to initialize type \(type) with dictionary \(document.data()): \(error)")
                    }
                    
                    if let model = finalResult {
                        return model
                    } else {
                        completion(nil, error?.localizedDescription)
                        fatalError("Missing document of type \(type) at \(document.reference.path)")
                    }
                    
                })
                completion(result, nil)
                
            }
        })
        
    }
    
    static func insertOne<T:Codable>(collection: CollectionReference?, newRecord: T, type: T.Type, completion: @escaping ((Bool, String?) -> ())) {
        
        do {
            let result = try collection?.addDocument(from: newRecord)
            if result?.documentID != nil {
                completion(true, result?.documentID ?? "")
            }
            else {
                completion(false, nil)
            }
        }
        catch {
            print(error)
        }
        completion(false, nil)
        
    }
    
    static func getCollectionRef(path: String) -> CollectionReference? {
         return FirebaseDB.shared.db.collection(path)
    }
    static func getDocumentRef(path: String) -> DocumentReference? {
        return FirebaseDB.shared.db.document(path)
    }
}



extension QueryDocumentSnapshot {
    
    func prepareForDecoding() -> [String: Any] {
        var data = self.data()
        data.forEach { (key, value) in
            switch value {
            case let ts as Timestamp:
                let date = ts.dateValue()
                data[key] =  Int((date.timeIntervalSince1970 * 1000).rounded(toPlaces: 0))
            case let ref as DocumentReference:
                let _ = ref.getDocument { (queryResult, error) in
                    print(queryResult?.data())
                }
                print("HI")
                break
            default:
                break
            }
        }
        data["documentId"] = self.documentID
        
        
        return data
    }
    
}

extension JSONDecoder {
    func decode<T>(_ type: T.Type, fromJSONObject object: Any) throws -> T where T: Decodable {
        return try decode(T.self, from: try JSONSerialization.data(withJSONObject: object, options: []))
    }
}
