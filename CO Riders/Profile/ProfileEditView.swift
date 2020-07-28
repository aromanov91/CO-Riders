//
//  ProfileEditorView.swift
//  CO Riders
//
//  Created by 18391981 on 24.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ProfileEditView: View {
    
    @State var name = ""
    @State var company = ""
    @State var about = ""
    @State var phone = ""
    @State var instagram = ""
    
    var db: Firestore!

    init() {

        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
    }
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 24) {
                
                HStack {
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 68, height: 68)
                        .foregroundColor(Color.gray)
                    
                    M7TextField("Как вас зовут", text: $name)
                    
                }
                
                M7Surface(elevation: .z1, padding: .s) {
                    
                    HStack {
                        
                        M7Text("Если вы представляете компанию, то сможете указать ее позднее в  профиле", style: .paragraph2)
                        Spacer()
                    }
                    
                }
                
                M7TextField("Название компании", text: $company)
                
                M7TextField("Расскажите о себе и услугах, которые вы предоставляете", text: $name)
                
                M7TextField("Номер телефона", text: $name)
                
                M7Button( size: .m, action: {}) {
                    Text("Подключите инстаграм")
                }
                
                M7Button(style: .primary, action: { updateUserId(withUid: "OAZtJy4oBo0hKnNNTRkl", toNewName: name)
                    
                    if company != "" {
                        
                        updateUserField(withUid: "OAZtJy4oBo0hKnNNTRkl", andField: "company", toNewValue: self.company)
                        
                    }
                    
                    
                    
                }
                
                
                ) {
                    Text("Сохранить")
                }
                
            }.padding()
            
        }.navigationBarTitle("Расскажите о себе", displayMode: .inline)
    }
    
  
        func updateUserId(withUid: String, toNewName: String) {
            self.db.collection("users").document(withUid).setData( ["id": toNewName], merge: true)
        }
    
    
            func updateUserField(withUid: String, andField: String, toNewValue: String) {
                self.db.collection("users").document(withUid).setData( [andField: toNewValue], merge: true)
            }
    
}

struct ProfileEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView()
    }
}
