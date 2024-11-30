//
//  TimeAvialability.swift
//  FitzuApp
//
//  Created by rounak suri on 30/05/24.
//

import SwiftUI

struct TimeAvialability: View {
    @State private var date = Date.now
    let daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var menuScreenActive: Bool = false
    @State private var viewDestination: String? = nil
    
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
                    ScrollView{
                        VStack{
                            
                            HStack{
                                
                                Button(action: {withAnimation(.none) {moveToPreviousWeek()
                                }}){
                                    Image("blue_left")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                }
                                
                                Text("\(getWeekDays(from:date).first! , formatter: customDateFormatter) - \(getWeekDays(from:date).last!, formatter: customDateFormatter2)")
                                    .padding(.horizontal, 20)
                                
                                Button(action:{ withAnimation(.none) {moveToNextWeek()}}){
                                    Image("blue_right")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                }
                            }
                            .padding(.vertical)
                            
                            VStack(spacing: 10){
                                HStack {
                                    ForEach((daysOfWeek).indices, id: \.self) { index in
                                        Text(daysOfWeek[index])
                                            .fontWeight(.black)
                                            .foregroundStyle(.gray.opacity(0.4))
                                            .frame(maxWidth: .infinity)
                                    }
                                }
                                
                                HStack{
                                    
                                    
                                    ForEach(getWeekDays(from: date), id: \.self) { day in
                                        Text("\(day, formatter: dateFormatter)")
                                            .frame(maxWidth: .infinity)
                                    }
                                }
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.gray.opacity(0.2))
                            )
                            
                            Spacer(minLength: 20)
                            
                            ScheduleGraph()
                            
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    }
                }
                .background(.white)
            }
            
            if menuScreenActive {
                
                
                MenuScreen(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
                
            }
            
        }
        .animation(.easeInOut, value: menuScreenActive)
        .navigationBarHidden(true)
        .background(.black ,ignoresSafeAreaEdges: .all)
    }
    
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }
    private var customDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        return formatter
    }
    private var customDateFormatter2: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }
    private func moveToPreviousWeek() {
        if let newDate = Calendar.current.date(byAdding: .day, value: -7, to: date) {
            date = newDate
        }
    }
    
    private func moveToNextWeek() {
        if let newDate = Calendar.current.date(byAdding: .day, value: 7, to: date) {
            date = newDate
        }
    }
    
    private func getWeekDays(from date: Date) -> [Date] {
        var calendar = Calendar.current
        calendar.firstWeekday = 2 // Set the first weekday to Monday (1 is Sunday, 2 is Monday, etc.)
        
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: date)?.start ?? date
        
        return (0..<5).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
}

#Preview {
    TimeAvialability()
}

struct ScheduleGraph: View {
    let times: [String] = {
            var times = [String]()
            for hour in 9...21 {
                let amPm = hour < 12 ? "AM" : "PM"
                let displayHour = hour % 12 == 0 ? 12 : hour % 12
                times.append("\(displayHour) \(amPm)")
            }
            return times
        }()
    
    var body: some View {
        
        HStack(alignment: .top){
            
            VStack(spacing: 35){
                ForEach(times.indices, id: \.self) { indexPath in
                    let time = times[indexPath]
                    Text(time)
                        .foregroundStyle(.gray)
                }
            }
            
            VStack(spacing: 0){
                Color.red
                    .frame(height: 5)
                Color.red
                    .frame(height: 30)
                   
                Color.yellow
                    .frame(height: 180)
                Color.red
                    .frame(height: 90)
                Color.yellow
                    .frame(height: 180)
            }
            .frame(width: 10)
            
            
            VStack(spacing: 0){
                
                HStack{
                    Spacer()
                    Text("Not available")
                    Spacer()
                }
                .frame(height: 35)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Stephen")
                            .font(.custom("Poppins-Medium", size: 17))
                        Text("09:30 AM - 10:30 AM")
                    }
                    Spacer()
                }
                .frame(height: 60)
                .background(.green)
                
                HStack{
                    Spacer()
                    Text("Available")
                    Spacer()
                }
                .frame(height: 60)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Stephen")
                            .font(.custom("Poppins-Medium", size: 17))
                        Text("09:30 AM - 10:30 AM")
                    }
                    Spacer()
                }
                .frame(height: 60)
                .background(.green)
                
                HStack{
                    Spacer()
                    Text("Not available")
                    Spacer()
                }
                .frame(height: 90)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Stephen")
                            .font(.custom("Poppins-Medium", size: 17))
                        Text("09:30 AM - 10:30 AM")
                    }
                    Spacer()
                }
                .frame(height: 60)
                .background(.green)
            }
        }
    }
}
