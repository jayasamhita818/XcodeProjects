//
//  Alerts.swift
//  FitzuApp
//
//  Created by rounak suri on 10/06/24.
//

import Foundation
import SwiftUI

struct CustomSingleBtnAlertView: View {
    
    var title: String
    var description: String
    var buttonTitle: String
    
   
    @Binding var customAlertActive: Bool

    var titleColor = Color.black
    var descriptionColor = Color.gray
    var buttonAction: () -> Void // Closure for button action
    
    @State var cancelDisplay : Bool = false
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                
                if cancelDisplay {
                    HStack{
                        Spacer()
                        Button(action: {
                            customAlertActive = false
                        }) {
                            Image("cancel_red")
                                .resizable()
                                .frame(width: 15, height: 15)
                        }
                    }
                    .padding(.bottom, -20)
                }
                Text(title)
                    .font(.custom("Poppins-Bold", size: 20))
                    .foregroundStyle(titleColor)
                    .multilineTextAlignment(.center)
                
                Text(description)
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    customAlertActive = false
                    buttonAction() // Execute the passed action
                }) {
                    Text(buttonTitle)
                        .foregroundStyle(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 50)
                
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color(UIColor(named: "button_blue")!))
                        )
                    
                    
                }
                
            }
            .padding(.horizontal, 10)
            .frame(width: UIScreen.main.bounds.width * 0.75)
            .padding(.vertical, 15)
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


struct CustomDoubleBtnAlertView: View {
    
    var title: String
    var description: String
    
    var buttonTitle1: String
    var buttonAction1: () -> Void
   
    var buttonTitle2: String
    var buttonAction2: () -> Void
    
    @Binding var customAlertActive: Bool

    var titleColor = Color.black
     
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack{
                    Spacer()
                    Button(action: {
                        customAlertActive = false
                    }) {
                      Image("cancel_red")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                }
                
                Text(title)
                    .font(.custom("Poppins-Bold", size: 20))
                    .foregroundStyle(titleColor)
                    .padding(.top, -20)
                    .multilineTextAlignment(.center)
                Text(description)
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                    .multilineTextAlignment(.center)
                
                HStack(spacing:20){
                    
                    Button(action: {
                        customAlertActive = false
                        buttonAction1() // Execute the passed action
                    }) {
                        Text(buttonTitle1)
                            .foregroundStyle(.white)
                            .padding(.vertical, 5)
                            .frame(width: 110)
                        
                            .background(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color(UIColor(named: "button_blue")!))
                            )
                        
                        
                    }
                    
                    Button(action: {
                        customAlertActive = false
                        buttonAction2() // Execute the passed action
                    }) {
                        Text(buttonTitle2)
                            .foregroundStyle(.white)
                            .padding(.vertical, 5)
                            .frame(width: 110)
                        
                            .background(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color(UIColor(named: "button_blue")!))
                            )
                        
                        
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 20)
            .frame(width: UIScreen.main.bounds.width * 0.8)
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


struct CustomIDPicker: View {
    @Binding var isActive: Bool
    @State private var selectedIdProofno = 0
    @Binding var idProofs : [String]
    @Binding var selectedString: String
    
    var firstBtnTittle: String
    var secondBtnTittle: String
    var pickerTittle: String
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color.black.opacity(0.5)
            
            VStack(spacing:0){
                
                HStack{
                    
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isActive = false
                        }
                    }){
                        Text(firstBtnTittle)
                            .foregroundStyle(.white)
                    }
                    .padding(.leading)
                    .font(.subheadline)
                    
                    Spacer()
                    
                    Text(pickerTittle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Spacer()
                    
                    Button(action: {
                        selectedString = idProofs[selectedIdProofno]
                        withAnimation(.easeInOut) {
                            isActive = false
                        }
                    }){
                        Text(secondBtnTittle)
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    }
                    .padding(.trailing)
                }
                .frame(maxWidth: .infinity)
               // .padding(.vertical)
                .background(Color.yellow)
                .padding(.bottom, 20)
                
                ZStack(alignment: .center){
                    
                    Picker(selection: $selectedIdProofno, label: Text("Select ID Proof")) {
                        ForEach(0..<idProofs.count) { index in
                            
                            Text(self.idProofs[index])
                        }
                       
                        
                    }
                    .pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                     
                    Color.yellowButton
                        .frame(height: 30)
                        .opacity(0.4)
                        .allowsHitTesting(false)
                }
                
                 .frame(height: UIScreen.main.bounds.height * 0.3)
            }
            .frame(height: 300)
            .background(.white)
            
           
        }
    }
}
