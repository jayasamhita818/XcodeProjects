    //
//  SelectedSessionDetail.swift
//  FitzuApp
//
//  Created by rounak suri on 28/05/24.
//
import UIKit
import SwiftUI

struct SelectedSessionDetail: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var menuScreenActive: Bool = false
    @Binding var selectedSegment : Int
    @State private var viewDestination: String? = nil
    @StateObject private var loginManager = LoginManager()
    
    @State private var cancelSession: Bool = false
    @State private var cancelationConfirmed: Bool = false
    
    @State private var rescheduleSession: Bool = false
    @State private var rescheduleCalender: Bool = false
    @State private var rescheduleConfirm: Bool = false
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
                            NavigationLink(destination: Booking(), tag: "Booking", selection: $viewDestination) {
                                Button(action: {
                                    if loginManager.selectedProfession == "Client" {
                                        if selectedSegment == 2 {
                                            self.viewDestination = "Booking"
                                        } else {
                                            self.presentationMode.wrappedValue.dismiss()
                                        }
                                    } else {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                    
                                    
                                }){
                                    Image("back")
                                        .resizable()
                                        .frame(width: 20,height: 20)
                                    
                                }
                                .padding(.leading)
                            }
                            Spacer()
                            Text("ClientName")
                                .font(.custom("Poppins-Bold", size: 20))
                            Spacer()
                           
                            if loginManager.selectedProfession == "Client" {
                                if selectedSegment == 2 {
                                    NavigationLink(destination: QRCodeStartSession(), tag: "QRCodeStartSession", selection: $viewDestination) {
                                        Button(action: {
                                            self.viewDestination = "QRCodeStartSession"
                                        }){
                                            Image("QR_code")
                                                .resizable()
                                                .frame(width: 30,height: 30)
                                            
                                        }
                                        .padding(.trailing)
                                    }
                                } else {
                                    Button(action: {
                                        self.viewDestination = "Booking"
                                }){
                                    Image("QR_code")
                                        .resizable()
                                        .frame(width: 20,height: 20)
                                    
                                }
                                .padding(.trailing)
                                .hidden()
                                }
                            }
                               
                        }
                        .padding(.vertical)
                        .background(.navigationBar)
                        ScrollView(showsIndicators: false) {
                            VStack{
                                if selectedSegment == 3 {
                                    HStack{
                                        Spacer()
                                        Text("Session Cancelled")
                                            .font(.custom("Poppins-Bold", size: 20))
                                            .padding(.vertical)
                                        Spacer()
                                    }
                                    .foregroundStyle(.white)
                                    .background(.red)
                                }
                                
                                Image("2380")
                                    .resizable()
                                    .frame(width: 70,height: 70)
                                    .cornerRadius(35)
                                    .padding(.top, 20)
                                
                                
                                
                                HStack(spacing: 20) {
                                    
                                    if loginManager.selectedProfession == "Client"{
                                        if selectedSegment == 2 {
                                            Button(action: {
                                                self.viewDestination = "MessageChat"
                                            }) {
                                                Text("Message Trainer")
                                                    .foregroundColor(.buttonBlue)
                                            }
                                            .padding(.vertical,5)
                                            .padding(.horizontal,20)
                                            //.frame(width: UIScreen.main.bounds.width/2.5)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.buttonBlue, lineWidth: 1)
                                            )
                                        }
                                    } else {
                                        if selectedSegment == 1{
                                            Button(action: {
                                                self.viewDestination = "Reviews"
                                            }) {
                                                Text("See Review")
                                                    .foregroundColor(.buttonBlue)
                                            }
                                            .padding(.vertical,5)
                                            .padding(.horizontal,20)
                                            .frame(width: UIScreen.main.bounds.width/2.5)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.buttonBlue, lineWidth: 1)
                                            )
                                        } else if selectedSegment == 2 {
                                            Button(action: {
                                                self.viewDestination = "MessageChat"
                                                
                                            }) {
                                                Text("Message Client")
                                                    .foregroundColor(.buttonBlue)
                                            }
                                            .padding(.vertical,5)
                                            .padding(.horizontal,20)
                                            .frame(width: UIScreen.main.bounds.width/2.5)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.buttonBlue, lineWidth: 1)
                                            )
                                            
                                            Button(action: {
                                                self.viewDestination = "Reviews"
                                            }) {
                                                Text("See Review")
                                                    .foregroundColor(.buttonBlue)
                                            }
                                            .padding(.vertical,5)
                                            .padding(.horizontal,20)
                                            .frame(width: UIScreen.main.bounds.width/2.5)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.buttonBlue, lineWidth: 1)
                                            )
                                        }
                                        
                                        else if selectedSegment == 4 {
                                            Button(action: {
                                                self.viewDestination = "MessageChat"
                                                
                                            }) {
                                                Text("Message Client")
                                                    .foregroundColor(.buttonBlue)
                                            }
                                            .padding(.vertical,5)
                                            .padding(.horizontal,20)
                                            .frame(width: UIScreen.main.bounds.width/2.5)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.buttonBlue, lineWidth: 1)
                                            )
                                        }
                                    }
                                    
                                    
                                }
                                .padding()
                                
                                VStack(alignment: .leading){
                                    Text("Address")
                                    VStack(spacing: 5){
                                        HStack{
                                            Image("pin")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            Text("Patiala, Punjabm India")
                                            Spacer()
                                            Image("Group 34")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                        }
                                        Color.gray.opacity(0.4)
                                            .frame(height: 2)
                                        
                                    }
                                    
                                    Text("Date")
                                    HStack{
                                        Image("calendar")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("Mon, 19th August")
                                    }
                                    
                                    Text("Time")
                                    HStack{
                                        Image("clock (1)")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("09:30 AM - 10:30 AM")
                                    }
                                    
                                    Text("Attendees")
                                    HStack{
                                        Image("man-user")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("3")
                                    }
                                    
                                    Text("Fees")
                                    HStack{
                                        Image("business-and-finance")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("240")
                                    }
                                    
                                    Text("Service")
                                    HStack{
                                        Image("legal")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("Personal Trainig")
                                    }
                                    
                                    Text("Note")
                                    
                                    Text("msdklh jisdnknvs dfjnjsdnv  gihsgivnf dhvifd n gjkv bfusv jkdfhgbhdf jb ifdjkvf dj hv jkfdbjk fdjk bhvfj dgb kgdhj kbgfhbjd gbgf hbjkgbj kdgho udjk")
                                        .foregroundColor(.gray.opacity(0.4))
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(.gray.opacity(0.4), lineWidth: 1)
                                        )
                                    
                                    
                                    Spacer()
                                    
                                    
                                    if loginManager.selectedProfession == "Client"{
                                        if selectedSegment == 1 {
                                            HStack{
                                                Spacer()
                                                Button(action: {})
                                                {
                                                    Text("BOOK AGAIN")
                                                        .bold()
                                                }
                                                .foregroundStyle(.white)
                                                .padding(.vertical, 10)
                                                .padding(.horizontal, 50)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 25.0)
                                                        .fill(Color(UIColor(named: "button_blue")!))
                                                )
                                                .padding(.bottom, 30)
                                                Spacer()
                                            }
                                            .padding(.top, 20)
                                        } else if selectedSegment == 2 {
                                            HStack(spacing: 5){
                                                
                                                Button(action: {
                                                    rescheduleSession = true
                                                })
                                                {
                                                    HStack{
                                                        Spacer()
                                                        Text("RESCHEDULE")
                                                            .bold()
                                                        Spacer()
                                                    }
                                                }
                                                .foregroundStyle(.white)
                                                .padding(.vertical, 10)
                                                .frame(height: 38)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 25.0)
                                                        .fill(Color(UIColor(named: "button_blue")!))
                                                )
                                                .padding(.bottom, 30)
                                                
                                                Button(action: {
                                                    cancelSession = true
                                                })
                                                {
                                                    HStack{
                                                        Spacer()
                                                        Text("CANCEL THIS SESSION")
                                                            .bold()
                                                        Spacer()
                                                    }
                                                }
                                                .foregroundStyle(.white)
                                                .padding(.vertical, 10)
                                                .frame(height: 38)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 25.0)
                                                        .fill(Color(UIColor(named: "button_blue")!))
                                                )
                                                .padding(.bottom, 30)
                                            }
                                            .padding(.top, 20)
                                        }
                                    } else {
                                        if selectedSegment == 2{
                                            HStack{
                                                Spacer()
                                                NavigationLink(destination: TrainingTime(), tag: "TrainingTime", selection: $viewDestination) {
                                                    Button(action: {
                                                        self.viewDestination = "TrainingTime"
                                                    })
                                                    {
                                                        Text("SCAN QR CODE")
                                                            .bold()
                                                    }
                                                    .foregroundStyle(.white)
                                                    .padding(.vertical, 10)
                                                    .padding(.horizontal, 50)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 25.0)
                                                            .fill(Color(UIColor(named: "button_blue")!))
                                                    )
                                                    .padding(.bottom, 30)
                                                }
                                                Spacer()
                                            }
                                            .padding(.top, 20)
                                        }
                                    }
                                    
                                    
                                }
                                .padding(.leading, 20)
                                .padding(.trailing,20)
                            }
                            .background(.white)
                            if loginManager.selectedProfession == "Client"{
                                Text("Find a Trainer to suit you")
                                    .font(.custom("Poppins-Bold", size: 20))
                                    .foregroundStyle(.white)
                                    .padding(.vertical)
                            }
                        }
                        .onAppear(perform: {
                            UIScrollView.appearance().bounces = false
                        })
                        
                        
                    }
                    
                   
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
                
                if cancelSession {
                    CustomSingleBtnAlertView(title: "As per booking T&C's, cancelling this booking will incur a 100% cancellation fee. Are sure want to cancel?", description: "", buttonTitle: "CONFIRM", customAlertActive: $cancelSession, buttonAction: {
                        cancelationConfirmed = true
                        selectedSegment = 3
                    }, cancelDisplay: true)
                }
                if cancelationConfirmed {
                    cancelSessionConfirmed()
                    
                }
                if rescheduleSession == true {
                    rescheduleAlert()
                }
                if rescheduleCalender {
                    CustomDatePicker(customAlertActive: $rescheduleCalender, buttonAction: { rescheduleConfirm = true})
                }
                
                if rescheduleConfirm {
                    CustomDoubleBtnAlertView(title: "Click here to confirm reschedule appointment to the new time", description: "", buttonTitle1: "CONFIRM", buttonAction1: { rescheduleConfirm = false}, buttonTitle2: "BACK", buttonAction2: {rescheduleCalender = true}, customAlertActive: $rescheduleConfirm)
                }
            }
             .animation(.easeInOut, value: menuScreenActive)
            .navigationBarHidden(true)
            .background(.black ,ignoresSafeAreaEdges: .all)
        
        
        NavigationLink(destination: MessageChat(), tag: "MessageChat", selection: $viewDestination) { EmptyView() }
        NavigationLink(destination: Reviews(), tag: "Reviews", selection: $viewDestination) { EmptyView() }
    }
    
    func cancelSessionConfirmed() -> some View {
        ZStack{
            Color.black.opacity(0.5)
            Text("Your booking has been cancelled, Session charges has been debited from your card")
                .font(.custom("Poppins-SemiBold", size: 20))
                .multilineTextAlignment(.center)
                .padding(10)
                .padding(.vertical, 10)
                .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                )
                .padding(.leading,20)
                .padding(.trailing, 20)
        }
        .background(Color.black.opacity(0.5))
        .onTapGesture {
            cancelationConfirmed = false
        }
    }
    
    func rescheduleAlert() -> some View {
        ZStack{
            Color.black.opacity(0.5)
            
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        rescheduleSession = false
                    }) {
                      Image("cancel_red")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                }
                
                HStack{
                    Text("Cancellation Policy")
                        .font(.custom("Poppins-SemiBold", size: 20))
                    Spacer()
                }
                ScrollView{
                    Text("First of all, thanks for signing up with Fitzu.")
                    Text("")
                    Text("As we approach the last few months of 2021, physical health, mental health, lockdown and vaccinations continue to be big issues.")
                }
                .foregroundStyle(.gray)
                .frame( height: 200)
                .padding(5)
                .border(.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                HStack{
                    Spacer()
                    Text("Do you wish to reschedule this appointment?")
                        .font(.custom("Poppins-SemiBold", size: 17))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
                HStack{
                    Button(action: {
                        rescheduleCalender = true
                        rescheduleSession = false
                    })
                    {
                        Text("YES")
                            .bold()
                    }
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .frame(width: 100)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color(UIColor(named: "button_blue")!))
                    )
                    Spacer()
                    
                    Button(action: {
                        rescheduleSession = false
                    })
                    {
                        Text("NO")
                            .bold()
                    }
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .frame(width: 100)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color(UIColor(named: "button_blue")!))
                    )
                }
                .padding(.bottom, 20)
                .padding(.leading,20)
                .padding(.trailing, 20)
            }
            .padding(10)
            .padding(.vertical, 10)
            .padding(.leading,10)
            .padding(.trailing, 10)
            .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
            )
            .padding(.leading,20)
            .padding(.trailing, 20)
        }
        .background(Color.black.opacity(0.5))
    }
}

#Preview {
    SelectedSessionDetail(selectedSegment: .constant(2))
}

