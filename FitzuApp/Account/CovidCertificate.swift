//
//  CovidCertificate.swift
//  FitzuApp
//
//  Created by rounak suri on 27/05/24.
//

import SwiftUI

struct CovidCertificate: View {
    @Binding var selectedView: Int
    var body: some View {
        ZStack{
            
            VStack{
                
                HStack{
                    Button(action: {
                        selectedView = 9
                    }){
                        Image("back")
                    }
                    .padding()
                    Spacer()
                    Text("Fitzy COVID Statement")
                        .font(.custom("Poppins-Bold", size: 18))
                    Spacer()
                    Button(action: {
                        selectedView = 11
                    }){
                        Image("aage")
                            .resizable()
                            .frame(width: 25,height: 25)
                    }
                    .padding()
                }
                .background(.navigationBar)
                .padding(.bottom, 30)
                VStack(alignment: .leading){
                    Text("First of all, thanks for signing up with fitzu")
                    Text("  ")
                    Text("As we approach the lasr few months of 2021, physical health, mental health, lockdown and vaccination continue to be big issues.")
                    Text("  ")
                    Text("There are many opinions, thoughts and feelings in vaccination. What we are definitely not doing is to be telling you what you should be doing. We trust you can make your own responsible, informed decisions.")
                }
                .padding(10)
                .border(.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding(.leading, 30)
                .padding(.trailing, 30)
                
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
//    CovidCertificate()
//}
