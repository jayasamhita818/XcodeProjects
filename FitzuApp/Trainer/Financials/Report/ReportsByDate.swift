//
//  ReportsByDate.swift
//  FitzuApp
//
//  Created by rounak suri on 28/05/24.
//

import SwiftUI

struct ReportsByDate: View {
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
                        Text("Choose month")
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
                            }) {
                                Text("September 2021")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                            }
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)  // Optional: To round the corners of the button background
                            
                        }
                        Button(action: {
                            
                        }) {
                            Text("August 2021")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)  // Optional: To round the corners of the button background
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, 20)
                    .background(.white)
                    .foregroundColor(.black)
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
            .background(.black ,ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    ReportsByDate()
}
