//
//  ContentView.swift
//  App02-MyData
//
//  Created by Enrique Diaz de Leon Hicks on 2/14/21.
//

import SwiftUI

struct MainView: View {
    
    //@State refhreses screen every time this variable changes
    @State var showImage: Bool = false
    @State var name: String = "Enrique Diaz de Leon Hicks"
    @State var email: String = "enriquedlh97@hotmail.com"
    @State var birthDate: Date = Date()
    @State var country: String = "Mexico"

    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                VStack {
                    ZStack {
                        Color("Up")
                        Text("My info")
                            .font(.RobotoMono(size: 50))
                            .padding()
                    }
                }
                VStack {
                    ZStack {
                        Color("Down")
                        VStack {
                            DataView(texto: name, imagen: "person")
                                .padding(.top, 90)
                            DataView(texto: email, imagen: "envelope")
                            DataView(texto: "Aguascalientes", imagen: "house.fill")
                            DataView(texto: "B.S. Business Informatics", imagen: "network")
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
                    showImage.toggle()
                    print("Hola")
                }){
                    Image("Plane")
                        .resizable()
                        .scaledToFit()
                        .frame(width:200)
                }
                
            }
        }
        .sheet(isPresented: $showImage) {
            ImageView()
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


