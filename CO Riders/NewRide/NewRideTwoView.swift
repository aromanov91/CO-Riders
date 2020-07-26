//
//  NewRideSportView.swift
//  CO Riders
//
//  Created by 18391981 on 25.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI

struct NewRideTwoView: View {
    
    let category: String?
    
    @ObservedObject var newRideViewModel = NewRideViewModel()
    
    var number = 0
    
    init(category: String) {
        self.category = category
        
        for (index, element) in newRideViewModel.categories.enumerated() {
            
            if element == category {
                self.number = index
            }
        }
    }
    
    var body: some View {
        
        M7List {
            
            ForEach(self.newRideViewModel.subcategories[number], id: \.self) { item in
                
                
                if self.number < 3 {
                
                NavigationLink(destination: NewRideTreeView(category: category ?? "nil", type: item), tag: item, selection: self.$newRideViewModel.subcategory) {
                    
                    M7Row(item)
                }
                    
                } else {
                    
                    NavigationLink(destination: NewRideCreateFormView(category: category ?? "nil", type: item), tag: item, selection: self.$newRideViewModel.subcategory) {
                        
                        M7Row(item)
                    }

                }
            }
            
            if self.number < 5 {
                NavigationLink(destination: NewRideCreateFormView(category: category ?? "nil", type: "Прочее")) {
                    
                    M7Row("Прочее")
                }
            }
            
            
        }.navigationBarTitle(category ?? "Категория")
        
    }
}
//
//struct NewRideSportView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewRideTwoView(category: "LLL")
//    }
//}
