//
//  FirestoreService.swift
//  CO Riders
//
//  Created by 18391981 on 01.08.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct GUser: Identifiable {
    var id: String
    var email: String
    var name: String
    var location: String
    var publish: String
    var author: String
    var status: String
    var company: String
    var badge: String
    var instagramLink: String
}

class FirestoreService {
    
    static let shared = FirestoreService()
    
    var db: Firestore!
    
    private var currentUserId: String {
        return Auth.auth().currentUser!.uid
    }

    init() {

        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
//    func createBuyer(id: String, email: String, name: String, location: String, author: String) {
//
//        var ref: DocumentReference? = nil
//            ref = self.db.collection("buyers").addDocument(data: [
//                "id": id,
//                "email": email,
//                "name": name,
//                "location": location,
//                "author": author
//                //"id": ref?.
//        ]) { error in
//            if let error = error {
//                print("Error adding document: \(error)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }
//    }
    
        func createUser(id: String, email: String, name: String, location: String, publish: String, status: String, company: String, badge: String, instagramLink: String) {
    
            var ref: DocumentReference? = nil
                ref = self.db.collection("users").addDocument(data: [
                    "userId": id,
                    "email": email,
                    "name": name,
                    "location": location,
                    "publish": publish,
                    "status": status,
                                    "company": company,
                                    "badge": badge,
                                    "instagramLink": instagramLink
                   // "author": author
                    //"id": ref?.
            ]) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                    
                    self.db.collection("users").document(ref!.documentID).setData( ["documentID": ref!.documentID], merge: true)
                       
                    
                }
            }
        }
    
//    func createUser(id: String, email: String, name: String, location: String, publish: String, author: String, status: String, company: String, badge: String, instagramLink: String) {
//
//        var ref: DocumentReference? = nil
//            ref = self.db.collection("user").addDocument(data: [
//
//                "id": id,
//                "email": email,
//                "name": name,
//                "location": location,
//                "author": author,
//
//                "publish": publish,
//                "author": author,
//                "status": status,
//                "company": company,
//                "badge": badge,
//                "instagramLink": instagramLink
//                //"id": ref?.
//        ]) { error in
//            if let error = error {
//                print("Error adding document: \(error)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }
//    }
//
    func updateUser(name: String, location: String, author: String, company: String, badge: String, instagramLink: String) {
        
        self.db.collection("users").document(currentUserId).setData( [
            "name": name,
            "location": location,
            "author": author,
            "author": author,
            "company": company,
            "badge": badge,
            "instagramLink": instagramLink

        ], merge: true)
        
    }
    
    func getUserData() {
        
        print("======= Get Method")
        
            // [START get_collection]
            db.collection("users").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    
                    
                    print("=======================ERR")
                } else {
                    for document in querySnapshot!.documents {
                        print("==========")
                        
                        print("\(document.documentID) => \(document.data())")
                        
                        print("==========")
                    }
                }
            }
        
    }
        //db.collection("Category").document("Film").collection("firstFilm").getDocuments
        
//        let docRef = db.collection("ask").document(uid!)
//
//        ldb.collection("ask").document(uid!)
//
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//
//                let data = document.data()
//
//                let q1 = data!["q1"]! as? Bool ?? true
//
//                if q1 == false {
//                 //false code
//                } else {
//                //true code
//                }
//            } else {
//                print("Document does not exist")
//            }
//        }
        
//        db.collection("users").document(currentUserId).addSnapshotListener { (snap, err) in
//            DispatchQueue.main.async {
//                if err != nil {
//                    print((err?.localizedDescription)!)
//                    return
//                } else {
//                    print("no errors")
//                    for i in snap!.documentChanges {
//                        let id = i.documentID
//                        let name = i.document.get("name") as! String
//                        let description = i.document.get("description") as! String
//                        let price = i.document.get("price") as! String
//                        let address = i.document.get("address") as! String
//                        let category = i.document.get("category") as! String
//                        let type = i.document.get("type") as! String
//                        let serviceType = i.document.get("serviceType") as! String
//
////                        self.data.append(RideModel(id: id,
////                                                   name: name,
////                                                   description: description,
////                                                   price: price,
////                                                   address: address,
////                                                   category: category,
////                                                   type: type,
////                                                   serviceType: serviceType))
//                    }
//                    //print(self.data)
//                }
//            }
//        }
        
    }
    
//    func updateUserId(withUid: String, toNewName: String) {
//        self.db.collection("users").document(withUid).setData( ["id": toNewName], merge: true)
//    }
//
//
//    func updateUserField(withUid: String, andField: String, toNewValue: String) {
//        self.db.collection("users").document(withUid).setData( [andField: toNewValue], merge: true)
//    }
//

