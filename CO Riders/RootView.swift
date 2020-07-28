//
//  RootView.swift
//  CO Riders
//
//  Created by 18391981 on 15.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI
import Combine

class RootTabViewModel: ObservableObject {
    @Published var currentTab = 0
}



struct RootTabView: View {
    
    @State var currentTab = 0

    @EnvironmentObject var viewModel: RootTabViewModel

       var body: some View {
        TabView(selection: $currentTab) {
            
               SearthView()
                   .tabItem {
                       VStack {
                           Image(systemName: "list.bullet.below.rectangle")
                           M7Text("Поиск")
                       }
                   }.tag(1)
            
               ProfileNavigationView()
                   .tabItem {
                       VStack {
                           Image(systemName: "person.crop.circle.fill")
                           M7Text("Профиль")
                       }
                   }.tag(2)
           }
       }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
