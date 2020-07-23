//
//  RootView.swift
//  CO Riders
//
//  Created by 18391981 on 15.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI

struct RootTabView: View {
    @State private var currentTab = 0

       var body: some View {
           TabView(selection: $currentTab) {
               SearthView()
                   .tabItem {
                       VStack {
                           Image(systemName: "list.bullet.below.rectangle")
                           Text("Поиск")
                       }
                   }.tag(1)
               ProfileNavigationView()
                   .tabItem {
                       VStack {
                           Image(systemName: "person.crop.circle.fill")
                           Text("Профиль")
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
