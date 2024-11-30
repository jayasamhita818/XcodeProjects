//
//  ClientWallet.swift
//  FitzuApp
//
//  Created by HR Ultivic on 03/06/24.
//

import SwiftUI

struct ClientWallet: View {
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
                        Text("Wallet")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        Button(action: {}){
                            Image("back")
                                .resizable()
                                .frame(width: 30,height: 30)
                            
                        }.hidden()
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    
                    HStack{
                        Image("wallet-filled-money-tool")
                            .resizable()
                            .frame(width: 20,height: 20)
                        
                        Text("Wallet")
                            .font(.custom("Poppins-Regular", size: 17))
                        Spacer()
                        
                        Text("$5000")
                            .font(.custom("Poppins-Bold", size: 17))
                        
                    }
                    .padding()
                    NavigationLink(destination: PaymentMethod(), tag: "PaymentMethod", selection: $viewDestination) {
                        Button(action: {
                            self.viewDestination = "PaymentMethod"
                        }){
                            HStack{
                                Image("card")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                Text("Credit/Debit Card")
                                    .font(.custom("Poppins-Regular", size: 17))
                                Spacer()
                                Image("rightArrowBlack")
                                    .resizable()
                                    .frame(width: 15,height: 15)
                            }
                        }
                    }
                    .padding()
                    NavigationLink(destination: RecentTransactions(), tag: "RecentTransactions", selection: $viewDestination) {
                        Button(action: {
                            self.viewDestination = "RecentTransactions"
                        }){
                            HStack{
                                Image("history (1)")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                Text("Transaction History")
                                    .font(.custom("Poppins-Regular", size: 17))
                                Spacer()
                                Image("rightArrowBlack")
                                    .resizable()
                                    .frame(width: 15,height: 15)
                            }
                        }
                    }
                    .padding()
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
        .background(.black, ignoresSafeAreaEdges: .all)
        .navigationBarHidden(true)
    }
}

#Preview {
    ClientWallet()
}
