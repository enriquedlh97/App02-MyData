//
//  EditView.swift
//  App02-MyData
//
//  Created by user189351 on 2/21/21.
//

import SwiftUI

struct EditView: View {
    
    @Binding var name: String
    @Binding var email: String
    
    var body: some View {
        VStack {
            Text("My info")
                .font(.RobotoRegular(size: 32))
                .foregroundColor(Color("Down"))
            Form {
                Section {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name:")
                                .font(.RobotoMono(size: 20))
                                .foregroundColor(Color("Down"))
                            Spacer()
                            TextField("Name", text: $name)
                                .font(.RobotoRegular(size: 20))
                                .foregroundColor(Color("Down"))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Email:")
                                .font(.RobotoMono(size: 20))
                                .foregroundColor(Color("Down"))
                            Spacer()
                            TextField("email", text: $email)
                                .font(.RobotoRegular(size: 20))
                                .foregroundColor(Color("Down"))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    
    @State static var name: String = "John"
    @State static var email: String = "abc@example.com"
    
    static var previews: some View {
        EditView(name: $name, email: $email)
    }
}
