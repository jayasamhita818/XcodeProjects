//
//  CustomCalender.swift
//  FitzuApp
//
//  Created by rounak suri on 30/05/24.
//
import Combine
import SwiftUI

struct CustomCalender: View {
    @Binding var showingCalendar: Bool
    @State private var date = Date.now
    @State private var selectedDate: Date?
    
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [Date] = []
    private let dateChangePublisher = PassthroughSubject<Date, Never>()
    
    
    @Binding var selectedDatesArr: [String]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                
            VStack {
                Text("Click a date to view or set schedule")
                    .padding(.top)
                    .foregroundColor(.buttonBlue)
                HStack {
                    Button(action: { withAnimation(.none) { moveToPreviousMonth() } }) {
                        Image("blue_left")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                    Text(formattedDate(date))
                        .padding(.horizontal, 20)
                    
                    Button(action: { withAnimation(.none) { moveToNextMonth() } }) {
                        Image("blue_right")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .padding(.bottom)
                HStack {
                    ForEach(daysOfWeek.indices, id: \.self) { index in
                        Text(daysOfWeek[index])
                            .fontWeight(.black)
                            .foregroundStyle(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)
                LazyVGrid(columns: columns) {
                    ForEach(days, id: \.self) { day in
                        if day.monthInt != date.monthInt {
                            Text("")
                                .frame(maxWidth: .infinity, minHeight: 40)
                        } else {
                            Text(day.formatted(.dateTime.day()))
                                .fontWeight(.bold)
                                .foregroundStyle(.gray.opacity(0.4))
                                .frame(maxWidth: .infinity, minHeight: 40)
                                
                                .background(
                                    Rectangle()
                                        .foregroundColor(day.startOfDay == selectedDate?.startOfDay ? Color.yellow : .clear)
                                        .padding(.horizontal, -4)
                                )
                                .background(
                                    Rectangle()
                                        .foregroundColor(day.startOfDay == Date.now.startOfDay ? Color.yellow : .clear)
                                        .padding(.horizontal, -4)
                                )
                                .background(
                                                                    Rectangle()
                                                                        .foregroundColor(isDateInRange(day) ? Color.yellow.opacity(0.4) : .clear)
                                                                        .padding(.horizontal, -4)
                                                                )
                                .onTapGesture {
                                    selectedDate = day
                                }
                        }
                    }
                }
                .padding(.horizontal)
                .onAppear {
                    days = date.calendarDisplayDays
                    
                }
                .onChange(of: date) { newDate in
                    days = newDate.calendarDisplayDays
                }
                
                Button(action: {
                    appendDatesToArray()
                    showingCalendar.toggle()
                }, label: {
                    Text("VIEW")
                        .bold()
                        .foregroundStyle(.white)
                })
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(UIColor(named: "button_blue")!))
                )
                .padding(.top, 30)
                .padding(.bottom, 20)
            }
            .background(
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(.white)
            )
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
        .background(.black.opacity(0.3), ignoresSafeAreaEdges: .all)
    }
    
    private func moveToPreviousMonth() {
        if let newDate = Calendar.current.date(byAdding: .month, value: -1, to: date) {
            date = newDate
        }
    }

    private func moveToNextMonth() {
        if let newDate = Calendar.current.date(byAdding: .month, value: 1, to: date) {
            date = newDate
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    func formattedDateAndDay(_ date: Date) -> String {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "d"
        let day = Int(dayFormatter.string(from: date)) ?? 0
        let daySuffix = daySuffix(for: day)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d'\(daySuffix)' MMM"
        return dateFormatter.string(from: date)
    }

    func daySuffix(for day: Int) -> String {
        switch day {
        case 11, 12, 13:
            return "th"
        default:
            switch day % 10 {
            case 1:
                return "st"
            case 2:
                return "nd"
            case 3:
                return "rd"
            default:
                return "th"
            }
        }
    }
    func isDateInRange(_ day: Date) -> Bool {
            guard let selected = selectedDate else { return false }
            let today = Date.now.startOfDay
            return (today < day.startOfDay && day.startOfDay < selected.startOfDay) ||
                   (selected.startOfDay < day.startOfDay && day.startOfDay < today)
        }
    private func appendDatesToArray() {
        selectedDatesArr.removeAll()
        let calendar = Calendar.current
        var date = Date.now.startOfDay
        let endDate = selectedDate?.startOfDay ?? date

        while date <= endDate {
            selectedDatesArr.append(formattedDateAndDay(date))
            if let nextDate = calendar.date(byAdding: .day, value: 1, to: date) {
                date = nextDate
            } else {
                break
            }
        }
    }

}
