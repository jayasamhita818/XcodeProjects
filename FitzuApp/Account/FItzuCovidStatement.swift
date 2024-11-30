//
//  FItzuCovidStatement.swift
//  FitzuApp
//
//  Created by rounak suri on 27/05/24.
//

import SwiftUI

struct FItzuCovidStatement: View {
    @Binding var selectedView: Int
    @State private var selectedOption = false
    
    var body: some View {
        ZStack{
            
            VStack{
                
                HStack{
                    Button(action: {
                        selectedView = 10
                    }){
                        Image("back")
                    }
                    .padding()
                    Spacer()
                    Text("Fitzy COVID Statement")
                        .font(.custom("Poppins-Bold", size: 18))
                    Spacer()
                    Button(action: {
                        selectedView = 12
                    }){
                        Image("aage")
                            .resizable()
                            .frame(width: 25,height: 25)
                    }
                    .padding()
                }
                .background(.navigationBar)
                .padding(.bottom, 30)
                
                HStack{
                    Text("Please Note:")
                        .font(.custom("Poppins-Medium", size: 18))
                        Spacer()
                }
                .padding(.leading, 30)
                
                
                VStack(alignment: .leading){
                    Text("In some states and jurisdictions there are fines in excess of $10,000 for mis-representing your COVID vaccination status. It is the trainers responsibility for group sessions to validate vaccination status of clients")
                    
                    HStack{
                        Spacer()
                        Image("Covid_safe")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Spacer()
                    }
                    .padding()
                }
                .foregroundColor(.gray)
                .padding(10)
                .border(.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding(.leading, 30)
                .padding(.trailing, 30)
                
                HStack{
                    Button(action: {
                        self.selectedOption.toggle()
                        
                    }){
                        if selectedOption == true {
                            Image("blue_checked")
                                .resizable()
                        } else {
                            Image("blue_unchecked")
                                .resizable()
                        }
                    }
                    
                    .frame(width: 20, height: 20)
                    
                    Text("Show the icon")
                    Spacer()
                }
                .padding(.leading, 30)
                
                Spacer()
               
                Button(action: {
                    selectedView = 12
                }, label: {
                    Text("Next")
                        .bold()
                })
                .foregroundStyle(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 50)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(UIColor(named: "button_blue")!))
                )
                .padding(.bottom, 30)
            }
            .background(.white)
        }
        
    }
}

//#Preview {
//    FItzuCovidStatement()
//}
