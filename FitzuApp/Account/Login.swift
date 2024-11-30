//
//  Login.swift
//  FitzuApp
//
//  Created by rounak suri on 23/05/24.
//

import SwiftUI

struct Login: View {
    @Binding var selectedView: Int
    
    @State private var email_text: String = ""
    @State private var secure_status = true
    @State private var password_text: String = ""
    @Binding var professionName : String
    @StateObject private var loginManager = LoginManager()
    @State private var toMainScreen = false
    
    var body: some View {
        ZStack{
            GeometryReader { geo in
                Image("bg_image")
                    .resizable()
                    .ignoresSafeArea(.keyboard)
            }
            VStack(alignment: .center){
                Text(professionName)
                
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
                
                ZStack(alignment: .leading){
                    
                    if password_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("Password")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    HStack{
                        
                        if secure_status == true {
                            SecureField("", text: $password_text)
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .background(.clear)
                        } else {
                            
                            TextField("", text: $password_text)
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .background(.clear)
                        }
                        Button(action: {secure_status.toggle()}, label: {
                            if secure_status == true {
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
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                )
                
                
                HStack{
                    Spacer()
                    Button(action: {
                        selectedView = 3
                    }, label: {
                        Text("Forgot Password?")
                            .font(.custom("Poppins-Bold", size: 12))
                    })
                }
                
                Button(action: {
                    toMainScreen.toggle()
                    loginManager.setLogin(true)
                }, label: {
                    Text("Done")
                        .bold()
                        .padding(.vertical, 10)
                        .padding(.horizontal, 50)
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color(UIColor(named: "button_blue")!))
                            )
                })
                .padding(.horizontal, 10)
                .padding(.top, 80)
                .padding(.bottom,15)
                Text("Don't have an account yet")
                    .font(.system(size: 12))
                HStack{
                    Button(action: {
                        selectedView = 2
                    }) {
                        Text("Click here")
                            .font(.system(size: 12))
                            .foregroundColor(Color(UIColor(named: "yellow_button")!))
                    }
                    Text("to create one")
                        .font(.system(size: 12))
                }
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .foregroundColor(.white)
        }
        
        if professionName != "Client" {
                
            NavigationLink(
                destination: HomeScreen(),
                isActive: $toMainScreen,
                label: { EmptyView() })
        } else {
            NavigationLink(
                destination: ClientHome(),
                isActive: $toMainScreen,
                label: { EmptyView() })
        }
    }
}

//#Preview {
//    Login()
//}
