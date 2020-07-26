//
//  NewRideCreateFormView.swift
//  CO Riders
//
//  Created by 18391981 on 26.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI

struct NewRideCreateFormView: View {
    
    var category = ""
    
    var type = ""
    
    var body: some View {
        HStack {
            Text(category)
            Text(type)
        }
    }
}

struct NewRideCreateFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewRideCreateFormView()
    }
}
