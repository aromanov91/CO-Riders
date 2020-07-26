//
//  NewRideTreeView.swift
//  CO Riders
//
//  Created by 18391981 on 26.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI

struct NewRideTreeView: View {
    
    var category = ""
    
    var type = ""
    
    @ObservedObject var newRideViewModel = NewRideViewModel()
    
    var body: some View {
        
        M7List {
            
            ForEach(self.newRideViewModel.serviceTypes, id: \.self) { item in
                
                NavigationLink(destination: NewRideCreateFormView(category: category, type: type, serviceType: item),
                               tag: item,
                               selection: self.$newRideViewModel.serviceType) {
                    
                    M7Row(item)
                }
            }
        }.navigationBarTitle("Тип услуги")
    }
}

struct NewRideTreeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRideTreeView()
    }
}
