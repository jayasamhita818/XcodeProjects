//
//  HomeScreen.swift
//  FitzuApp
//
//  Created by rounak suri on 27/05/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var viewDestination: String? = nil
    
    @State private var menuScreenActive: Bool = false
    
    var body: some View {
        NavigationStack {
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
                    Text("Time to Train!")
                        .font(.custom("Poppins-Bold", size: 20))
                        .foregroundColor(.white)
                    
                    ZStack{
                        Image("bg_image_1")
                            .resizable()
                            .padding(.bottom)
                            .scaledToFill()
                            .blur(radius: 2)
                        VStack(spacing: 10){
                            HStack(spacing: 10){
                                
                                
                                NavigationLink(destination: Sessions(), tag: "Sessions", selection: $viewDestination) {
                                    
                                    Button(action: {
                                        self.viewDestination = "Sessions"
                                    })
                                    {
                                        Text("View Session")
                                            .font(.custom("Poppins-Bold", size: 20))
                                    }
                                    
                                    .frame(width: 170,height: 170)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5.0)
                                            .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                                    )
                                    
                                }
                                
                                NavigationLink(destination: ManageAvailability(), tag: "ManageAvailability", selection: $viewDestination) {        Button(action: {
                                    self.viewDestination = "ManageAvailability"
                                })
                                    {
                                        Text("Manage Availability")
                                            .font(.custom("Poppins-Bold", size: 20))
                                    }
                                    .frame(width: 170,height: 170)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5.0)
                                            .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                                    ) }
                                
                            }
                            HStack(spacing: 10){
                                
                                NavigationLink(destination: ReportsByDate(), tag: "ReportsByDate", selection: $viewDestination) {
                                    Button(action: {
                                        self.viewDestination = "ReportsByDate"
                                    })
                                    {
                                        Text("Reports")
                                            .font(.custom("Poppins-Bold", size: 20))
                                    }
                                    
                                    .frame(width: 170,height: 170)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5.0)
                                            .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                                    )
                                }
                                
                                NavigationLink(destination: MessagesList(), tag: "MessagesList", selection: $viewDestination) {
                                    Button(action: {
                                        self.viewDestination = "MessagesList"
                                    })
                                    {
                                        Text("Messages")
                                            .font(.custom("Poppins-Bold", size: 20))
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
}
#Preview {
    HomeScreen()
}
