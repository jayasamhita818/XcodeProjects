//
//  Booking.swift
//  FitzuApp
//
//  Created by rounak suri on 03/06/24.
//

import SwiftUI

struct Booking: View {
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        
        ZStack{
            Color.black
            
            VStack(alignment: .center){
                
                HStack(alignment: .center){
                    Button(action: {
                        menuScreenActive = true
                    }){
                        Image("menu-bar")
                            .resizable()
                            .frame(width: 35,height: 20)
                    }
                    .padding(.leading)
                    
                    Spacer()
                    Image("fitzu_font")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                        .padding(.bottom)
                        .padding(.top)
                    Spacer()
                    NavigationLink(destination: NotificationScreen(), tag: "NotificationScreen", selection: $viewDestination) {
                        Button(action: {
                            self.viewDestination = "NotificationScreen"
                        }, label: {
                            Image("bell-icon")
                                .resizable()
                                .frame(width: 30,height: 30)
                        })
                        .padding(.trailing)
                        
                    }
                }
                VStack(spacing: 20){
                    HStack(alignment: .center){
                        Spacer()
                        Text("Booking Confirmed")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    
                    Text("Session ID: 223445545")
                        .font(.custom("Poppins-Medium", size: 15))
                    
                    VStack(alignment: .leading){
                        Text("Awesome!, Your session with Sahil is now confirmed. Let your Trainer scan this barcode to begin the session")
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    
                    Image("QR_code")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.6 , height: UIScreen.main.bounds.width * 0.6)
                    VStack(alignment: .leading){
                        Text(verbatim: "A calender reminder has also been sent to sahilbisht@gmail.com so you'll be on time!")
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .foregroundStyle(.black)
                    
                    
                    Spacer()
                    HStack(spacing: 60){
                        
                        NavigationLink(destination: ClientHome(), tag: "ClientHome", selection: $viewDestination) {
                            Button(action: {
                                self.viewDestination = "ClientHome"
                            }) {
                                Text("HOME")
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .background(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color(UIColor(named: "button_blue")!))
                            )
                        }
                       
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("SESSION")
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 30)
                            .background(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color(UIColor(named: "button_blue")!))
                            )
                        
                    }
                    .padding(.bottom, 20)
                    
                }
                .background(.white)
            }
            if menuScreenActive {
                
                
                ClientMenu(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
                
            }
            
        }
        .animation(.easeInOut, value: menuScreenActive)
        .background(.black, ignoresSafeAreaEdges: .all)
        .navigationBarHidden(true)
    }
}

#Preview {
    Booking()
}
