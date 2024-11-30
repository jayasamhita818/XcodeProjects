//
//  ClientHome.swift
//  FitzuApp
//
//  Created by HR Ultivic on 03/06/24.
//

import SwiftUI

struct ClientHome: View {
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    @State private var selectedSkillString : String = ""
    @State private var selectedDateString : String = ""
    var body: some View {
        
        ZStack{
            Color.black
            
            VStack(alignment: .center, spacing: 0){
                
                HStack(alignment: .center){
                    Button(action: {
                        menuScreenActive = true
                    }){
                        Image("menu-bar")
                            .resizable()
                            .frame(width: 35,height: 20)
                    }
                    .padding(.leading, 20)
                    
                    
                    Spacer()
                    Image("fitzu_font")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                        .padding(.bottom)
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
                            
                            NavigationLink(destination: SkillTraining(), tag: "SkillTraining", selection: $viewDestination) {
                                Button(action: {
                                    self.viewDestination = "SkillTraining"
                                })
                                {
                                    if selectedSkillString == "" {
                                        Text("Trainer Type")
                                            .font(.custom("Poppins-Bold", size: 20))
                                    } else {
                                        Text(selectedSkillString)
                                            .font(.custom("Poppins-Bold", size: 20))
                                    }
                                    
                                }
                                
                                .frame(width: 170,height: 170)
                                .background(
                                    RoundedRectangle(cornerRadius: 5.0)
                                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                                )
                            }
                            
                                Button(action: {
                                   
                                })
                                {
                                    Text("Where")
                                        .font(.custom("Poppins-Bold", size: 20))
                                }
                                .frame(width: 170,height: 170)
                                .background(
                                    RoundedRectangle(cornerRadius: 5.0)
                                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                                )
                            
                        }
                        HStack(spacing: 10){
                            NavigationLink(destination: SetTrainingTime(selectedDateString: $selectedDateString), tag: "SetTrainingTime", selection: $viewDestination) {
                                Button(action: {
                                    self.viewDestination = "SetTrainingTime"
                                })
                                {
                                    if selectedDateString == "" {
                                        Text("When")
                                            .font(.custom("Poppins-Bold", size: 20))
                                    } else {
                                        Text(selectedDateString)
                                            .font(.custom("Poppins-Bold", size: 20))
                                    }
                                }
                                
                                .frame(width: 170,height: 170)
                                .background(
                                    RoundedRectangle(cornerRadius: 5.0)
                                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                                )
                            }
                            Button(action: {
                                
                            })
                            {
                                Text("Who")
                                    .font(.custom("Poppins-Bold", size: 20))
                            }
                            .frame(width: 170,height: 170)
                            .background(
                                RoundedRectangle(cornerRadius: 5.0)
                                    .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                                )
                        }
                        
                    }
                    
                    VStack{
                        Spacer()
                        
                        if selectedSkillString != "" || selectedDateString != "" {
                            HStack{
                                Button(action: {
                                  //  customAlertActive = true
                                }, label: {
                                    HStack{
                                        Spacer()
                                        Text("SEARCH")
                                            .bold()
                                        Spacer()
                                    }
                                })
                                .foregroundStyle(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .fill(Color(UIColor(named: "button_blue")!))
                                )
                               
                                Button(action: {
                                    selectedSkillString = ""
                                    selectedDateString = ""
                                }, label: {
                                    HStack{
                                        Spacer()
                                        Text("RESET")
                                            .bold()
                                        Spacer()
                                    }
                                })
                                .foregroundStyle(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .fill(Color(UIColor(named: "button_blue")!))
                                )
                                
                            }
                            .frame(width: UIScreen.main.bounds.width - 40)
                            
                            .padding(.bottom, 5)
                        }
                        
                        
                    }
                    
                }
                Text("Find a Trainer to suit you")
                    .font(.custom("Poppins-Bold", size: 20))
                    .foregroundStyle(.white)
                    .padding(.vertical)
            }
            
            if menuScreenActive {
                
                
                ClientMenu(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
                
            }
            
        }
        .animation(.easeInOut, value: menuScreenActive)
        .foregroundColor(.black)
        .background(.black)
        .navigationBarHidden(true)
    }
}

#Preview {
    ClientHome()
}
