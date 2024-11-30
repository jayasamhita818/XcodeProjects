//
//  RecentTransactions.swift
//  FitzuApp
//
//  Created by rounak suri on 28/05/24.
//

import SwiftUI

struct RecentTransactions: View {
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
                        Text("Recent Transactions")
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
                        
                        NavigationLink(destination: TransactionDetail(), tag: "TransactionDetail", selection: $viewDestination) {
                            Button(action: {
                                self.viewDestination = "TransactionDetail"
                            }){
                                HStack{
                                    Image("2380")
                                        .resizable()
                                        .frame(width: 100,height: 100)
                                        .cornerRadius(50)
                                    
                                    VStack(alignment: .leading){
                                        Text("Session charges received from Stephen")
                                            .font(.custom("Poppins-Bold", size: 15))
                                            .padding(.bottom)
                                        Text("21 Aug, 12:30 AM")
                                    }
                                    Spacer()
                                    VStack{
                                        Text("$80")
                                            .font(.custom("Poppins-Medium", size: 20))
                                            .padding(.top)
                                        Spacer()
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.vertical,5)
                            }
                            .background(Color.gray.opacity(0.2))
                        }
                        .padding(.top, 10)
                        Button(action: {
                            
                        }){
                            HStack{
                                Image("2380")
                                    .resizable()
                                    .frame(width: 100,height: 100)
                                    .cornerRadius(50)
                                
                                VStack(alignment: .leading){
                                    Text("Session charges received from Stephen")
                                        .font(.custom("Poppins-Bold", size: 15))
                                        .padding(.bottom)
                                    Text("21 Aug, 12:30 AM")
                                }
                                Spacer()
                                VStack{
                                    Text("$80")
                                        .font(.custom("Poppins-Medium", size: 20))
                                        .padding(.top)
                                    Spacer()
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.vertical,5)
                            
                        }
                        .background(Color.gray.opacity(0.2))
                        
                    }
                    
                    .background(.white)
                    
                }
                .background(.white)
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
        .foregroundColor(.black)
        .background(.black,ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    RecentTransactions()
}
