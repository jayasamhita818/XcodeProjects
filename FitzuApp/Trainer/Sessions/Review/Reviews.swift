//
//  Reviews.swift
//  FitzuApp
//
//  Created by rounak suri on 29/05/24.
//

import SwiftUI

struct Reviews: View {
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
                    Text("Reviews")
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
                .padding(.bottom, -20)
                .zIndex(1)
                
                List{
                    
                    VStack{
                        HStack{
                            Image("2380")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .cornerRadius(20)
                                .padding(.trailing, 20)
                            VStack{
                                Text("Name")
                                    .font(.custom("Poppins-Bold", size: 15))
                                HStack{
                                    Image("star-1")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Image("star-1")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Image("star-1")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Image("star-1")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Image("star (1)")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                }
                            }
                            
                            Spacer()
                            
                            Text("10/08/21")
                            
                        }
                        Text("ajaksgfkjegkfgekjgfjkesbvkjsdbjvkbdjkvjdsgfjsdgfuksdvbuekgfjkdgckedgvkw")
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)  // Optional: To round the corners of the button background
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))  // Increase top and bottom spacing

                    VStack{
                        HStack{
                            Image("2380")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .cornerRadius(20)
                                .padding(.trailing, 20)
                            VStack{
                                Text("Name")
                                    .font(.custom("Poppins-Bold", size: 15))
                                HStack{
                                    Image("star-1")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Image("star-1")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Image("star-1")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Image("star-1")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Image("star (1)")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                }
                            }
                            
                            Spacer()
                            
                            Text("10/08/21")
                            
                        }
                        Text("ajaksgfkjegkfgekjgfjkesbvkjsdbjvkbdjkvjdsgfjsdgfuksdvbuekgfjkdgckedgvkw")
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)  // Optional: To round the corners of the button background
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets())
                }
                .scrollContentBackground(.hidden)
                .background(.white)
                .foregroundColor(.black)
                .zIndex(0)
            }
            if menuScreenActive {
                
                
                MenuScreen(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
                
            }
            
        }
         .animation(.easeInOut, value: menuScreenActive)
         .navigationBarHidden(true)
         .background(.black, ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    Reviews()
}
//VStack{
//    HStack{
//        Image("2380")
//            .resizable()
//            .frame(width: 30,height: 30)
//            .cornerRadius(15)
//            .padding(.trailing, 20)
//        VStack{
//            Text("Name")
//                .font(.custom("Poppins-Bold", size: 15))
//            HStack{}
//        }
//        
//        Spacer()
//        
//        Text("10/08/21")
//        
//    }
//    Text("ajaksgfkjegkfgekjgfjkesbvkjsdbjvkbdjkvjdsgfjsdgfuksdvbuekgfjkdgckedgvkw")
//}
//background(Color.gray.opacity(0.2))
//.cornerRadius(10)  // Optional: To round the corners of the button background
//.listRowSeparator(.hidden)
//.listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
