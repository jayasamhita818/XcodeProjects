//
//  Settings.swift
//  FitzuApp
//
//  Created by rounak suri on 03/06/24.
//

import SwiftUI

struct SettingsScreen: View {
    @StateObject private var loginManager = LoginManager()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    
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
                        Text("Settings")
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
                    .zIndex(1.0)
                    .padding(.bottom, -20)
                    List{
                        HStack(spacing: 20){
                            Image("2380")
                                .resizable()
                                .frame(width: 100,height: 100)
                                .cornerRadius(50)
                            VStack(alignment: .leading){
                                Text("Sahil Bisht")
                                    .font(.custom("Poppins-Bold", size: 21))
                                Text(verbatim: "sahil123@gmail.com")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                            }
                        }
                        .listRowSeparator(.hidden)
                        
                            Button(action: { self.viewDestination = "BlockList" }){
                                HStack{
                                    Text("Block List")
                                    Spacer()
                                    Image("rightArrowBlack")
                                        .resizable()
                                        .frame(width: 15,height: 15)
                                }
                            }
                        
                        Button(action: {}){
                            HStack{
                                Text("Contact Us")
                                Spacer()
                                Image("rightArrowBlack")
                                    .resizable()
                                .frame(width: 15,height: 15)                            }
                        }
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                            HStack{
                                Text("Privacy Policy")
                                Spacer()
                                Image("rightArrowBlack")
                                    .resizable()
                                    .frame(width: 15,height: 15)
                            }
                        }
                        
                        
                    }
                    .scrollContentBackground(.hidden)
                    .zIndex(0.0)
                    .foregroundStyle(.black)
                    .scrollDisabled(true)
                    
                    Spacer()
                    NavigationLink(destination: AccountType(), tag: "AccountType", selection: $viewDestination) {
                    Button(action: {
                        self.viewDestination = "AccountType"
                        loginManager.setLogin(false)
                    }, label: {
                        Text("LOGOUT")
                            .foregroundStyle(.white)
                            .bold()
                    })
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color(UIColor(named: "button_blue")!))
                    )
                    .padding(.bottom, 30)
                    
                }
                }
                .background(.white)
                
                if loginManager.selectedProfession == "Client"{
                    Text("Find a Trainer to suit you")
                        .font(.custom("Poppins-Bold", size: 20))
                        .foregroundStyle(.white)
                        .padding(.vertical)
                }
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
            .navigationBarHidden(true)
            .background(.black, ignoresSafeAreaEdges: .all)
        NavigationLink(destination: BlockList(), tag: "BlockList", selection: $viewDestination) {
            EmptyView()
            
    
        }
    }
}

#Preview {
    SettingsScreen()
}
