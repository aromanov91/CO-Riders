//
//  AnnouncementListView.swift
//  CO Riders
//
//  Created by 18391981 on 15.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct RideModel: Identifiable {
    var id: String
    var name: String
    var description: String
    var price: String
    var address: String
    var category: String
    var type: String
    var serviceType: String
}

class SearthViewModel: ObservableObject {
    
    private var db = Firestore.firestore()
    
    @Published var data = [RideModel]()
    
    func fetchData() {
        
        db.collection("rides").addSnapshotListener { (snap, err) in
            DispatchQueue.main.async {
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                } else {
                    print("no errors")
                    for i in snap!.documentChanges {
                        let id = i.document.documentID
                        let name = i.document.get("name") as! String
                        let description = i.document.get("description") as! String
                        let price = i.document.get("price") as! String
                        let address = i.document.get("address") as! String
                        let category = i.document.get("category") as! String
                        let type = i.document.get("type") as! String
                        let serviceType = i.document.get("serviceType") as! String
                        
                        self.data.append(RideModel(id: id,
                                                   name: name,
                                                   description: description,
                                                   price: price,
                                                   address: address,
                                                   category: category,
                                                   type: type,
                                                   serviceType: serviceType))
                    }
                    print(self.data)
                }
            }
        }
    }
}

struct SearthView: View {
    
    @ObservedObject var viewModel = SearthViewModel()
    
    var body: some View {
        
        NavigationView {
            List(viewModel.data) { book in // (2)
                
                NavigationLink(destination: RideDetailView(raide: book)) {
                    
                    VStack(alignment: .leading) {
                        M7Text(book.name, style: .title3)
                        M7Text(book.price, style: .paragraph1)
                        M7Text(book.address, style: .paragraph1)
                        
                    }
                }
            }
            .navigationBarTitle("Rides")
            .onAppear() { // (3)
                self.viewModel.fetchData()
            }
        }
    }
}

//struct AnnouncementListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnnouncementListView()
//    }
//}
