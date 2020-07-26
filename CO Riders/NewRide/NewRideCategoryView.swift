//
//  NewRideCategoryView.swift
//  CO Riders
//
//  Created by 18391981 on 24.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI

struct NewRideCategoryView: View {
    
    @ObservedObject var newRideViewModel = NewRideViewModel()
    
    var body: some View {
        
        M7List {
            
            ForEach(self.newRideViewModel.categories, id: \.self) { item in
                
                NavigationLink(destination: NewRideTwoView(category: item), tag: item, selection: self.$newRideViewModel.category) {
                    
                    M7Row(item)
                }
            }
        }.navigationBarTitle("Категория размещения")
    }
}

struct NewRideCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewRideCategoryView()
    }
}
