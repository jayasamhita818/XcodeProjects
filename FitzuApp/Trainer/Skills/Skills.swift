//
//  Skills.swift
//  FitzuApp
//
//  Created by rounak suri on 29/05/24.
//

import SwiftUI

struct Skills: View {
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
                        Text("Skills")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        NavigationLink(destination: AddSkills(), tag: "AddSkills", selection: $viewDestination) {
                            Button(action: {
                                self.viewDestination = "AddSkills"
                            }){
                                Image("cancelll")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                    .rotationEffect(Angle(degrees: 45))
                                    .padding(.trailing)
                                
                            }
                        }
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    
                    ScrollView{
                        HStack{
                            Spacer()
                            Text("Click to View")
                                .foregroundColor(.buttonBlue)
                            Spacer()
                        }
                        .padding(.top)
                        NavigationLink(destination: SkillDetails(), tag: "SkillDetails", selection: $viewDestination) {
                            Button(action: {
                                self.viewDestination = "SkillDetails"
                            }){
                                HStack{
                                    Image("2380")
                                        .resizable()
                                        .frame(width: 70,height: 70)
                                        .cornerRadius(50)
                                        .padding(.trailing)
                                        .padding(.vertical,2)
                                    VStack(alignment: .leading){
                                        Text("Elite Sport Specialist")
                                            .font(.custom("Poppins-Bold", size: 17))
                                        Text("Experience: 3 Year")
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.vertical,5)
                            }
                            
                            .padding(.vertical,5)
                            .background(Color.gray.opacity(0.2))
                        }
                  
                    }
                    .foregroundColor(.black)
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
        .background(.black, ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    Skills()
}
