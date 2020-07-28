//
//  RideDetailView.swift
//  CO Riders
//
//  Created by 18391981 on 27.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI

struct RideDetailView: View {
    
    var raide: RideModel
    
    var body: some View {
        
        ScrollView() {
            
            HStack {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    M7Text(raide.name, style: .title1)
                    
                    M7Text(raide.price)
                    
                    M7Text(raide.address)
                    
                }
                
                Spacer()
                
            }.padding()
        }
        
    }
}



struct RideDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RideDetailView(raide: RideModel(id: "", name: "Title", description: "Description", price: "5 545", address: "Address", category: "Прочее", type: "Прочее", serviceType: "Прочее"))
    }
}
