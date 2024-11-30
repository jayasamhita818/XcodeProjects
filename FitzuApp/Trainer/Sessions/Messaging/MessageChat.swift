//
//  MessageChat.swift
//  FitzuApp
//
//  Created by rounak suri on 29/05/24.
//
import Combine
import SwiftUI

struct MessageChat: View {
    @State var customAlertActive: Bool = false
    @StateObject private var loginManager = LoginManager()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var messages = DataSource.messages
    @State var newMessage: String = ""
    func sendMessage() {
        
        if !newMessage.isEmpty{
            messages.append(Message(content: newMessage, isCurrentUser: true))
            // messages.append(Message(content: "Reply of " + newMessage , isCurrentUser: false))
            newMessage = ""
        }
    }
    @State private var viewDestination: String? = nil
    @State private var menuScreenActive: Bool = false
    
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
                        Text("David")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        Button(action: {
                            customAlertActive = true
                        }){
                            Text("Block")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                                .padding(.trailing)
                                .bold()
                            
                        }
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    
                    VStack{
                        
                        
                        ScrollViewReader { proxy in
                            ScrollView {
                                LazyVStack {
                                    ForEach(messages, id: \.self) { message in
                                        MessageView(currentMessage: message)
                                            .id(message)
                                    }
                                }
                                .onReceive(Just(messages)) { _ in
                                    withAnimation {
                                        proxy.scrollTo(messages.last, anchor: .bottom)
                                    }
                                    
                                }.onAppear {
                                    withAnimation {
                                        proxy.scrollTo(messages.last, anchor: .bottom)
                                    }
                                }
                            }
                            
                            Rectangle()
                                .fill(.white)
                                .frame(height: 60)
                                .overlay{
                                    HStack{
                                        TextField("Message", text: $newMessage)
                                            .font(.system(size: 12))
                                            .background(.clear)
                                        
                                        Button(action: {
                                            sendMessage()
                                        }){
                                            Text("Send")
                                                .font(.custom("Poppins-Bold", size: 17))
                                                .foregroundColor(.buttonBlue)
                                            
                                        }
                                        
                                    }
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                    
                                    .background(
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .fill(.gray.opacity(0.4))
                                    )
                                }
                                .padding(.leading,10)
                                .padding(.trailing,10)
                        }
                        
                    }
                    
                    
                }
                .background(.white)
                if loginManager.selectedProfession == "Client"{
                    Text("Find a Trainer to suit you")
                        .font(.custom("Poppins-Bold", size: 20))
                        .foregroundStyle(.white)
                        .padding(.vertical)
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
            
            if customAlertActive {
                CustomDoubleBtnAlertView(title: "Block David?",
                                         description: "This contact will not be able to meassage you.",
                                         buttonTitle1: "BLOCK",
                                         buttonAction1: {
                    customAlertActive = false
                    self.presentationMode.wrappedValue.dismiss()
                },
                                         buttonTitle2: "CANCEL",
                                         buttonAction2: {customAlertActive = false},
                                         customAlertActive: $customAlertActive)
            }
            
        }
        .animation(.easeInOut, value: menuScreenActive)
        .navigationBarHidden(true)
        .background(.black, ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    MessageChat()
}
