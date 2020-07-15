//
//  AnnouncementListView.swift
//  CO Riders
//
//  Created by 18391981 on 15.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


//struct Announcement: Codable, Identifiable {
//  @DocumentID var id: String? // (2)
//  var title: String
//}
//
//class AnnouncementTaskRepository: ObservableObject {
//
//    var announcements = [Announcement]()
//
//  var db = Firestore.firestore() // (1)
//
//    init() {
//    loadData()
//  }
//
//  private func loadData() {
//    db.collection("user").addSnapshotListener { (querySnapshot, error) in // (2)
//      if let querySnapshot = querySnapshot {
//        self.announcements = querySnapshot.documents.compactMap { document -> Announcement? in // (3)
//          try? document.data(as: Announcement.self) // (4)
//        }
//      }
//    }
//  }
//
//  // more code to follow
//}


struct Announcement: Identifiable {
  var id: String = UUID().uuidString
  var name: String
}

class AnnouncementViewModel: ObservableObject {
  @Published var books = [Announcement]()
  
  private var db = Firestore.firestore()
  
  func fetchData() {
    db.collection("announcements").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }

      self.books = documents.map { queryDocumentSnapshot -> Announcement in
        let data = queryDocumentSnapshot.data()
        let name = data["name"] as? String ?? ""
        

        return Announcement(id: .init(), name: name)
      }
    }
  }
}

struct AnnouncementListView: View {
    
    
    //var data = AnnouncementTaskRepository.announcements
    
     @ObservedObject var viewModel = AnnouncementViewModel()
    
    var body: some View {
       

        NavigationView {
            List(viewModel.books) { book in // (2)
            VStack(alignment: .leading) {
                Text(book.name)
                .font(.headline)
            }
          }
          .navigationBarTitle("Books")
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
