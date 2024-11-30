//
//  ManageAvailability.swift
//  FitzuApp
//
//  Created by rounak suri on 29/05/24.
//

import SwiftUI

struct ManageAvailability: View {
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
                .frame(width: UIScreen.main.bounds.width)
                VStack(spacing: 0){
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
                        Text("Manage Availability")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        Button(action: {}){
                            Image("back")
                                .resizable()
                                .frame(width: 20,height: 20)
                            
                        }.hidden()
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    .frame(width: UIScreen.main.bounds.width)
                    ZStack{
                        Image("bg_image_1")
                            .resizable()
                            .padding(.bottom)
                            .scaledToFill()
                            .blur(radius: 2)
                        
                        HStack(spacing: 10){
                            
//                            NavigationLink(destination: Location(), tag: "Location", selection: $viewDestination) {
                                
                                Button(action: {
//                                    self.viewDestination = "Location"
                                })
                                {
                                    Text("MANAGE LOCATION")
                                        .font(.custom("Poppins-Bold", size: 20))
                                        .frame(width: 170,height: 170)
                                }
                                
                                .frame(width: 170,height: 170)
                                .background(
                                    RoundedRectangle(cornerRadius: 5.0)
                                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                                )
                                
//                            }
                            
                            
                            NavigationLink(destination: Schedule(), tag: "Schedule", selection: $viewDestination) {
                                
                                Button(action: {
                                    self.viewDestination = "Schedule"
                                })
                                {
                                    Text("MANAGE SCHEDULE")
                                        .font(.custom("Poppins-Bold", size: 20))
                                        .frame(width: 170,height: 170)
                                }
                                .frame(width: 170,height: 170)
                                .background(
                                    RoundedRectangle(cornerRadius: 5.0)
                                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                                )
                                
                            }
                            
                        }
                        
                        
                        
                        
                    }
                }
            }
            if menuScreenActive {
                
                
                MenuScreen(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
                
            }
            
        }
         .animation(.easeInOut, value: menuScreenActive)
        .navigationBarHidden(true)
        .foregroundColor(.black)
        .background(.black, ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    ManageAvailability()
}
