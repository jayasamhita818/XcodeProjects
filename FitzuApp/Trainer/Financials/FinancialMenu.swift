//
//  FinancialMenu.swift
//  FitzuApp
//
//  Created by rounak suri on 28/05/24.
//

import SwiftUI

struct FinancialMenu: View {
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
                    Text("Financials")
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
                    NavigationLink(destination: RecentTransactions(), tag: "RecentTransactions", selection: $viewDestination) {
                        Button(action: {
                            self.viewDestination = "RecentTransactions"
                        }){
                            HStack(alignment: .center){
                                
                                Image("history (1)")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                
                                Text("Recent Transactions")
                                Spacer()
                                Image("rightArrowBlack")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                            }
                        }
                    }
                    .padding(.bottom,10)
                    NavigationLink(destination: ReportsByDate(), tag: "ReportsByDate", selection: $viewDestination) {
                        Button(action: {
                            self.viewDestination = "ReportsByDate"
                        }){
                            HStack(alignment: .center){
                                Image(systemName: "list.bullet.rectangle.portrait.fill")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                
                                Text("Reports")
                                Spacer()
                                Image("rightArrowBlack")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                            }
                        }
                    }
                    .padding(.bottom)
                   
                    //                    Button(action: {}){
                    //                        HStack(alignment: .center){
                    //
                    //                            Image("bank")
                    //                                .resizable()
                    //                                .frame(width: 30,height: 30)
                    //
                    //                            Text("Bank Details")
                    //                            Spacer()
                    //                            Image("rightArrowBlack")
                    //                                .resizable()
                    //                                .frame(width: 20,height: 20)
                    //                        }
                    //                    }
                    //                    .padding(.bottom)
                    //                    .listRowSeparator(.hidden)
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 20)
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
        .background(.black,ignoresSafeAreaEdges: .all)
        .navigationBarHidden(true)
    }
}

#Preview {
    FinancialMenu()
}
