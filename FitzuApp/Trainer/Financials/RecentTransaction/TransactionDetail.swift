//
//  TransactionDetail.swift
//  FitzuApp
//
//  Created by rounak suri on 28/05/24.
//

import SwiftUI

struct TransactionDetail: View {
    @StateObject private var loginManager = LoginManager()
    @State private var menuScreenActive: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
                        Text("Details")
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
                    
                    HStack{
                        Spacer()
                        VStack(alignment: .center,spacing: 10)
                        {
                            Image("2380")
                                .resizable()
                                .frame(width: 100,height: 100)
                                .cornerRadius(50)
                                .padding()
                            Text("Stephen")
                            Text("$80")
                                .font(.custom("Poppins-Bold", size: 30))
                            Text("for session")
                            Text("21th August,12:30 AM")
                                .padding(.vertical)
                            
                            HStack(alignment: .center){
                                VStack(spacing: 10){
                                    Text("Session ID")
                                    Text("Charge ID")
                                    Text("Stripe ID")
                                    Text("Referral Code")
                                }
                                VStack(spacing: 10){
                                    Text(":")
                                    Text(":")
                                    Text(":")
                                    Text(":")
                                }
                                VStack(spacing: 10){
                                    Text("2343244")
                                    Text("aman21324")
                                    Text("aman21324")
                                    Text("A678C65E")
                                }
                            }
                            .padding(.bottom, 20)
                          
                        }
                        Spacer()
                    }
                    .background(.gray.opacity(0.2))
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Button(action: {}, label: {
                            Text("Get help")
                                .bold()
                                .font(.system(size: 12))
                        })
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color(UIColor(named: "button_blue")!))
                        )
                        .foregroundColor(.white)
                        .padding(.trailing)
                    }
                }
                .padding(.bottom,10)
                .background(.white)
                
            }
            .padding(.bottom)
            
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
        .foregroundColor(.black)
        .background(.black, ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    TransactionDetail()
}
