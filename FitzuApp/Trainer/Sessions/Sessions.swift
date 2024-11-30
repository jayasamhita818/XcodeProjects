//
//  Sessions.swift
//  FitzuApp
//
//  Created by rounak suri on 28/05/24.
//

import SwiftUI

struct Sessions: View {
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    @State private var selectedSegment = 2
    @StateObject private var loginManager = LoginManager()
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
                        Text("Sessions")
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
                    
                    HStack(alignment: .center){
                        Spacer()
                        if selectedSegment == 1 {
                            Button(action: {selectedSegment = 1}){
                                Text("Past")
                            }
                            .frame(width: (UIScreen.main.bounds.width / 3) - 10)
                            .padding(.horizontal, -4)
                            .padding(.vertical, 5)
                            .background(.white)
                            .foregroundColor(.blue)
                            .cornerRadius(5)
                           
                        } else {
                            Button(action: {selectedSegment = 1}){
                                Text("Past")
                            }
                            .frame(width: (UIScreen.main.bounds.width / 3) - 10)
                            .padding(.horizontal, -4)
                            .padding(.vertical, 5)
                            .foregroundColor(.gray)
                            .cornerRadius(5)
                        }
                        
                        if selectedSegment == 2 {
                            Button(action: {selectedSegment = 2}){
                                Text("Active")
                            }
                            .frame(width: (UIScreen.main.bounds.width / 3) - 10)
                            .padding(.horizontal, -4)
                            .padding(.vertical, 5)
                            .background(.white)
                            .foregroundColor(.blue)
                            .cornerRadius(5)
                        } else {
                            Button(action: {selectedSegment = 2}){
                                Text("Active")
                            }
                            .frame(width: (UIScreen.main.bounds.width / 3) - 10)
                            .padding(.horizontal, -4)
                            .padding(.vertical, 5)
                            .foregroundColor(.gray)
                            .cornerRadius(5)
                        }
                        
                        if selectedSegment == 3 {
                            Button(action: {selectedSegment = 3}){
                                Text("Inactive")
                            }
                            .frame(width: (UIScreen.main.bounds.width / 3) - 10)
                            .padding(.horizontal, -4)
                            .padding(.vertical, 5)
                            .background(.white)
                            .foregroundColor(.blue)
                            .cornerRadius(5)
                        } else {
                            Button(action: {selectedSegment = 3}){
                                Text("Inactive")
                            }
                            .frame(width: (UIScreen.main.bounds.width / 3) - 10)
                            .padding(.horizontal, -4)
                            .padding(.vertical, 5)
                            .cornerRadius(5)
                            .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                     .padding(.horizontal, -14)
                    .padding(.vertical, 3)
                    .background(Color.gray.opacity(0.2))
                    .bold()
                    .cornerRadius(5)
                    .zIndex(1.0)
                    .padding(.bottom, -20)
                    Spacer()

                               // Display content based on the selected segment
                               if selectedSegment == 1 {
                                   SessionsList(selectedSegment: $selectedSegment)
                                       .padding(.leading,-20)
                                       .padding(.trailing,-20)
                                       .zIndex(0)
                               } else if selectedSegment == 2 {
                                   SessionsList(selectedSegment: $selectedSegment)
                                       .padding(.leading,-20)
                                       .padding(.trailing,-20)
                                       .zIndex(0)
                               } else {
                                   SessionsList(selectedSegment: $selectedSegment)
                                       .padding(.leading,-20)
                                       .padding(.trailing,-20)
                                       .zIndex(0)
                               }

                               Spacer()
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
            .background(.black ,ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    Sessions()
}

