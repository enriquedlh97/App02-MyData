//
//  ImageView.swift
//  App02-MyData
//
//  Created by user189351 on 2/17/21.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        ZStack {
            Color("Down")
            VStack {
                Image("BigPlane")
                    .resizable()
                    .scaledToFit()
                Text("Have a nice day!")
                    .font(.RobotoRegular(size: 30))
                    .padding()
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}


