//
//  Menu.swift
//  FitzuApp
//
//  Created by rounak suri on 27/05/24.
//

import SwiftUI

struct Menu: View {
    let menu = ["Financials","Sessions","Availability","Skill","Messages","FAQ's","Settings","Refer a Friend","Help"]
    var body: some View {
        ZStack{
            
            List{
                HStack(spacing: 20){
                    Image("2380")
                        .resizable()
                        .frame(width: 100,height: 100)
                        .cornerRadius(50)
                    VStack(alignment: .leading){
                        Text("Sahil Bisht")
                        Text("sahil123@gmail.com")
                    }
                }
                
                .listRowSeparator(.hidden)
                ForEach(menu.indices, id: \.self) { index in
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                        HStack{
                            Text(menu[index])
                            Spacer()
                            Image("rightArrowBlack")
                                .resizable()
                                .frame(width: 20,height: 20)
                        }
                    }
                }
                
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            
           
        }
        .foregroundColor(.black)
    }
}

#Preview {
    Menu()
}
