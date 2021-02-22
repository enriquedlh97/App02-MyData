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
    @Binding var birthDate: Date
    @Binding var height: Double
    @Binding var weight: Int
    
    // Gives format to date
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
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
                Section {
                    // Date picker
                    DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                        Text("\(dateFormat.string(from: birthDate))")
                            .font(.RobotoRegular(size: 20))
                            .foregroundColor(Color("Down"))
                    }
                }
                Section {
                    VStack {
                    Text("Height: \(String(format: "%0.2f", height))")
                        .font(.RobotoRegular(size: 20))
                        .foregroundColor(Color("Down"))
                    // Slider
                    Slider(value: $height, in: 0.5...2.6)
                        .padding(.horizontal,40)
                        HStack {
                        Text("Weight: \(weight)")
                            .font(.RobotoRegular(size: 20))
                            .foregroundColor(Color("Down"))
                        // Stepper
                        Stepper(value: $weight, in: 30...100) {
                            Text("")
                                .font(.RobotoRegular(size: 20))
                                .foregroundColor(Color("Down"))
                        }
                        }
                        .padding(.horizontal, 47)
                    }
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    
    @State static var name: String = "John"
    @State static var email: String = "abc@example.com"
    @State static var birthDate: Date = Date()
    @State static var height: Double = 1.80
    @State static var weight: Int = 66
    
    static var previews: some View {
        EditView(name: $name, email: $email, birthDate: $birthDate, height: $height, weight: $weight)
    }
}
