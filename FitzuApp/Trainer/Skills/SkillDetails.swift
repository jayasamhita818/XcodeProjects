//
//  SkillDetails.swift
//  FitzuApp
//
//  Created by rounak suri on 29/05/24.
//

import SwiftUI

struct SkillDetails: View {
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ScrollView {
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
                    VStack{
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
                            Text("Skill Name")
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
                        .padding(.bottom)
                        
                        VStack(alignment: .leading){
                            
                            Text("Skills")
                            Button(action: {}){
                                HStack{
                                    Text("Sport Skill")
                                        .foregroundColor(.gray.opacity(0.4))
                                    Spacer()
                                    Image("down_arrow")
                                        .resizable()
                                        .frame(width: 15,height: 15)
                                }
                            }
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray.opacity(0.4), lineWidth: 1)
                            )
                            
                            Text("Experience")
                            Button(action: {}){
                                HStack{
                                    Text("Experience")
                                        .foregroundColor(.gray.opacity(0.4))
                                    Spacer()
                                    Image("down_arrow")
                                        .resizable()
                                        .frame(width: 15,height: 15)
                                }
                            }
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray.opacity(0.4), lineWidth: 1)
                            )
                            
                            Text("Upload Cerificate(PDF,PNG etc)")
                            Button(action: {}){
                                
                                    Image("sidebar-bg")
                                        .resizable()
                                        .frame(height: 200)
                                
                            }
                            .cornerRadius(20)
                            
                        }
                        
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                        
                        
                    }
                    .background(.white)
                }
                if menuScreenActive {
                    
                    
                    MenuScreen(menuScreenActive: $menuScreenActive)
                        .transition(.move(edge: .bottom))
                    
                }
                
            }
             .animation(.easeInOut, value: menuScreenActive)
            .navigationBarHidden(true)
            .background(.black, ignoresSafeAreaEdges: .all)
        }
    }
}

#Preview {
    SkillDetails()
}
