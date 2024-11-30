//
//  CreateNewPassword.swift
//  FitzuApp
//
//  Created by rounak suri on 24/05/24.
//

import SwiftUI

struct CreateNewPassword: View {
    
    @Binding var selectedView: Int
    
    @State private var npSecure_status = true
    @State private var newPassword_text: String = ""
    
    @State private var cpSecure_status = true
    @State private var confirmPassword_text: String = ""
    var body: some View {
        ZStack{
            Image("bg_image")
                .resizable()
                .ignoresSafeArea(.keyboard)
            VStack(spacing: 20){
                Text("Please enter your new password")
                
                ZStack(alignment: .leading){
                    
                    if newPassword_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("New Password")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    HStack{
                        
                        if npSecure_status == true {
                            SecureField("", text: $newPassword_text)
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .background(.clear)
                        } else {
                            
                            TextField("", text: $newPassword_text)
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .background(.clear)
                        }
                        Button(action: {npSecure_status.toggle()}, label: {
                            if npSecure_status == true {
                                Image("eye-slash")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                            } else {
                                Image("eye")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                            }
                        })
                    }
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                ZStack(alignment: .leading){
                    
                    if confirmPassword_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("Confirm Password")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    HStack{
                        
                        if cpSecure_status == true {
                            SecureField("", text: $confirmPassword_text)
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .background(.clear)
                        } else {
                            
                            TextField("", text: $confirmPassword_text)
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .background(.clear)
                        }
                        Button(action: {cpSecure_status.toggle()}, label: {
                            if cpSecure_status == true {
                                Image("eye-slash")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                            } else {
                                Image("eye")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                            }
                        })
                    }
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                Button(action: {
                    selectedView = 1
                }, label: {
                    Text("Change Password")
                        .bold()
                })
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(UIColor(named: "button_blue")!))
                )
                
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
        }
        .foregroundColor(.white)
    }
}
//#Preview {
//    CreateNewPassword()
//}
