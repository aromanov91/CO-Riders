//
//  NewRideCreateFormView.swift
//  CO Riders
//
//  Created by 18391981 on 26.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct NewRideCreateFormView: View {
    
    var category = ""
    var type = ""
    var serviceType = ""
    
    @State var name = ""
    @State var description = ""
    @State var price = ""
    @State var address = ""
    
    var db: Firestore!

    init(category: String = "", type: String = "", serviceType: String = "") {
        self.category = category
        self.type = type
        self.serviceType = serviceType
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 24) {
                
                M7TextField("Название", text: $name)
                
                M7TextField("Описание", text: $description)
                
                M7TextField("Цена", text: $price)
                
                M7TextField("Адрес", text: $address)
                
                M7Button(style: .primary, action: { saveNewRide() }) {
                    Text("Создать")
                }
                
            }.padding()
            
        }.navigationBarTitle("Новое объявление")
        
    }
    
    func saveNewRide() {
        
        var ref: DocumentReference? = nil
            ref = self.db.collection("rides").addDocument(data: [
                "name": self.name,
                "description": self.description,
                "price": self.price,
                "address": self.address,
                "category": self.name,
                "type": self.type,
                "serviceType": self.serviceType
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
    }
}

struct NewRideCreateFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewRideCreateFormView()
    }
}
