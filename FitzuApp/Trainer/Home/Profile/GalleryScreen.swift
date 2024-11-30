//
//  GalleryScreen.swift
//  FitzuApp
//
//  Created by rounak suri on 13/06/24.
//

import SwiftUI

struct GalleryScreen: View {
    
    @StateObject private var loginManager = LoginManager()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    
    @State var customPicsPickerisActive: Bool = false
    @State var selectedImages: [UIImage] = []
    
    let columns = [
            GridItem(.adaptive(minimum: 100)) // Adjust the minimum size as needed
        ]
    
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
                        Text("Gallery")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        Button(action: {
                            customPicsPickerisActive = true
                        }){
                            Image("cancelll")
                                .resizable()
                                .frame(width: 20,height: 20)
                                .rotationEffect(Angle(degrees: 45))
                                .padding(.trailing)
                            
                        }
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    
                    ScrollView {
                           LazyVGrid(columns: columns, spacing: 10) {
                               ForEach(selectedImages, id: \.self) { image in
                                   Image(uiImage: image)
                                       .resizable()
                                       .aspectRatio(contentMode: .fill)
                                       .frame(width: 100, height: 100) // Adjust the size as needed
                                       .clipped()
                               }
                           }
                           .padding()
                       }
                }
                .background(.white)
                
                
                
            }
            if menuScreenActive {
                MenuScreen(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
                
            }
            if customPicsPickerisActive {
                CustomMultiplePicsPicker(isActive: $customPicsPickerisActive,
                                 title: "Gallery",
                                    selectedImages: $selectedImages)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut, value: customPicsPickerisActive)
            }
        }
        .background(.black, ignoresSafeAreaEdges: .all)
        .animation(.easeInOut, value: menuScreenActive)
        .navigationBarHidden(true)
    }
}

#Preview {
    GalleryScreen()
}
