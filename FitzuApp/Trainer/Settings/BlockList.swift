//
//  BlockList.swift
//  FitzuApp
//
//  Created by rounak suri on 03/06/24.
//

import SwiftUI

struct BlockList: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    @StateObject private var loginManager = LoginManager()
    @State var customAlertActive: Bool = false
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
                                .frame(width: 30,height: 30)
                            
                        }
                        .padding(.leading)
                        Spacer()
                        Text("Block List")
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
                    //                    .zIndex(1.0)
                    //                    .padding(.bottom, -20)
                    
                    ScrollView {
                        VStack(spacing: 10){
                            
                            HStack(alignment: .center){
                                Image("2380")
                                    .resizable()
                                    .frame(width: 70,height: 70)
                                    .cornerRadius(50)
                                    .padding(.leading, 10)
                                
                                Text("David")
                                    .font(.system(size: 17))
                                    .padding(.bottom,2)
                                
                                
                                
                                    .padding(.leading,5)
                                Spacer()
                                
                                Button(action: {
                                    customAlertActive = true
                                }){
                                    Text("Unblock")
                                }
                                .font(.custom("Poppins-Medium", size: 15))
                                .foregroundColor(.buttonBlue)
                                .padding(.trailing, 15)
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.vertical,5)
                            
                            
                            // .listRowSeparator(.hidden)
                            .padding(.vertical,5)
                            .background(Color.gray.opacity(0.2))
                            // .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
                            
                            
                            
                            
                            Spacer()
                            
                        }
                        .padding(.top)
                        .foregroundColor(.black)
                        .scrollContentBackground(.hidden)
                        //                    .padding(.leading, -20)
                        //                    .padding(.trailing, -20)
                        
                    }
                    .background(.white)
                }
                
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
            
            if customAlertActive {
                CustomDoubleBtnAlertView(title: "Unblock David?",
                                         description: "Unblocking a contact will enable them to meassage you. Click Unblock to continue",
                                         buttonTitle1: "UNBLOCK",
                                         buttonAction1: {
                    customAlertActive = false
                },
                                         buttonTitle2: "CANCEL",
                                         buttonAction2: {customAlertActive = false},
                                         customAlertActive: $customAlertActive)
            }
            
        }
         .animation(.easeInOut, value: menuScreenActive)
            .navigationBarHidden(true)
            .background(.black, ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    BlockList()
}


