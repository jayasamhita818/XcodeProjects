//
//  Favourite.swift
//  FitzuApp
//
//  Created by HR Ultivic on 03/06/24.
//

import SwiftUI

struct Favourite: View {
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
                VStack(spacing: 20){
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
                        Text("Favourite")
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
                    
                    Button(action: {}){
                        HStack{
                            VStack{
                                Image("2380")
                                    .resizable()
                                    .frame(width: 100,height: 100)
                                    .cornerRadius(50)
                                
                                HStack{
                                    Image("star-1")
                                        .resizable()
                                        .frame(width: 10,height: 10)
                                    Image("star-1")
                                        .resizable()
                                        .frame(width: 10,height: 10)
                                    Image("star-1")
                                        .resizable()
                                        .frame(width: 10,height: 10)
                                    Image("star (1)")
                                        .resizable()
                                        .frame(width: 10,height: 10)
                                    Image("star (1)")
                                        .resizable()
                                        .frame(width: 10,height: 10)
                                    
                                }
                            }
                            Spacer()
                            VStack(alignment: .leading){
                                HStack{
                                 Spacer()
                                    Image("heart")
                                        .resizable()
                                        .frame(width: 15,height: 15)
                                }
                                .frame(height: 1)
                                HStack{
                                    Text("Sahil Bisht")
                                        .font(.custom("Poppins-Bold", size: 20))
                                        .foregroundStyle(.black)
                                    Spacer()
                                        Text("$80/ Session")
                                            .foregroundStyle(.gray)
                                            .font(.custom("Poppins-regular", size: 12))
                                    
                                    
                                    Image("heart")
                                        .resizable()
                                        .frame(width: 15,height: 15)
                                        .hidden()
                                    
                                }
                                
                                
                                Text("Weight Management,Strength Training,Functional Training,Yoga")
                                    .foregroundStyle(.gray)
                                    .font(.custom("Poppins-regular", size: 15))
                                
                                    
                            }
                            .frame(alignment: .leading)
                            
                        }
                        
                        
                    }
                    .padding()
                    .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                    )
                    .padding(.leading)
                    .padding(.trailing)
                    Spacer()
                    
                }
                .background(.white)
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
    Favourite()
}
