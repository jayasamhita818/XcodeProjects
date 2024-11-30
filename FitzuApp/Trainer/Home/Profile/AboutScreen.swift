//
//  AboutScreen.swift
//  FitzuApp
//
//  Created by rounak suri on 13/06/24.
//

import SwiftUI

struct AboutScreen: View {
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
                        Text("Gallery")
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
                    
                    ScrollView{
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.")
                            .padding(10)
                    }
                    .border(Color.gray, width: 1)
                                .background(Color.white)
                                .padding(.top,30)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                                .frame(height: 250)
                    Spacer()
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        Text("SAVE")
                            .foregroundStyle(.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 30)
                            .font(.custom("Poppins-Medium", size: 17))
                            .background(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color(UIColor(named: "button_blue")!))
                            )
                        
                        
                    }
                    .padding(.bottom,30)
                }
                .background(.white)
                
                
            }
            if menuScreenActive {
                MenuScreen(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
                
            }
        }
        .background(.black, ignoresSafeAreaEdges: .all)
        .animation(.easeInOut, value: menuScreenActive)
        .navigationBarHidden(true)
    }
}

#Preview {
    AboutScreen()
}
