//
//  BankDetail.swift
//  FitzuApp
//
//  Created by rounak suri on 27/05/24.
//

import SwiftUI

struct BankDetail: View {
    
    @Binding var selectedView: Int
    
    var body: some View {
        ZStack{
            Image("bg_image")
                .resizable()
                .ignoresSafeArea(.keyboard)
            VStack(alignment: .center, spacing: 20){
                Text("professionName")
                    .font(.custom("Poppins-Bold", size: 17))
                    .padding(.top, 20)
                
                Image("credit card")
                    .resizable()
                    .aspectRatio(1.5, contentMode: .fit)
                  
                Text("We are diverting you to stripe for bank account setup cons ectetur adipising elit, sed do eismund tempor incididunt ut labore et dolore magna aliqua")
                    .font(.custom("Poppins-Medium", size: 19))
                
                Spacer()
                Button(action: {
                    selectedView = 10
                }, label: {
                    Text("Setup Stripe")
                        .bold()
                })
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(UIColor(named: "button_blue")!))
                )
                .padding(.bottom, 30)
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
        }
        .foregroundColor(.white)
    }
}

//#Preview {
//    BankDetail()
//}
