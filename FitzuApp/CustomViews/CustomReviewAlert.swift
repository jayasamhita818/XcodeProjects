//
//  CustomReviewAlert.swift
//  FitzuApp
//
//  Created by HR Ultivic on 12/06/24.
//

import SwiftUI

struct CustomTrainerReviewAlert: View {
    @State var name: String = "ClientName"
    @Binding var customAlertActive: Bool
    @State var buttonTitle: String = "SUBMIT"
    var buttonAction: () -> Void
    @State private var reviewText: String = ""
    @State private var textStyle = UIFont.TextStyle.body
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                
                HStack{
                    Spacer()
                    Button(action: {
                        customAlertActive = false
                        buttonAction()
                    }) {
                      Image("cancel_red")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                }
                
                Text("Congratulations Session completed Successfully!")
                    .font(.custom("Poppins-Bold", size: 22))
                    .foregroundStyle(.buttonBlue)
                    .padding(.top, -20)
                
                
                HStack{
                    Image("2380")
                        .resizable()
                        .frame(width: 60,height: 60)
                        .cornerRadius(30)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(name)
                        HStack(spacing:1){
                            Image("star-1")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Image("star-1")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Image("star-1")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Image("star-1")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Image("star (1)")
                                .resizable()
                                .frame(width: 12, height: 12)
                        }
                       
                    }
                    Spacer()
                }
                
                HStack{
                    Text("Write a review:")
                Spacer()
                }
                .padding(.bottom, -10)
                ZStack(alignment: .topLeading) {
                    if reviewText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        Text("Write your feedback..")
                            .foregroundColor(.gray)
                            .bold()
                    }
                    
                    TextView(text: $reviewText, textStyle: $textStyle)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .background(.clear)
                        .frame(height: 150)
                }
                
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.1))))
                
                Button(action: {
                    customAlertActive = false
                    buttonAction() // Execute the passed action
                }) {
                    Text(buttonTitle)
                        .foregroundStyle(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 40)
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color(UIColor(named: "button_blue")!))
                        )
                    
                    
                }
                
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
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
    CustomDatePicker(customAlertActive: .constant(true), buttonAction: {})
}


struct CustomDatePicker: View {
    @State private var selectedDate = Date()
    @Binding var customAlertActive: Bool
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.0)
            VStack {
                Text("Choose a date and start time")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .padding()
                    .foregroundColor(.yellowButton)
                    .padding()
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .frame(height: 150)
                
                Button(action: {
                    customAlertActive = false
                    buttonAction()
                    print("Date and Time set to: \(selectedDate)" )
                }) {
                    Text("SET DATE AND TIME")
                        .foregroundStyle(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color(UIColor(named: "button_blue")!))
                        )
                }
                .padding()
                .padding()
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
        .background(Color.black.opacity(0.5),ignoresSafeAreaEdges: .all )
    }
}


