//
//  ForgotPassword.swift
//  FitzuApp
//
//  Created by rounak suri on 23/05/24.
//

import SwiftUI

struct ForgotPassword: View {
    @Binding var selectedView: Int
    @State private var email_text: String = ""
    
    var body: some View {
        ZStack{
            Image("bg_image")
                .resizable()
                .ignoresSafeArea(.keyboard)
            VStack(alignment: .center){
                Spacer()
                Text("Please enter your your registered email")
                Text("address to reset your password")
                    .padding(.bottom)
                ZStack(alignment: .leading){
                    
                    if email_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("Email")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    TextField("", text: $email_text)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .background(.clear)
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                .padding(.leading, 50)
                .padding(.trailing, 50)
                
                
                Button(action: {
                    selectedView = 4
                }, label: {
                    Text("Submit")
                        .bold()
                })
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(UIColor(named: "button_blue")!))
                )
                .padding(.top, 50)
                Spacer()
                HStack{
                    Text("Remember your password?")
                    Button(action: {
                        selectedView = 1
                    }, label: {
                        Text("Log in")
                            .foregroundColor(Color(UIColor(named: "yellow_button")!))
                    })
                }
                .padding(.bottom, 30)
            }
            .foregroundColor(.white)
        }
    }
}

//#Preview {
//    ForgotPassword()
//} 
