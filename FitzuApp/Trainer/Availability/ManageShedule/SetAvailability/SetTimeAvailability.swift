//
//  SetTimeAvailability.swift
//  FitzuApp
//
//  Created by HR Ultivic on 12/06/24.
//

import SwiftUI

struct SetTimeAvailability: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    @State var timeAvailabilityActive: Bool = false
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
                        Text("Availability")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        
                            Button(action: {
                                timeAvailabilityActive = true
                            }){
                                Image("cancelll")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                    .rotationEffect(Angle(degrees: 45))
                                    .padding(.trailing)
                                
                            }
                        
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    
                    ScrollView{
                        
                        Text("Thu, Jun 12")
                            .font(.custom("Poppins-Bold", size: 20))
                            .padding(.vertical, 5)
                        VStack{
                            HStack{
                                Text("Slot 1")
                                    .font(.custom("Poppins-Bold", size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                
                                VStack(spacing: 8){
                                    Text("Start After")
                                    Text("End Before")
                                }
                                .foregroundColor(.gray)
                                Spacer()
                                
                                VStack(spacing: 8){
                                    Text("09:00 AM")
                                    Text("12:30 AM")
                                }
                                .foregroundStyle(.gray)
                                Spacer()
                                
                                Button(action: {}){
                                    Text("Delete")
                                        .foregroundStyle(.red)
                                }
                            }
                            .padding(.leading)
                            .padding(.trailing)
                            .padding(.vertical, 20)
                            .background(.black.opacity(0.1))
                            
                        }
                    }
                }
                .background(.white)
            }
            if menuScreenActive {
                MenuScreen(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
                
            }
            if timeAvailabilityActive {
                TimeAvailabilityAlertView(title: "thu,Aug 12", buttonTitle: "Done", timeAvailabilityActive: $timeAvailabilityActive, buttonAction: { })
            }
            
        }
        .animation(.easeInOut, value: menuScreenActive)
        .navigationBarHidden(true)
        .background(.black ,ignoresSafeAreaEdges: .all)
    }
}

//#Preview {
//TimeAvailabilityAlertView(title: "Thu, Aug 12", buttonTitle: "Done", buttonAction: {})
//}

struct TimeAvailabilityAlertView: View {
    
    var title: String
   
    var buttonTitle: String
    
   
    @Binding var timeAvailabilityActive: Bool

    var titleColor = Color.black
    
    var buttonAction: () -> Void // Closure for button action
    
//    @State  var startTime: String = "02:00 AM"
//    @State  var endTime: String = "12:30 PM"
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text(title)
                    .font(.custom("Poppins-Medium", size: 20))
                    .foregroundStyle(titleColor)
                
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Start Time")
                            .foregroundStyle(.gray)
                            .font(.custom("Poppins-Regular", size: 15))
//                        TextField("", text: $startTime)
//                            .font(.custom("Poppins-Bold", size: 20))
//                                       .foregroundColor(.black)
//                                       .background(.clear)
//                                       .padding(.bottom,-8)
                        
                        DatePicker("", selection: $startTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .font(.custom("Poppins-Bold", size: 20))
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
                    //    TextField("", text: $endTime)
                        DatePicker("", selection: $endTime, displayedComponents: .hourAndMinute)
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
                    timeAvailabilityActive = false
                    buttonAction() // Execute the passed action
                }) {
                    Text(buttonTitle)
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
