//
//  NotificationScreen.swift
//  FitzuApp
//
//  Created by rounak suri on 03/06/24.
//

import SwiftUI

struct NotificationScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        @State private var menuScreenActive: Bool = false
    @StateObject private var loginManager = LoginManager()
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
                        Button(action: {}, label: {
                            Image("bell-icon")
                                .resizable()
                                .frame(width: 30,height: 30)
                        })
                        .padding(.trailing)
                    }
                    VStack(spacing: 20){
                        HStack(alignment: .center){
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }){
                                Image("back")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                
                            }
                            .padding(.leading)
                            Spacer()
                            Text("Notifications")
                                .font(.custom("Poppins-Bold", size: 20))
                            Spacer()
                            Button(action: {}){
                                Image("back")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                
                            }.hidden()
                        }
                        .padding(.vertical)
                        .background(.navigationBar)
                        
                        Button(action: {
                            
                        }){
                            HStack(alignment: .center){
                                Image("2380")
                                    .resizable()
                                    .frame(width: 70,height: 70)
                                    .cornerRadius(50)
                                
                                VStack(alignment: .leading){
                                    
                                    HStack{
                                        Text("David")
                                        Spacer()
                                        Text("21 Aug, 12:30 AM")
                                    }
                                    
                                    .padding(.bottom,2)
                                    
                                    HStack{
                                        Text("jksd bcj k bsdj kbvkjd svjkb dsbv jksv jkjsbc jkd bcjbd hsvchjd sbcjh dscb")
                                            .font(.custom("Poppins-Regular", size: 12))
                                        Spacer()
                                        
                                        Circle()
                                            .frame(height: 10)
                                            .foregroundColor(.green)
                                    }
                                }
                                .font(.custom("Poppins-Regular", size: 15))
                                .padding(.leading,5)
                                Spacer()
                                
                            }
                            
                            .padding(.horizontal)
                            .padding(.vertical,15)
                            .background(Color.gray.opacity(0.2))
                            
                            
                        }
                        Button(action: {
                            
                        }){
                            HStack(alignment: .center){
                                Image("2380")
                                    .resizable()
                                    .frame(width: 70,height: 70)
                                    .cornerRadius(50)
                                
                                VStack(alignment: .leading){
                                    
                                    HStack{
                                        Text("David")
                                        Spacer()
                                        Text("21 Aug, 12:30 AM")
                                    }
                                    
                                    .padding(.bottom,2)
                                    
                                    HStack{
                                        Text("jksd bcj k bsdj kbvkjd svjkb dsbv jksv jkjsbc jkd bcjbd hsvchjd sbcjh dscb")
                                            .font(.custom("Poppins-Regular", size: 12))
                                        Spacer()
                                        
                                        Circle()
                                            .frame(height: 10)
                                            .foregroundColor(.green)
                                    }
                                }
                                .font(.custom("Poppins-Regular", size: 15))
                                .padding(.leading,5)
                                Spacer()
                                
                            }
                            
                            .padding(.horizontal)
                            .padding(.vertical,15)
                            .background(Color.gray.opacity(0.2))
                            
                            
                        }
                        Spacer()
                    }
                    //.frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.black)
                    .background(.white)
                    
//                    Text("Find a Trainer to suit you")
//                        .font(.custom("Poppins-Bold", size: 20))
//                        .foregroundStyle(.white)
//                        .padding(.vertical)
                }
                
                if menuScreenActive {
                    if loginManager.selectedProfession == "Client"{
                        ClientMenu(menuScreenActive: $menuScreenActive)
                            .transition(.move(edge: .bottom))
                    } else {
                        MenuScreen(menuScreenActive: $menuScreenActive)
                            .transition(.move(edge: .bottom))
                    }
                }
                
            }
            .animation(.easeInOut, value: menuScreenActive)
            .background(.black, ignoresSafeAreaEdges: .all)
            .navigationBarHidden(true)
        }
    }

#Preview {
    NotificationScreen()
}
