//
//  ReferingFriend.swift
//  FitzuApp
//
//  Created by rounak suri on 29/05/24.
//

import SwiftUI

struct ReferingFriend: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    @StateObject private var loginManager = LoginManager()
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
                        Text("Invite a Friend")
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
                    .padding(.bottom)
                    
                    ZStack{
                        Image("Group 467")
                            .resizable()
                            
                        
                        VStack{
                            Image("Group 468")
                                .resizable()
                                .frame(width: 123, height: 106)
                            
                            Text("Invite a friend and earn bonus")
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.586)
                    
                    Text("Share your code")
                        .font(.custom("Poppins-Bold", size: 17))
                        .foregroundColor(.gray.opacity(0.4))
                        .padding(.vertical)
                    HStack{
                        Text("W7U7")
                            .padding(.horizontal, 30)
                            .foregroundColor(.buttonBlue)
                            .bold()
                        Button(action: {}){
                            Image("copy")
                                .resizable()
                                .frame(width: 20,height: 20)
                                
                        }
                        .frame(width: 30,height: 30)
                        .background(.yellowButton)
                    }
                    .background(.selectedYellow)
                    .cornerRadius(5)
                    Spacer()
                    
                    Button(action: {}) {
                        Text("SHARE")
                            .bold()
                    }
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color(UIColor(named: "button_blue")!))
                    )
                    .padding(.bottom, 30)
                }
                .background(.white)
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
            
        }
         .animation(.easeInOut, value: menuScreenActive)
            .navigationBarHidden(true)
            .background(.black, ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    ReferingFriend()
}
