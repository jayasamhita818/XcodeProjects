//
//  ProfileVerify.swift
//  FitzuApp
//
//  Created by rounak suri on 27/05/24.
//

import SwiftUI

struct ProfileVerify: View {
    @Binding var selectedView: Int
    @State private var selectedOption = false
    @State var customAlertActive: Bool = false
    @State var professionName : String = "Client"
    var body: some View {
        ZStack(alignment: .top){
            VStack{
                HStack{
                    Button(action: {
                        selectedView = 10
                    }){
                        Image("back")
                    }
                    .padding(.leading)
                    Spacer()
                    Text("Sunil Bisht")
                        .font(.custom("Poppins-Bold", size: 18))
                    Spacer()
                    Button(action: {
                        self.selectedOption.toggle()
                        
                    }){
                        if selectedOption == true {
                            Image("heart")
                                .resizable()
                        } else {
                            Image("heart_empty")
                                .resizable()
                        }
                    }
                    
                    .frame(width: 30, height: 30)
                    .padding(.trailing)
                }
                .padding(.vertical)
                .background(.navigationBar)
                ScrollView{
                    HStack{
                        ZStack{
                            Image("2380")
                                .resizable()
                                .frame(width: 100,height: 100)
                                .cornerRadius(50)
                            HStack{
                                Spacer()
                                VStack{
                                    Image("crown")
                                        .resizable()
                                        .frame(width: 35,height: 35)
                                        .padding(.top,40)
                                        .padding(.trailing, 15)
                                    Spacer()
                                    
                                }}
                            
                            VStack{
                                Spacer()
                                HStack(spacing: -10){
                                    Image("Covid_safe")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .padding(2)
                                        .background(.white)
                                        .cornerRadius(16)
                                        .zIndex(1)
                                    Text("  Vaccinated ")
                                    
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.system(size: 13))
                                        .padding(5)
                                        .background(
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(.black)
                                                .border(.white, width: 2)
                                        )
                                        .zIndex(0)
                                    
                                }
                                HStack(spacing:1){
                                    Text("4.0")
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
                                .frame(width: 110)
                            }
                        }
                        
                        .frame(width: 140,height: 180)
                        VStack{
                            Text("Skills")
                                .font(.custom("Poppins-Bold", size: 18))
                            HStack(spacing: 15){
                                Image("2380")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                    .cornerRadius(30)
                                Image("2380")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                    .cornerRadius(30)
                                Image("2380")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                    .cornerRadius(30)
                            }
                            .padding(.trailing, 10)
                            Text("3 years Experience")
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                        }
                        
                    }
                    HStack{
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("See All")
                                .foregroundColor(.black)
                                .padding(.trailing,10)
                                .font(.system(size: 15))
                        })
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            Image("2380")
                                .resizable()
                                .frame(width: 150,height: 150)
                            Image("2380")
                                .resizable()
                                .frame(width: 150,height: 150)
                            Image("2380")
                                .resizable()
                                .frame(width: 150,height: 150)
                            Image("2380")
                                .resizable()
                                .frame(width: 150,height: 150)
                            Image("2380")
                                .resizable()
                                .frame(width: 150,height: 150)
                            
                        }
                    }
                    
                    Text("dsnfshi ovhsdi nvihilf vildsh ivdsn fshiovh sdinvi hilfvil dshiv dsnfshi ovhsdi nvihil fvild sh ivd snfs hiovhsdin vih ilf vild shiv ds nfsh iovhsdin vihilfv ildshi vdsnf shio vhsdinvi hilfvild shiv")
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    Button(action: {
                        customAlertActive = true
                    }, label: {
                        Text("Verify Account")
                            .bold()
                    })
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color(UIColor(named: "button_blue")!))
                    )
                    .padding(.bottom, 30)
                }
                .padding(.leading, 20)
                .padding(.trailing,20)
                
                
                
            }
            .background(.white)
            
            if customAlertActive == true {
                CustomSingleBtnAlert(title: "Thank you", description: "Thank you for submitting your documents. We'll revert back to you in 24 hours", buttonTitle: "Next", professionName: $professionName, customAlertActive: $customAlertActive, selectedView: $selectedView,titileClr: Color.yellowButton)
                    
            }
        }
        
    }
}
//#Preview {
//    ProfileVerify()
//}
