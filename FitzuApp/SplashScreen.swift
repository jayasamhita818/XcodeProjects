//
//  SplashScreen.swift
//  FitzuApp
//
//  Created by rounak suri on 23/05/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive: Bool = true
    @State private var homeActives: Bool = false
    @State private var loginActive: Bool = false
    @StateObject private var loginManager = LoginManager()
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                Image("splash")
                    .resizable()
                    .scaledToFill()
                
                Image("splash_text")
                VStack {
                    Spacer()
                    Image("appIcon")
                        .resizable()
                        .frame(width: 136, height: 100)
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    if loginManager.loginActive == false {
                        loginActive = true
                    } else {
                        homeActives = true
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $loginActive) {
                AccountType()
            }
            .navigationDestination(isPresented: $homeActives) {
                if loginManager.selectedProfession == "Client"{
                    ClientHome()
                } else {
                    HomeScreen()
                }
            }
        }
    }
}
#Preview {
    SplashScreen()
}
