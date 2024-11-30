//
//  Message.swift
//  FitzuApp
//
//  Created by rounak suri on 03/06/24.
//

import SwiftUI

struct Messages: View {
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
                        Text("Messages")
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
                    
                    Text("Trainer Messages")
                    
                    ScrollView{
                    
                        NavigationLink(destination: MessageChat(), tag: "MessageChat", selection: $viewDestination) {
                            Button(action: {
                                self.viewDestination = "MessageChat"
                            }){
                                HStack(alignment: .center){
                                    Image("2380")
                                        .resizable()
                                        .frame(width: 70,height: 70)
                                        .cornerRadius(50)
                                    VStack{
                                        HStack{
                                            Text("David")
                                                .font(.custom("Poppins-Medium", size: 15))
                                                .padding(.bottom,2)
                                            Spacer()
                                            Text("21th August")
                                                .font(.system(size: 15))
                                            
                                        }
                                        
                                        
                                        
                                        HStack(alignment: .bottom){
                                            
                                            Text("c s djkv bds jc dhdsjv jdk sbjd jdb jh jdk j j jdv  d kjd jkd jkvd jkds jkds vjks jfv kj jk vk k kj ")
                                                .padding(.trailing,12)
                                            Spacer()
                                            Text("12:30 AM")
                                            
                                        }
                                        .font(.system(size: 15))
                                    }
                                    .padding(.leading,5)
                                }
                                .padding(.horizontal)
                                
                            }
                            .frame(maxWidth: .infinity,maxHeight: 80, alignment: .leading)
                            .padding(.vertical,10)
                            .background(Color.gray.opacity(0.2))
                        }
                    }
                    
                    Spacer()
                }
                    .foregroundStyle(.black)
                    .background(.white)
                    
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
            .navigationBarHidden(true)
            .background(.black, ignoresSafeAreaEdges: .all)
                
    }
}

#Preview {
    Messages()
}
