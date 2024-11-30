//
//  QRCodeStartSession.swift
//  FitzuApp
//
//  Created by HR Ultivic on 12/06/24.
//

import SwiftUI

struct QRCodeStartSession: View {
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
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Image("back")
                                .resizable()
                                .frame(width: 20,height: 20)
                            
                        }
                        .padding(.leading)
                        Spacer()
                        Text("TIME TO TRAIN!")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Image("back")
                                .resizable()
                                .frame(width: 20,height: 20)
                            
                        }
                        .padding(.trailing)
                        .hidden()
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    
                    VStack{
                        Text("Hi ") + Text("Stephhen").bold() + Text(" your Fitzu")
                        Text("session with ") + Text("Sahil Bisht").bold()
                        Text("start at ") + Text("9AM").bold()
                        
                        Text("Show this QR Code to your")
                            .padding(.top)
                        Text("trainer when you meet up to")
                        Text("start the session!")
                        
                        Image("QR_code")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.6 , height: UIScreen.main.bounds.width * 0.6)
                            .padding()
                        
                        HStack{
                            Button(action: {}){
                                Text("Click here")
                                    .bold()
                                    .foregroundStyle(.buttonBlue)
                            }
                            
                            Text("to see your trainer's location")
                        }
                        .font(.system(size: 20))
                    }
                    Spacer()
                    NavigationLink(destination: TrainingTime(), tag: "TrainingTime", selection: $viewDestination) {
                        Button(action: {
                            self.viewDestination = "TrainingTime"
                        }) {
                            Text("START SESSION")
                                .foregroundStyle(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 40)
                                .bold()
                                .background(
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .fill(Color(UIColor(named: "button_blue")!))
                                )
                        }
                        .padding()
                    }
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
    QRCodeStartSession()
}
