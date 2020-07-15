//
//  NewAnnouncementView.swift
//  CO Riders
//
//  Created by 18391981 on 15.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct NewAnnouncementView: View {
    
    @State var name = ""
    
     var db: Firestore!
    
    init() {
        let settings = FirestoreSettings()

        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
    }
    
    var body: some View {
        ScrollView {
            
            TextField("Name", text: $name)
            
            Button(action: {

            var ref: DocumentReference? = nil
                ref = self.db.collection("announcements").addDocument(data: [
                    "name": self.name
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
                
            }) {
                Text("Add")
            }
            
        }
    }
}

struct NewAnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        NewAnnouncementView()
    }
}
