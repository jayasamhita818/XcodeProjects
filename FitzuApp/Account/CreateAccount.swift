//
//  CreateAccount.swift
//  FitzuApp
//
//  Created by rounak suri on 23/05/24.
//
import iPhoneNumberField
import SwiftUI

struct CreateAccount: View {
    @Binding var professionName : String
    @Binding var selectedView: Int
    
    @State private var secure_status = true
    @State private var firstName_text: String = ""
    @State private var lastName_text: String = ""
    @State private var email_text: String = ""
    @State private var password_text: String = ""
    @State private var gender_text: String = ""
    @State private var gender_chosen: Bool = false
    @State private var phoneNumber_text: String = ""
    @State private var referelCode_text: String = ""
    
    @State private var alert_OTP: Bool = false
    @State private var phoneVerification: Bool = false
    @State var customAlertActive: Bool = false
    var body: some View {
        
        ZStack{
            Image("bg_image")
                .resizable()
                .ignoresSafeArea(.keyboard)
            ScrollView {
               
                ZStack(alignment: .leading){
                    
                    if firstName_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("First Name")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .bold()
                    }
                    TextField("", text: $firstName_text)
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
                    
                    if lastName_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("Last Name")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .bold()
                    }
                    TextField("", text: $lastName_text)
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
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                
                ZStack(alignment: .leading){
                    
                    
//                    HStack{
//                        Spacer()
//                        if gender_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
//                            Text("Gender")
//                                .font(.system(size: 12))
//                                .foregroundColor(.white)
//                                .bold()
//                        }
//                        Spacer()
//                    }
//                    TextField("", text: $gender_text)
//                        .font(.system(size: 12))
//                        .foregroundColor(.white)
//                        .background(.clear)
                    
                    Menu {
                        Button {
                            gender_text = "Male"
                            gender_chosen = true
                        } label: {
                            Text("Male")
                                .background(.black)
                        }
                        
                        Button {
                            gender_text = "Female"
                            gender_chosen = true
                        } label: {
                            Text("Female")
                                .background(.black)
                        }
               
                    } label: {
                        HStack{
                            
                        
                        if gender_chosen == false {
                            Text("Gender")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .bold()
                                .backgroundStyle(.clear)
                        } else {
                            Text(gender_text)
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .bold()
                                .backgroundStyle(.clear)
                        }
                            Spacer()
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                
                iPhoneNumberField("", text: $phoneNumber_text)
                
                    .flagHidden(false)
                    .flagSelectable(true)
                    .maximumDigits(10)
                    .foregroundColor(Color.pink)
                    .cornerRadius(10)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 5.0)
                            .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                    )
                
                ZStack(alignment: .leading){
                    
                    if referelCode_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("Referal Code (optional)")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .bold()
                    }
                    TextField("", text: $referelCode_text)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .background(.clear)
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                
                Button(action: {
                        alert_OTP = true
                    
                }, label: {
                    Text("Submit")
                        .foregroundStyle(.white)
                        .bold()
                })
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(UIColor(named: "button_blue")!))
                )
                .padding(.top, 30)
                HStack{
                    Text("Already have an account")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    Button(action: {selectedView = 1}, label: {
                        Text("Log in")
                            .font(.system(size: 12))
                            .foregroundColor(Color(UIColor(named: "yellow_button")!))
                    })
                }
                
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .padding(.top, 50)
            
            if alert_OTP == true {
                AccountCreated(alert_OTP: $alert_OTP, phoneVerification: $phoneVerification)
                    
            }
            
            if phoneVerification == true{
                PhoneVerification(phoneVerification: $phoneVerification, customAlertActive: $customAlertActive)
                    
            }
            
            if customAlertActive == true {
                CustomSingleBtnAlert(title: "Great! Thanks Barry", description: "Click next to complete setting up your account", buttonTitle: "Next", professionName: $professionName, customAlertActive: $customAlertActive, selectedView: $selectedView)
                    
            }
        }
    }
}



//MARK: ALERTS AFTER CREATING THE ACCOUNT
struct AccountCreated: View {
    
    @Binding var alert_OTP: Bool
    @Binding var phoneVerification: Bool
    
    var body: some View{
        ZStack{
            VStack(spacing: 20){
                Image("tick")
                    .resizable()
                    .frame(width: 50,height: 50)
                VStack(alignment: .center){
                    Text("An OTP will now be sent to your")
                    Text("mobile phone")
                }
                .font(.system(size: 15))
                .frame(alignment: .center)
                Button(action: {
                    alert_OTP = false
                    phoneVerification = true
                }, label: {
                    Text("OK")
                        .bold()
                    
                })
                .foregroundStyle(.white)
                .padding(.vertical, 5)
                .padding(.horizontal, 50)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(UIColor(named: "button_blue")!))
                )
                
            }
            .padding(.horizontal, 10)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.55)
            .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
            )
        }
        .background(.black.opacity(0.5))
    }
    
}
struct PhoneVerification: View {
    
    @Binding var phoneVerification: Bool
    @Binding var customAlertActive: Bool
    
    var body: some View{
        ZStack{
            VStack(spacing: 20){
                Text("Phone Verififcation")
                    .font(.custom("Poppins-Bold", size: 20))
                
                Text("Please enter 4 digit verification code sent to your number")
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                OTPTextFieldView(pinLength: 4, keyboardType: .numberPad) { pin in
                    print(pin)
                }
                .padding(.vertical)
                Button(action: {
                    phoneVerification = false
                    customAlertActive = true
                }, label: {
                    Text("Submit")
                        .bold()
                    
                })
                .foregroundStyle(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 50)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(UIColor(named: "button_blue")!))
                )
                
                HStack(spacing:4){
                    Text("Do not receive the code?")
                        .foregroundStyle(.gray)
                    Button(action: {
                        
                    }){
                        Text("Resend SMS")
                            .foregroundStyle(.buttonBlue)
                    }
                    
                }
                .font(.system(size: 15))
            }
            .padding(.horizontal, 10)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.9)
            .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
            )
        }
        .background(.black.opacity(0.5))
    }
    
}
struct CustomSingleBtnAlert: View {
    
    var title : String
    var description: String
    var buttonTitle: String
    
    @Binding var professionName : String
    @Binding var customAlertActive: Bool
    @Binding var selectedView: Int
    
    var titileClr = Color.black
    
    var body: some View{
        ZStack{
            VStack(spacing: 20){
                Text(title)
                    .font(.custom("Poppins-Bold", size: 20))
                    .foregroundStyle(titileClr)
                
                Text(description)
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                    .multilineTextAlignment(.center)
                Button(action: {
                    customAlertActive = false
                    if professionName == "Client"{
                        selectedView = 1
                    } else  {
                        selectedView = 5
                    }
                }){
                    Text(buttonTitle)
                }
                .foregroundStyle(.white)
                .padding(.vertical, 5)
                .padding(.horizontal, 50)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(UIColor(named: "button_blue")!))
                )
            }
            .padding(.horizontal, 10)
            .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.width * 0.5)
            .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
            )
        }
        .background(.black.opacity(0.5))
    }
}

