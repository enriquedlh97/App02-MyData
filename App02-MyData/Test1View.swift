//
//  Test1View.swift
//  App02-MyData
//
//  Created by user189351 on 2/21/21.
//

import SwiftUI

struct Test1View: View {
    
    @Binding var count: Int
    
    var body: some View {
            VStack {
                Button(action: {
                    count += 1
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 70))
                        .foregroundColor(.red)
                })
                Text("Contador: \(count)")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding(.top, 40)
            }
    }
}

struct Test1View_Previews: PreviewProvider {
    
    @State static var count = 0
    
    static var previews: some View {
        Test1View(count: $count)
    }
}
