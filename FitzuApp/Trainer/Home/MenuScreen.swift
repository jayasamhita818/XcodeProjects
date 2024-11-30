//
//  Menu.swift
//  FitzuApp
//
//  Created by rounak suri on 27/05/24.
//

import SwiftUI

enum MenuItem: Int, CaseIterable {
    case financials, sessions, availability, skills, messages, faqs, settings, referFriend, help
    
    var title: String {
        switch self {
        case .financials: return "Financials"
        case .sessions: return "Sessions"
        case .availability: return "Availability"
        case .skills: return "Skill"
        case .messages: return "Messages"
        case .faqs: return "FAQ's"
        case .settings: return "Settings"
        case .referFriend: return "Refer a Friend"
        case .help: return "Help"
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .financials: FinancialMenu()
        case .sessions: Sessions()
        case .availability: ManageAvailability()
        case .skills: Skills()
        case .messages: MessagesList()
        case .faqs: EmptyView() // Replace with actual FAQ view
        case .settings: SettingsScreen()
        case .referFriend: ReferingFriend()
        case .help: EmptyView() // Replace with actual Help view
        }
    }
}

struct MenuScreen: View {
    @Binding var menuScreenActive: Bool
    @State private var dragOffset: CGFloat = 0
    @State private var viewDestination: String? = nil
    var body: some View {
       
            ZStack(alignment: .bottom) {
               
                Color.black.opacity(0.5)
                    .onTapGesture {
                       
                        menuScreenActive = false
                        
                    }
                    .gesture(DragGesture()
                        .onChanged { value in
                            if value.translation.height > 0 {
                                dragOffset = value.translation.height
                            }
                        }
                        .onEnded { value in
                            if dragOffset > 100 {
                                menuScreenActive = false
                            }
                            dragOffset = 0
                        }
                    )
                
                VStack(spacing: 0) {
                    Color.white
                        .frame(height: 30)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 40,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 40
                            )
                        )
               //     ScrollView {
                        VStack(spacing: 30){
                            
                            NavigationLink(destination: TrainerProfileScreen(), tag: "TrainerProfileScreen", selection: $viewDestination) {
                                Button(action: {
                                    self.viewDestination = "TrainerProfileScreen"
                                }){
                                    HStack(spacing: 20) {
                                        Image("2380")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(50)
                                        VStack(alignment: .leading) {
                                            Text("Sahil Bisht")
                                            Text(verbatim: "sahil123@gmail.com")
                                                .foregroundColor(.black)
                                        }
                                        Spacer()
                                    }
                                }
                            }
                            ForEach(MenuItem.allCases, id: \.self) { item in
                                NavigationLink(destination: item.destination) {
                                    HStack {
                                        Text(item.title)
                                        Spacer()
                                        Image("rightArrowBlack")
                                            .resizable()
                                            .frame(width: 15, height: 15)
                                    }
                                }
                            }
                            
                        }
                    //}
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.bottom, 20)
                    .background(.white)
                    .scrollDisabled(true)
                }
                .frame(width: UIScreen.main.bounds.width - 8)
               
                
            }
            .foregroundColor(.black)
            .background(Color.black.opacity(0.5), ignoresSafeAreaEdges: .all)
        
        
    }
}


//#Preview {
//    MenuScreen(menuScreenActive: $menuScreenActive)
//}
