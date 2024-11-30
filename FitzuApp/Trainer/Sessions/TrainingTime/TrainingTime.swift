//
//  TrainingTime.swift
//  FitzuApp
//
//  Created by HR Ultivic on 12/06/24.
//

import SwiftUI

struct TrainingTime: View {
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var loginManager = LoginManager()
    @State private var inputHours: String = "1"
    @State private var remainingTime: Int = 0
    @State private var timerActive = false
    @State private var timer: Timer?
    
    @State private var reviewAlert: Bool = false
    
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
                    
                    
                    Text("Session ID: 2345678")
                        .font(.custom("Poppins-Medium", size: 20))
                        .padding(.top, 50)
                    VStack{
                        Image("clock_new")
                            .resizable()
                            .frame(width: 150, height: 150)
                        
                        if timerActive {
                            Text(timeString(from: remainingTime))
                                .font(.custom("Poppins-Medium", size: 60))
                                .foregroundColor(remainingTime <= 300 ? .red : .buttonBlue)
                        } else {
                            Text("00:00")
                                .font(.custom("Poppins-Medium", size: 60))
                                .foregroundColor(.red)
                                
                        }
                    }
                    .padding(.vertical, 30)
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .background(.yellowButton.opacity(0.5))
                    
                    if remainingTime == 0 {
                        Text("Session Completed")
                            .font(.custom("Poppins-SemiBold", size: 30))
                            .padding(.top, 10)
                    } else {
                        Text("Remaining")
                            .font(.custom("Poppins-SemiBold", size: 30))
                            .padding(.top, 10)
                    }
                        
                    Spacer()
                }
                .background(.white)
                
                
            }
            
            if menuScreenActive {
                if loginManager.selectedProfession == "Client"{
                    ClientMenu(menuScreenActive: $menuScreenActive)
                        .transition(.move(edge: .bottom))
                } else {
                    MenuScreen(menuScreenActive: $menuScreenActive)
                        .transition(.move(edge: .bottom))
                }
            }
            
            if reviewAlert {
                CustomTrainerReviewAlert(customAlertActive: $reviewAlert, buttonAction: { self.viewDestination = "HomeScreen"})
            }
            NavigationLink(destination: HomeScreen(), tag: "HomeScreen", selection: $viewDestination) {EmptyView()}
        }
        .animation(.easeInOut, value: menuScreenActive)
        .navigationBarHidden(true)
        .background(.black ,ignoresSafeAreaEdges: .all)
        .onDisappear {
                    timer?.invalidate()
                }
        .onAppear{
            startTimer()
        }
    }
    func startTimer() {
            if let hours = Int(inputHours) {
                remainingTime = hours * 3600
                timer?.invalidate()
                timerActive = true
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    if remainingTime > 0 {
                        remainingTime -= 1
                    } else {
                        timer?.invalidate()
                        timerActive = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                                reviewAlert = true
                                            }
                    }
                }
            }
        }
        
        func timeString(from seconds: Int) -> String {
            let hours = seconds / 3600
            let minutes = (seconds % 3600) / 60
            let seconds = (seconds % 3600) % 60
            return String(format: "%02d:%02d",  minutes, seconds)
        }
}

#Preview {
    TrainingTime()
}
