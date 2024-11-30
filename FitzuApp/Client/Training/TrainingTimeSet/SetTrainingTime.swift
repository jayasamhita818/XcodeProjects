//
//  SetTrainingTime.swift
//  FitzuApp
//
//  Created by rounak suri on 04/06/24.
//

import SwiftUI

struct SetTrainingTime: View {
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selectedDate = Date()
    @Binding var selectedDateString : String
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
                VStack{
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
                        Text("TIME TO TRAIN!")
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
                    
                    Spacer()
                    Text("Choose a date and start time")
                        .font(.custom("Poppins-Medium", size: 17))
                        .foregroundStyle(.yellowButton)
                        .padding(.bottom, -20)
                    
                    ZStack(alignment: .center){
                        DatePicker(
                            "Select date and time",
                            selection: $selectedDate,
                            displayedComponents: [.date, .hourAndMinute]
                        )
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        
                        Color.yellowButton
                            .frame(height: 30)
                            .opacity(0.4)
                            .allowsHitTesting(false)
                        
                        
                        
                        
                    }
                    
                    .padding()
                    
                    
                    Spacer()
                    
                    Button(action: {
                        selectedDateString = formattedDate(_: selectedDate)
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("SET DATE AND TIME")
                            .foregroundStyle(.white)
                            .bold()
                    })
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color(UIColor(named: "button_blue")!))
                    )
                    .padding(.bottom)
                    
                }
                .foregroundStyle(.black)
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
            
        }
        .animation(.easeInOut, value: menuScreenActive)
        .navigationBarHidden(true)
        .background(.black, ignoresSafeAreaEdges: .all)
        
    }
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E MMM d h:mm a" // Wed Aug 25 10:30 am
        return formatter.string(from: date)
        
    }
}

//#Preview {
//    SetTrainingTime()
//}
