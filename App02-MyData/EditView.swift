//
//  EditView.swift
//  App02-MyData
//
//  Created by user189351 on 2/21/21.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var name: String
    @Binding var email: String
    @Binding var birthDate: Date
    @Binding var height: Double
    @Binding var weight: Int
    @Binding var healthIndex: Int
    var health: [String]
    @Binding var countryIndex: Int
    var countries: [String]
    
    // Gives format to date
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        VStack {
/*            Text("My info")
                .font(.RobotoRegular(size: 32))
                .foregroundColor(Color("Down"))
 */
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
                        
                        Spacer(minLength: 20)
                                Picker(selection: $countryIndex, label:
                                        Text("Country:")
                                        .font(.RobotoRegular(size: 20))
                                        .foregroundColor(Color("Down"))
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                ) {
                                    ForEach(0 ..< countries.count) { index in
                                        Text(self.countries[index])
                                    }
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
                Section {
                    VStack {
                        HStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color(health[healthIndex]))
                            Text(health[healthIndex])
                                .font(.RobotoRegular(size: 20))
                                .foregroundColor(Color("Down"))
                        }
                        // Picker tipo segmented values
                        Picker(selection: $healthIndex, label:
                                Text("How healthy are you?")
                        ){
                            ForEach(0..<health.count) { index in
                                Text(self.health[index])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
            }
            /*            Button(action: {
             presentationMode.wrappedValue.dismiss()
             }, label: {
             VStack {
             HStack {
             Image(systemName: "xmark.circle.fill")
             .font(.largeTitle)
             .foregroundColor(Color("Up"))
             Text("Save")
             .font(.RobotoRegular(size: 32))
             .foregroundColor(Color("Up"))
             }
             }
             .padding()
             .background(Color("Down"))
             .cornerRadius(40)
             })
             .padding() */
        }
        .navigationBarTitle("Edit - My Info")
 //       .navigationBarTitleDisplayMode(.inline)
    }
}

struct EditView_Previews: PreviewProvider {
    
    @State static var name: String = "John"
    @State static var email: String = "abc@example.com"
    @State static var birthDate: Date = Date()
    @State static var height: Double = 1.80
    @State static var weight: Int = 66
    @State static var healthIndex: Int = 0
    @State static var countryIndex: Int = 0
    
    static var previews: some View {
        EditView(name: $name, email: $email, birthDate: $birthDate, height: $height, weight: $weight, healthIndex: $healthIndex, health: ["Good", "Regular", "Bad"], countryIndex: $countryIndex, countries: ["US", "Canada", "Mexico", "Germany", "Russia", "Italy", "Colombia", "Argentina", "France"])
    }
}
