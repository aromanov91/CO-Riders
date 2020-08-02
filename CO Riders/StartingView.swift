//
//  StartingView.swift
//  CO Riders
//
//  Created by 18391981 on 28.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI

struct StartingView: View {
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                M7Text("Добро пожаловать!", style: .largeTitle)
                
                StartingCellView("Расскажите о себе")
                
                StartingCellView("Разместите объявление")
                
                StartingCellView("Общайтесь с клиентами")
                
                StartingCellView("Предоставляйте услуги")
                
                NavigationLink(destination: ProfileEditView()) {
                    Text("Заполнить профиль")
                }
                
            }.padding()
            
        }
        
    }
    
}

struct StartingCellView: View {
    
    
    var label: String
    
    init(_ label: String) {
        self.label = label
    }
    
    
    var body: some View {
        
        NavigationView {
            
            HStack {
                
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundColor(Color.gray)
                
                M7Text(label, style: .subtitle1)
                
                Spacer()
                
                
                
            }
            
        }
        
    }
}

struct StartingView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
