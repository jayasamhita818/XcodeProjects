//
//  LoginStatusSave.swift
//  FitzuApp
//
//  Created by rounak suri on 10/06/24.
//
import SwiftUI
import Foundation

class LoginManager: ObservableObject {
    @AppStorage("selectedProfession") var selectedProfession: String = "Trainer"
    @AppStorage("loginActive") var loginActive: Bool = false
    
    func setProfession(_ profession: String) {
        selectedProfession = profession
    }

    func getProfession() -> String {
        return selectedProfession
    }
    
    func setLogin(_ login: Bool) {
        loginActive = login
    }
}


