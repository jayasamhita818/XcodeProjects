//
//  AccountType.swift
//  FitzuApp
//
//  Created by rounak suri on 23/05/24.
//

import SwiftUI

struct AccountType: View {
    @State private var selectedView = 0
    @State var professionName = String()
    
    var body: some View {
        ZStack{
            Color.black
            
            VStack(alignment: .center){
                Image("fitzu_font")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .padding(.bottom)
                    .ignoresSafeArea(.keyboard)
                if selectedView != 9{
                    Text("Time to Train!")
                        .font(.custom("Poppins-Bold", size: 20))
                        .foregroundColor(.white)
                        .ignoresSafeArea(.keyboard)
                }
                
                
                switch selectedView {
                case 0:
                    SelectProfession(professionName: $professionName, selectedView: $selectedView)
                    Text("Find a trainer to suit you")
                        .font(.custom("Poppins-Bold", size: 18))
                        .foregroundColor(.white)
                        .padding()
                case 1:
                    Login(selectedView: $selectedView, professionName: $professionName)
                        .ignoresSafeArea(.keyboard)
                case 2:
                    CreateAccount(professionName: $professionName, selectedView: $selectedView)
                case 3:
                    ForgotPassword(selectedView: $selectedView)
                case 4:
                    CreateNewPassword(selectedView: $selectedView)
                case 5:
                    AddressDetail(selectedView: $selectedView)
                        
                case 6:
                    ProfilePics(selectedView: $selectedView)
                case 7:
                    IDProof( selectedView: $selectedView)
                case 8:
                    Certificate(selectedView: $selectedView, professionName: $professionName)
                case 9:
                    BankDetail(selectedView: $selectedView)
                case 10:
                    CovidCertificate(selectedView: $selectedView)
                case 11:
                    FItzuCovidStatement(selectedView: $selectedView)
                case 12:
                    ProfileVerify(selectedView: $selectedView)
                default:
                    Login(selectedView: $selectedView, professionName: $professionName)
                }
            }
        }
        .background(.black, ignoresSafeAreaEdges: .all)
        .navigationBarHidden(true)
        .onTapGesture(perform: {
            hideKeyboard()
        })
    }
}


#Preview {
    AccountType()
}
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
