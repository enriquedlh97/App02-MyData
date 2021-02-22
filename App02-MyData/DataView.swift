//
//  DataView.swift
//  App02-MyData
//
//  Created by user189351 on 2/17/21.
//

import SwiftUI

struct DataView: View {
    
    var texto: String = "Hello"
    var imagen: String = "person.fill"
    
    var body: some View {
        HStack {
            Image(systemName: imagen)
                .font(.title)
                .foregroundColor(.white)
            Spacer()
            Text(texto)
                .font(.RobotoRegular(size: 20))
                .padding()
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
