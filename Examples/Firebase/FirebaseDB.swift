//
//  BaseFirebaseDB.swift
//  TharTrak
//
//  Created by esoftuser2 on 12/12/19.
//  Copyright © 2019 eSoft Technologies. All rights reserved.
//

import Foundation
import Firebase

class FirebaseDB {

    var userCollection: CollectionReference!
    var equipmentMasterCollection: CollectionReference!
    var processCollection: CollectionReference!
    
    //MARK: Singleton Object
    static let shared = FirebaseDB()
    
    let db = Firestore.firestore()
       
    //MARK: Constant collections
    private let kUserCollection = "users"
    private let kEquipmentMasterCollection = "EquipmentMaster"
    private let kProcessCollection = "ProcessMaster"
    
    init() {
        
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        settings.cacheSizeBytes = FirestoreCacheSizeUnlimited
        db.settings = settings
        initCollections(database: db)
    }
    
    private func initCollections(database: Firestore) {
        
        userCollection = database.collection(kUserCollection)
        equipmentMasterCollection = database.collection(kEquipmentMasterCollection)
        processCollection = database.collection(kProcessCollection)
    }
}
