//
//  Schedule.swift
//  FitzuApp
//
//  Created by rounak suri on 29/05/24.
//

import SwiftUI

struct Schedule: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var showingCalendar = false
    
    @State private var menuScreenActive: Bool = false
    
    @State private var viewDestination: String? = nil
    @State private var selectedSegment = 4
    
    @State private var selectedDateArr: [String] = []
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
                        Text("Schedule")
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
                    
                    HStack(alignment: .center){
                        Spacer()
                       
                            Text("Booked")
                                .font(.custom("Poppins-Bold", size: 17))
                           
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, -14)
                    .padding(.vertical, 5)
                    .background(Color.white)
                    .bold()
                    .cornerRadius(5)
                    
                    Spacer()
                    
                    
                    ScrollView{
                        
                        if selectedDateArr != [] {
                            
                            ForEach(selectedDateArr.indices, id: \.self) { index in
                                let date = selectedDateArr[index]
                                HStack(alignment: .center){
                                    Spacer()
                                    
                                    Text(date)
                                        .font(.custom("Poppins-Bold", size: 17))
                                    
                                    Spacer()
                                }
                                
                                Button(action: {
                                    self.viewDestination = "SelectedSessionDetail"
                                }){
                                    HStack(alignment: .center){
                                        Image("2380")
                                            .resizable()
                                            .frame(width: 70,height: 70)
                                            .cornerRadius(50)
                                        
                                        VStack(alignment: .leading){
                                            Text("David")
                                                .font(.custom("Poppins-Bold", size: 15))
                                                .padding(.bottom,2)
                                            Text("$80")
                                            
                                        }
                                        .padding(.leading,5)
                                        Spacer()
                                        
                                        VStack(alignment: .trailing){
                                            
                                            Text("21 Aug, 12:30 AM")
                                                .padding(.bottom,2)
                                            Text("12:30 AM")
                                            
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                    .padding(.vertical,5)
                                }
                                .padding(.vertical,5)
                                .background(Color.gray.opacity(0.2))
                                
                                Button(action: {
                                    self.viewDestination = "SelectedSessionDetail"
                                }){
                                    HStack(alignment: .center){
                                        Image("2380")
                                            .resizable()
                                            .frame(width: 70,height: 70)
                                            .cornerRadius(50)
                                        
                                        VStack(alignment: .leading){
                                            Text("David")
                                                .font(.custom("Poppins-Bold", size: 15))
                                                .padding(.bottom,2)
                                            Text("$80")
                                            
                                        }
                                        .padding(.leading,5)
                                        Spacer()
                                        
                                        VStack(alignment: .trailing){
                                            
                                            Text("21 Aug, 12:30 AM")
                                                .padding(.bottom,2)
                                            Text("12:30 AM")
                                            
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                    .padding(.vertical,5)
                                }
                                .padding(.vertical,5)
                                .background(Color.gray.opacity(0.2))
                                
                            }
                            
                        } else {
                            Button(action: {
                                self.viewDestination = "SelectedSessionDetail"
                            }){
                                HStack(alignment: .center){
                                    Image("2380")
                                        .resizable()
                                        .frame(width: 70,height: 70)
                                        .cornerRadius(50)
                                    
                                    VStack(alignment: .leading){
                                        Text("David")
                                            .font(.custom("Poppins-Bold", size: 15))
                                            .padding(.bottom,2)
                                        Text("$80")
                                        
                                    }
                                    .padding(.leading,5)
                                    Spacer()
                                    
                                    VStack(alignment: .trailing){
                                        
                                        Text("21 Aug, 12:30 AM")
                                            .padding(.bottom,2)
                                        Text("12:30 AM")
                                        
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.vertical,5)
                            }
                            .padding(.vertical,5)
                            .background(Color.gray.opacity(0.2))
                            Button(action: {
                                self.viewDestination = "SelectedSessionDetail"
                            }){
                                HStack(alignment: .center){
                                    Image("2380")
                                        .resizable()
                                        .frame(width: 70,height: 70)
                                        .cornerRadius(50)
                                    
                                    VStack(alignment: .leading){
                                        Text("David")
                                            .font(.custom("Poppins-Bold", size: 15))
                                            .padding(.bottom,2)
                                        Text("$80")
                                        
                                    }
                                    .padding(.leading,5)
                                    Spacer()
                                    
                                    VStack(alignment: .trailing){
                                        
                                        Text("21 Aug, 12:30 AM")
                                            .padding(.bottom,2)
                                        Text("12:30 AM")
                                        
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.vertical,5)
                            }
                            .padding(.vertical,5)
                            .background(Color.gray.opacity(0.2))
                        }
                        
                    }
                    .foregroundColor(.black)
                    .background(.white)
                    
                    
                    
                    Spacer()
                    
                    if selectedDateArr == [] {
                        Button(action: {
                            showingCalendar.toggle()
                            
                        })
                        {
                            Text("VIEW SCHEDULE")
                                .bold()
                                .foregroundStyle(.white)
                        }
                        
                        
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color(UIColor(named: "button_blue")!))
                        )
                        .padding(.bottom, 30)
                    } else {
                        HStack{
                            
                            NavigationLink(destination: TimeAvialability(), tag: "TimeAvialability", selection: $viewDestination) {
                                Button(action: {
                                    self.viewDestination = "TimeAvialability"
                                })
                                {
                                    Text("VIEW AVIALABILITY")
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                                
                                .frame(width: (UIScreen.main.bounds.width - 40)/2)
                                .padding(.vertical, 10)
                                
                                .background(
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .fill(Color(UIColor(named: "button_blue")!))
                                )
                            }
                            NavigationLink(destination: SetTimeAvailability(), tag: "SetTimeAvailability", selection: $viewDestination) {
                                Button(action: {
                                    self.viewDestination = "SetTimeAvailability"
                                    
                                })
                                {
                                    Text("SET AVIALABILITY")
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                                
                                
                                .padding(.vertical, 10)
                                .frame(width: (UIScreen.main.bounds.width - 40)/2)
                                .background(
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .fill(Color(UIColor(named: "button_blue")!))
                                )
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .padding(.bottom, 30)
                    }
                }
                .background(.white)
            }
            
            if showingCalendar == true {
                CustomCalender(showingCalendar: $showingCalendar, selectedDatesArr: $selectedDateArr)
                
            }
            if menuScreenActive {
                
                
                MenuScreen(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
                
            }
            
        }
        .animation(.easeInOut, value: menuScreenActive)
        .navigationBarHidden(true)
        .background(.black ,ignoresSafeAreaEdges: .all)
        NavigationLink(destination: SelectedSessionDetail( selectedSegment: $selectedSegment), tag: "SelectedSessionDetail", selection: $viewDestination) { EmptyView() }
    }
}

#Preview {
    Schedule()
}


