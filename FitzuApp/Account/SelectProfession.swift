//
//  SelectProfession.swift
//  FitzuApp
//
//  Created by rounak suri on 23/05/24.
//

import SwiftUI

struct SelectProfession: View {
    
    @Binding var professionName : String
    @Binding var selectedView: Int
    @StateObject private var loginManager = LoginManager()
    @State private var chooseChoice = false
    @State private var selectedOption: Int? = nil
    var body: some View {
        ZStack(alignment: .center){
            Image("bg_image")
                .resizable()
               
            if chooseChoice == false{
                
                HStack{
                    Text("Choose Profile Type")
                        .font(.custom("Poppins-Bold", size: 17))
                        .padding(.trailing, 20)
                    Button(action: {
                        chooseChoice = true
                    }, label: {
                        Image("down_arrow_black")
                            .resizable()
                            .frame(width: 20, height: 20)
                    })
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                    )
            } else {
                
                VStack{
                    VStack{
                        HStack{
                            Text("Choose Profile Type")
                                .font(.custom("Poppins-Bold", size: 17))
                                .padding(.trailing, 20)
                            Button(action: {
                                chooseChoice = false
                            }, label: {
                                Image("down_arrow_black")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .rotationEffect(.degrees(180))
                                
                            })
                        }
                        VStack(alignment: .leading){
                            HStack{
                                Button(action: {
                                    self.selectedOption = 1
                                    self.professionName = "Trainer"
                                    loginManager.setProfession("Trainer")
                                }){
                                    if selectedOption == 1 {
                                        Image("blue_checked")
                                            .resizable()
                                    } else {
                                        Image("blue_unchecked")
                                            .resizable()
                                    }
                                }
                                
                                .frame(width: 20, height: 20)
                                
                                
                                
                                Text("Trainer")
                                
                                Image("blue_checked")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(.leading, 40)
                                    .hidden()
                                Text("Trainer")
                                    .hidden()
                                
                            }
                            HStack{
                                Button(action: {
                                    self.selectedOption = 2
                                    self.professionName = "Client"
                                    loginManager.setProfession("Client")
                                }){
                                    if selectedOption == 2 {
                                        Image("blue_checked")
                                            .resizable()
                                    } else {
                                        Image("blue_unchecked")
                                            .resizable()
                                    }
                                }
                                
                                .frame(width: 20, height: 20)
                                
                                
                                Text("Client")
                                Image("blue_checked")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(.leading, 40)
                                    .hidden()
                                    
                                Text("Client")
                                    .hidden()
                                
                            }
                        }
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 5.0)
                            .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                        )
                    .frame(maxWidth: 300)
                    Button(action: {
                        selectedView = 1
                        
                    }, label: {
                        Text("Done")
                            .bold()
                            .foregroundStyle(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color(UIColor(named: "button_blue")!))
                                )
                            
                    })
                    .padding(.horizontal, 10)
                    .padding(.top, 80)
                }
                
                
            }
            
        }
        
    }
}

//#Preview {
//    SelectProfession()
//}
