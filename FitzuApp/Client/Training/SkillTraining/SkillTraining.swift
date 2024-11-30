//
//  SkillTraining.swift
//  FitzuApp
//
//  Created by rounak suri on 04/06/24.
//

import SwiftUI

struct SkillTraining: View {
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selectedDate = Date()
    @State var skillSelected: Bool = false
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
                        Text("TIME TO TRAIN!")
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
                    
                    
                   
                    
                    ZStack(alignment: .bottom){
                        ScrollView{
                            Text("Select one or more categories to search")
                                .bold()
                            Button(action: {
                                skillSelected.toggle()
                            }){
                                if skillSelected == false {
                                    HStack(alignment: .center, spacing: 20){
                                        Image("2380")
                                            .resizable()
                                            .frame(width: 60,height: 60)
                                            .cornerRadius(40)
                                            .padding(.leading, 30)
                                            .padding(.vertical,10)
                                        Text("Dancing")
                                        Spacer()
                                    }
                                   
                                } else {
                                    HStack(alignment: .center, spacing: 20){
                                        Image("2380")
                                            .resizable()
                                            .frame(width: 60,height: 60)
                                            .cornerRadius(40)
                                            .padding(.leading, 30)
                                            .padding(.vertical,10)
                                        Text("Dancing")
                                        Spacer()
                                        
                                    }
                                    
                                 //   .frame(width: UIScreen.main.bounds.width * 0.8)
                                    .background(.yellowButton.opacity(0.4))
                                }
                                
                                
                            }
                            HStack(alignment: .center, spacing: 20){
                                Image("2380")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                    .cornerRadius(40)
                                    .padding(.leading, 30)
                                    .padding(.vertical,10)
                                Text("Dancing")
                                Spacer()
                            }
                            
                        }
                        .bold()
                        
                        
                        Button(action: {}, label: {
                            Text("CHOOSE SKILLS")
                                .foregroundStyle(.white)
                                .bold()
                        })
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color(UIColor(named: "button_blue")!))
                        )
                        .padding(.bottom)
                    }
                }
                    .foregroundStyle(.black)
                    .background(.white)
                    
                    Text("Find a Trainer to suit you")
                        .font(.custom("Poppins-Bold", size: 20))
                        .foregroundStyle(.white)
                        .padding(.vertical)
                }
                
            if menuScreenActive {
                
                
                ClientMenu(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
            }
            
        }
         .animation(.easeInOut, value: menuScreenActive)
            .navigationBarHidden(true)
        .background(.black, ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    SkillTraining()
}
