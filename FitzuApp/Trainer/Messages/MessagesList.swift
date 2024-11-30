//
//  MessagesList.swift
//  FitzuApp
//
//  Created by rounak suri on 29/05/24.
//

import SwiftUI

struct MessagesList: View {
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
                        Text("Messages")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        Button(action: {}){
                            Image("cancelll")
                                .resizable()
                                .frame(width: 20,height: 20)
                                .rotationEffect(Angle(degrees: 45))
                                .padding(.trailing)
                            
                        }.hidden()
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                   
                    ScrollView {
                        HStack{
                            Spacer()
                            Text("Client Messages")
                                .font(.custom("Poppins-Medium", size: 17))
                            Spacer()
                        }
                        .padding(.top)
                        
                        NavigationLink(destination: MessageChat(), tag: "MessageChat", selection: $viewDestination) {
                            Button(action: {
                                self.viewDestination = "MessageChat"
                            }){
                                HStack{
                                    Image("2380")
                                        .resizable()
                                        .frame(width: 70,height: 70)
                                        .cornerRadius(50)
                                        .padding(.trailing)
                                        .padding(.vertical,2)
                                    VStack{
                                        HStack(alignment: .top){
                                            Text("ClientName")
                                                .font(.custom("Poppins-Bold", size: 17))
                                            Spacer()
                                            Text("09th August")
                                        }
                                        .padding(.bottom, 5)
                                        HStack(alignment: .bottom){
                                            Text("kjsdbk sdnvs ds sdvsk s  jd j kjfdvnd v jkdfvjkf vjnbvndfs vvjk sd hbv n nm")
                                            Spacer()
                                            Text("09:30 AM")
                                                .font(.system(size: 12))
                                        }
                                    }
                                    .frame(height: 75)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.vertical,5)
                            }
                            .padding(.vertical,5)
                            .background(Color.gray.opacity(0.2))
                        }
                        Button(action: {}){
                            HStack{
                                Image("2380")
                                    .resizable()
                                    .frame(width: 70,height: 70)
                                    .cornerRadius(50)
                                    .padding(.trailing)
                                    .padding(.vertical,2)
                                VStack{
                                    HStack(alignment: .top){
                                        Text("ClientName")
                                            .font(.custom("Poppins-Bold", size: 17))
                                        Spacer()
                                        Text("09th August")
                                    }
                                    .padding(.bottom, 5)
                                    HStack(alignment: .bottom){
                                        Text("kjsdbk sdnvs ds sdvsk s  jd j kjfdvnd v jkdfvjkf vjnbvndfs vvjk sd hbv n nmxvcfdsv f vb ff fgbfgbfg f fdv")
                                        Spacer()
                                        Text("09:30 AM")
                                            .font(.system(size: 12))
                                    }
                                }
                                .frame(height: 75)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.vertical,5)
                        }
                        
                        
                        
                        .padding(.vertical,5)
                        .background(Color.gray.opacity(0.2))
                    }
                    .foregroundColor(.black)
                    .background(.white)
                    
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
    MessagesList()
}
