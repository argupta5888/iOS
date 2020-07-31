//
//  ViewController.swift
//  ExFirebaseDB
//
//  Created by esoftuser2 on 06/11/19.
//  Copyright © 2019 eSoft Technologies. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLocationj: UITextField!
    
    var rows: [Employee] = []
    
    var db: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
    
       let settings = FirestoreSettings()
       Firestore.firestore().settings = settings
       db = Firestore.firestore()
        
        
//        db.collection("users").addDocument(data: ["first_name":"Trishna", "last_name":"Gupta", "age":13, "is-active":true]) { error in
//            if error != nil {
//                print("Inserted successfully")
//            }
//        }
    }
    
//    private func getRecords() {
//        db.collection("employee").addSnapshotListener { (snapShot, error) in
//             let result = Result {
//                 try snapShot?.documents.compactMap({ document in
//                     try document.data(as: Employee.self)
//                 })
//             }
//             switch result {
//             case .success(let list):
//                 if let employees = list {
//
//                 }
//             case .failure(let error):
//                print(error.localizedDescription)
//             }
//         }
//    }

    @IBAction func addRecord(_ sender: UIButton) {
        db.collection("users").getDocuments { (result, error) in
            if let error = error {
                print("Error......\(error)")
            }
            else {
                for document in result!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        
        db.collection("users")
        .whereField("age", isLessThan: 10)
        .addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error retreiving snapshots \(error!)")
                return
            }
            print("Current users born before 1900: \(snapshot.documents.map { $0.data() })")
            
        }
    }
    
    @IBAction func updatedRecord(_ sender: Any) {
        
    }
    
    @IBAction func deleteRecord(_ sender: Any) {
        
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Name"
        cell.detailTextLabel?.text = "location"
        return cell
      }
}

