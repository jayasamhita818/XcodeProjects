//
//  AddNewCard.swift
//  FitzuApp
//
//  Created by rounak suri on 03/06/24.
//


import SwiftUI

struct AddNewCard: View {
    @State private var toHomeScreen: Bool = false
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    
    @State private var creditCardNumber = ""
    @State private var creditCardExpiryNumber = ""
    @State private var creditCardCVCNumber = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var customAlertActive: Bool = false
    func formatCreditCardNumber(_ number: String) -> String {
           // Remove any non-digit characters
           let digitsOnly = number.filter { $0.isNumber }
           
           // Limit to 16 digits
           let limitedDigits = String(digitsOnly.prefix(16))
           
           // Group into 4-digit chunks
           var result = ""
           for (index, digit) in limitedDigits.enumerated() {
               if index > 0 && index % 4 == 0 {
                   result += " "
               }
               result.append(digit)
           }
           
           return result
       }
    
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
                        Text("Wallet")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        Button(action: {}){
                            Image("back")
                                .resizable()
                                .frame(width: 30,height: 30)
                            
                        }.hidden()
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    .padding(.bottom)
                   
                    VStack(alignment: .leading){
                        Text("Card number")
                            .font(.system(size: 17))
                            .foregroundColor(.buttonBlue)
                        HStack{
                            Image("card")
                                .resizable()
                                .frame(width: 20,height: 20)
                            
                            TextField("1234 1234 1234 1234", text: $creditCardNumber)
                                           .keyboardType(.numberPad) // Show number pad
                                           .onChange(of: creditCardNumber) { newValue in
                                               // Format the input as credit card number
                                               let formattedText = formatCreditCardNumber(newValue)
                                               if formattedText != newValue {
                                                   creditCardNumber = formattedText
                                               }
                                           }
                                           .font(.system(size: 17))
                                           .foregroundColor(.black)
                                           .background(.clear)
                            
                        }
                        Color.buttonBlue
                            .frame(height: 1)
                    }
                    .padding()
                    
                    HStack(spacing: 40){
                        VStack(alignment: .leading, spacing: 2){
                            TextField("Expiry", text: $creditCardExpiryNumber)
                            Color.gray
                                .frame(height: 1)
                        }
                        
                        VStack(alignment: .leading, spacing: 2){
                            TextField("CVC", text: $creditCardCVCNumber)
                            Color.gray
                                .frame(height: 1)
                        }
                        .keyboardType(.numberPad) // Show number pad
                        VStack(alignment: .leading, spacing: 2){
                            TextField("CVC", text: $creditCardExpiryNumber)
                            Color.gray
                                .frame(height: 1)
                        }
                        .hidden()
                    }
                    
                    .padding()
                    Spacer()
                    
                    Button(action: {
                        customAlertActive = true
                    }, label: {
                        Text("SAVE")
                            .foregroundStyle(.white)
                            .bold()
                    })
                    .padding(.vertical, 10)
                    .padding(.horizontal, 50)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color(UIColor(named: "button_blue")!))
                    )
                    .padding(.bottom, 20)
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
            
            if customAlertActive == true {
                CustomSingleBtnAlertView(title: "Card Added",
                                         description: "Your account is setup and ready to go back to a trainer now!",
                                         buttonTitle: "BOOK A TRAINER",
                                         customAlertActive: $customAlertActive,
                                         buttonAction: {
                    self.viewDestination = "ClientHome"
                })
                
            }
            
            NavigationLink(destination: ClientHome(), tag: "ClientHome", selection: $viewDestination) {EmptyView()}
        }
        .animation(.easeInOut, value: menuScreenActive)
        .background(.black, ignoresSafeAreaEdges: .all)
        .navigationBarHidden(true)
    }
}

#Preview {
    AddNewCard()
}
