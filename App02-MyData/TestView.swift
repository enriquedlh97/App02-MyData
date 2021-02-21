//
//  TestView.swift
//  App02-MyData
//
//  Created by user189351 on 2/21/21.
//

import SwiftUI

struct TestView: View {
    
    @State var count: Int = 0
    @State var showView: Bool = false
    
    var body: some View {
        ZStack {
            
            Color(count >= 5 ? .red : .white)
            VStack {
                Button(action: {
                    count += 1
//                    if count >= 3 {
//                        showView.toggle()
//                    }
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 70))
                        .foregroundColor(.blue)
                })
                Text("Contador: \(count)")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding(.top, 40)
                Button(action: {
                    showView.toggle()
                }, label: {
                    Text("Go to new window")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding(.top, 40)
                })
            }
        }
        .sheet(isPresented: $showView, content: {
            Test1View(count: $count)
        })
        .edgesIgnoringSafeArea(.all)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
