//
//  Location.swift
//  FitzuApp
//
//  Created by rounak suri on 29/05/24.
//

import SwiftUI

struct Location: View {
    @State private var baseAddress_location: Bool = false
    @State private var homeAddress_location: Bool = false
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
                        Button(action: {}){
                            Image("back")
                                .resizable()
                                .frame(width: 20,height: 20)
                            
                        }
                        .padding(.leading)
                        Spacer()
                        Text("Location Base")
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
                    VStack(alignment: .leading,spacing: 20){
                        Text("Set your base location to help calculate your availability. If you are training someone, that becomes your location.")
                            .padding(.top)
                        HStack(alignment: .top){
                            Button(action:{
                                homeAddress_location.toggle()
                            }){
                                if homeAddress_location == false {
                                    Image("blue_unchecked")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                } else {
                                    Image("blue_checked")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                }
                            }
                            
                            VStack(alignment: .leading,spacing: 0){
                                Text("Use my home address")
                                    .font(.custom("Poppins-Bold", size: 20))
                                
                                HStack{
                                    Image("pin")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text("Patiala, Punjab India")
                                        .font(.custom("Poppins-Regular", size: 17))
                                }
                            }
                            
                        }
                        
                        HStack(alignment: .center){
                            Button(action:{
                                baseAddress_location.toggle()
                            }){
                                if baseAddress_location == false {
                                    Image("blue_unchecked")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                } else {
                                    Image("blue_checked")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                }
                            }
                            
                            VStack(alignment: .leading){
                                Text("Set a address")
                                    .font(.custom("Poppins-Bold", size: 20))
                                //                                Spacer()
                                //                                HStack{
                                //                                    Image("pin")
                                //                                        .resizable()
                                //                                        .frame(width: 20, height: 20)
                                //                                    Text("Patiala, Punjab India")
                                //
                                //                                }
                            }
                            
                        }
                        
                        HStack(alignment: .center){
                            Text("How many KM will you travel for a job")
                                .font(.custom("Poppins-Medium", size: 17))
                            Text("5")
                                .font(.custom("Poppins-Medium", size: 30))
                                .padding(.horizontal, 25)
                                .padding(.vertical, 10)
                                .background(
                                    Rectangle()
                                        .stroke(.black, lineWidth: 2)
                                )
                                .padding(.leading)
                        }
                        
                        Text("Clients will not be able to see your home address. It will be used to calculate availability and session time.")
                        
                        Spacer()
                        HStack{
                            Spacer()
                            Button(action: {}, label: {
                                Text("SAVE")
                                    .bold()
                            })
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color(UIColor(named: "button_blue")!))
                            )
                            .padding(.bottom, 30)
                        Spacer()
                        }
                        
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
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
    }
}

#Preview {
    Location()
}
