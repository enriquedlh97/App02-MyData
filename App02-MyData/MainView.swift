//
//  ContentView.swift
//  App02-MyData
//
//  Created by Enrique Diaz de Leon Hicks on 2/14/21.
//

import SwiftUI

struct MainView: View {
    
    //@State refhreses screen every time this variable changes
//    @State var showImage: Bool = false
//    @State var showEdit: Bool = false
    @State var showSheet: Bool = false
    @State var activeSheet: ActiveSheet?
    @State var name: String = "Enrique Diaz de Leon Hicks"
    @State var email: String = "enriquedlh97@hotmail.com"
    @State var country: String = "Mexico"
    @State var birthDate: Date = Date()
    @State var height: Double = 1.7245
    @State var weight: Int = 66
    @State var healthIndex: Int = 0
    @State var countryIndex: Int = 0
    
    let health = ["Good", "Regular", "Bad"]
    let countries = ["US", "Canada", "Mexico", "Germany", "Russia", "Italy", "Colombia", "Argentina", "France"]
    
    
    // Gives format to date
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack(spacing: 0) {
                    VStack {
                        ZStack {
                            Color("Up")
                            Text("My info")
                                .font(.RobotoMono(size: 35))
                                .padding()
                        }
                    }
                    .frame(height: geo.size.height / 3)
                    VStack {
                        ZStack {
                            Color("Down")
                            VStack {
                                DataView(texto: name, imagen: "person")
                                    .padding(.top, 140)
                                DataView(texto: email, imagen: "envelope")
                                DataView(texto: country, imagen: "house")
                                DataView(texto: "\(dateFormat.string(from: birthDate))", imagen: "calendar")
                                HStack {
                                    Image(systemName: "heart.fill")
                                        .font(.title)
                                        .foregroundColor(Color(health[healthIndex]))
                                    Spacer()
                                    Text("Height: \(String(format: "%0.2f", height)) - Weight: \(weight)")
                                        .font(.RobotoRegular(size: 20))
                                        .padding()
                                    Spacer()
                                }
                                .padding(.horizontal)
                                Spacer()
                                Button(action: {
                                    activeSheet = .edit
                                    showSheet.toggle()
                                }, label: {
                                    HStack {
                                        Image(systemName: "pencil")
                                            .foregroundColor(Color("Down"))
                                        Text("Edit")
                                            .font(.RobotoRegular(size: 20))
                                            .foregroundColor(Color("Down"))
                                    }
                                    .padding(10)
                                    .background(Color("Up"))
                                    .cornerRadius(20)
                                })
                                .padding(.bottom, 80)
                            }
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                VStack {
                    Button(action: {
                        activeSheet = .image
                        showSheet.toggle()
                        print("Hola")
                    }){
                        Image("Plane")
                            .resizable()
                            .scaledToFit()
                            .frame(width:200)
                    }
                    .frame(height: geo.size.height / 3*2)
                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
                .sheet(isPresented: $showSheet) {
                    if activeSheet == .edit {
                        EditView(name: $name, email: $email, birthDate: $birthDate, height: $height, weight: $weight, healthIndex: $healthIndex, health: health, countryIndex: $countryIndex, countries: countries)
                    } else {
                        ImageView()
                    }
                }
                //        .sheet(isPresented: $showImage) {
                //                    ImageView()
                //                }
            }
        }
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


