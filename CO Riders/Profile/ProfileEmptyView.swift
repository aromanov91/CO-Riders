//
//  ProfileEmptyView.swift
//  CO Riders
//
//  Created by 18391981 on 24.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI

struct ProfileEmptyView: View {
    var body: some View {
        
        
        
        ScrollView {
            
            
            UserInformationLinkView().padding()
            
            Spacer()
            
            VStack {
                
                HStack {
                    
                    M7Text("Вы еще не разместили ни одного объявления", style: .title1).frame(width: 300.0)
                    
                }
                Spacer()
                M7Text("Расскажите миру о своих услугах. Расместите объявление и найдите новых клиентов!", style: .paragraph1).frame(width: 300.0)
                Spacer()
                M7Button(style: .primary, action: {}) {
                    Text("Новое объявление")
                }.frame(width: 300.0)
                
            }
            
            Spacer()
            
        }//.navigationBarTitle("Профиль")
    }
    
}



struct ProfileEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEmptyView()
    }
}
