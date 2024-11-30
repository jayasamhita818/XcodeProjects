//
//  ProfileScreen.swift
//  FitzuApp
//
//  Created by HR Ultivic on 13/06/24.
//

import SwiftUI

struct ProfileScreen: View {
    @StateObject private var loginManager = LoginManager()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    
    @State private var name: String = "Stephen"
    @State private var Name: String = "Stephen"
    @State private var firstName: String = "Stephen"
    @State private var lastName: String = "Chow"
    @State private var editName: Bool = false
    
    @State private var editPassword: Bool = false
    @State private var confirmNewPassword: String = ""
    @State private var newPassword: String = ""
    
    @State var customPicsPickerisActive: Bool = false
    @State var selectedImage: UIImage? = nil
    
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
                        Text("Profile")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        Button(action: {}){
                            Image("back")
                                .resizable()
                                .frame(width: 20,height: 20)
                            
                        }.hidden()
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    
                    VStack{
                        Button(action: {
                            customPicsPickerisActive = true
                        }){
                            ZStack(alignment: .bottom){
                                
                                if selectedImage == nil {
                                    Image("2380")
                                        .resizable()
                                        .frame(width: 130,height: 130)
                                        .clipShape(Circle())
                                } else {
                                    Image(uiImage: selectedImage!)
                                        .resizable()
                                        .frame(width: 130,height: 130)
                                        .clipShape(Circle())
                                }
                                
                                Image("camera with circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.leading, 70)
                            }
                        }
                        .padding(20)
                        
                        Button(action: {
                            editName = true
                        }){
                            HStack{
                                Text("Name")
                                    .bold()
                                    
                                Spacer()
                                Text(name)
                                    .foregroundStyle(.gray)
                                Image("down_arrow")
                                    .resizable()
                                    .frame(width: 15,height: 15)
                                    .rotationEffect(Angle(degrees: -90))
                            }
                        }
                        Color.gray.opacity(0.3)
                            .frame(height: 0.5)
                            .padding(.vertical, 5)
                        
                        HStack{
                            Text("Phone")
                                .bold()
                            Spacer()
                            Text("+1234567890")
                                .foregroundStyle(.gray)
                        }
                        Color.gray.opacity(0.3)
                            .frame(height: 0.5)
                            .padding(.vertical, 5)
                        HStack{
                            Text("Email")
                                .bold()
                            Spacer()
                            Text(verbatim: "stephen123@gmail.com")
                                .foregroundStyle(.gray)
                            
                        }
                        Color.gray.opacity(0.3)
                            .frame(height: 0.5)
                            .padding(.vertical, 5)
                        Button(action: {
                            editPassword = true
                        }){
                            HStack{
                                Text("Change Password")
                                    .bold()
                                Spacer()
                                
                                Image("down_arrow")
                                    .resizable()
                                    .frame(width: 15,height: 15)
                                    .rotationEffect(Angle(degrees: -90))
                            }
                        }
                        Color.gray.opacity(0.3)
                            .frame(height: 0.5)
                            .padding(.vertical, 5)
                            .padding(.bottom, 20)
                    }
                    .foregroundStyle(.black)
                    .padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black.opacity(0.05))
                    )
                    .padding(20)
                    Spacer()
                }
                .background(.white)
                
                
                    Text("Find a Trainer to suit you")
                        .font(.custom("Poppins-Bold", size: 20))
                        .foregroundStyle(.white)
                        .padding(.vertical)
                
            }
            if menuScreenActive {
                ClientMenu(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
                
            }
            if customPicsPickerisActive {
                CustomPicsPicker(isActive: $customPicsPickerisActive,
                                 title: "Certificate",
                                 selectedImage: $selectedImage)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut, value: customPicsPickerisActive)
            }
            
            if editName {
             editNameView(firstName: $firstName, lastName: $lastName)
            }
            
            if editPassword {
                editPasswordView(newPassword: $newPassword, confirmNewPassword: $confirmNewPassword)
            }
        }
        .background(.black, ignoresSafeAreaEdges: .all)
        .animation(.easeInOut, value: menuScreenActive)
        .navigationBarHidden(true)
    }
    
    func editNameView(firstName: Binding<String>, lastName: Binding<String>) -> some View {
        ZStack {
            VStack(spacing: 20) {
                
                HStack{
                    Spacer()
                    Button(action: {
                        editName = false
                        name = Name
                        self.firstName = Name
                    }) {
                      Image("cancel_red")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                }
                .padding(.top,-20)
                Text("Edit Name")
                    .font(.custom("Poppins-Medium", size: 20))
                    .foregroundStyle(.black)
                    .padding(.top,-20)
                    .padding(.bottom,20)
                HStack{
                    VStack(alignment: .leading){
                        Text("First Name")
                            .foregroundStyle(.gray)
                            .font(.custom("Poppins-Regular", size: 15))
                        
                        
                        TextField("", text: firstName)                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundColor(.black)
                            .background(.clear)
                            .padding(.bottom,-8)
                        Color.gray
                            .frame(height: 1)
                    }
                    .frame(width: 100)
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("End Time")
                            .foregroundStyle(.gray)
                        
                        TextField("", text: lastName)
                            .labelsHidden()
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundColor(.black)
                            .background(.clear)
                            .padding(.bottom,-8)
                            .keyboardType(.numberPad)
                        Color.gray
                            .frame(height: 1)
                    }
                    .frame(width: 100)
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                Button(action: {
                    editName = false
                    name = self.firstName
                    Name = self.firstName
                }) {
                    Text("SAVE")
                        .foregroundStyle(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 30)
                        .font(.custom("Poppins-Medium", size: 17))
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color(UIColor(named: "button_blue")!))
                        )
                    
                    
                }
                
            }
            .padding(.horizontal, 10)
            .frame(width: UIScreen.main.bounds.width * 0.85)
            .padding(.vertical, 30)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white),
                alignment: .center
            )
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 79)
        .background(Color.black.opacity(0.5))
    }
        
    func editPasswordView(newPassword: Binding<String>, confirmNewPassword: Binding<String>) -> some View {
        ZStack {
            VStack(spacing: 20) {
                
                HStack{
                    Spacer()
                    Button(action: {
                        editPassword = false
                        
                    }) {
                        Image("cancel_red")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                }
                .padding(.top, -20)
                Text("Edit Password")
                    .font(.custom("Poppins-Medium", size: 20))
                    .foregroundStyle(.black)
                    .padding(.top, -20)
                    .padding(.bottom, 20)
                VStack{
                    VStack(alignment: .leading){
                        TextField("New Password", text: newPassword)
                            .font(.custom("Poppins-Regular", size: 20))
                            .foregroundColor(.black)
                            .background(.clear)
                            .padding(.bottom,-8)
                        Color.gray.opacity(0.3)
                            .frame(height: 1)
                    }
                   
                    
                    VStack(alignment: .leading){
                        
                        TextField("Confirm New Password", text: confirmNewPassword)
                            .labelsHidden()
                            .font(.custom("Poppins-Regular", size: 20))
                            .foregroundColor(.black)
                            .background(.clear)
                            .padding(.bottom,-8)
                            .keyboardType(.numberPad)
                        Color.gray.opacity(0.3)
                            .frame(height: 1)
                    }
                   
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .padding(.bottom)
                Button(action: {
                    editPassword = false
                    
                }) {
                    Text("SAVE")
                        .foregroundStyle(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 30)
                        .font(.custom("Poppins-Medium", size: 17))
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color(UIColor(named: "button_blue")!))
                        )
                    
                    
                }
                
            }
            .padding(.horizontal, 10)
            .frame(width: UIScreen.main.bounds.width * 0.85)
            .padding(.vertical, 30)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white),
                alignment: .center
            )
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 79)
        .background(Color.black.opacity(0.5))
    }
}

#Preview {
    ProfileScreen()
}
