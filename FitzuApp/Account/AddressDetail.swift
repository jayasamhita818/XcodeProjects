//
//  AddressDetail.swift
//  FitzuApp
//
//  Created by rounak suri on 24/05/24.
//

import SwiftUI

struct AddressDetail: View {
    @Binding var selectedView: Int
    
    @State private var streetName_text: String = ""
    @State private var suburb_text: String = ""
    @State private var postcode_text: String = ""
    @State private var state_text: String = ""
    @State private var country_text: String = ""
    
    var body: some View {
        ZStack{
            Image("bg_image")
                .resizable()
                .ignoresSafeArea(.keyboard)
            VStack(alignment: .leading, spacing: 20){
                
                VStack{
                    Text("please enter your home address")
                        .bold()
                    Text("which matches your identification")
                        .bold()
                }
                .padding(.top, 30)
                ZStack(alignment: .leading){
                    
                    if streetName_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("Street Name and Number")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .bold()
                    }
                    TextField("", text: $streetName_text)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .background(.clear)
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                
                ZStack(alignment: .leading){
                    
                    if suburb_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("Suburb")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .bold()
                    }
                    TextField("", text: $suburb_text)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .background(.clear)
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                ZStack(alignment: .leading){
                    
                    if postcode_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("Postcode")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .bold()
                    }
                    TextField("", text: $postcode_text)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .background(.clear)
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                ZStack(alignment: .leading){
                    
                    if state_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("State")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .bold()
                    }
                    TextField("", text: $state_text)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .background(.clear)
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                ZStack(alignment: .leading){
                    
                    if country_text.description.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                        Text("Country")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .bold()
                    }
                    TextField("", text: $country_text)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .background(.clear)
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button(action: {
                        selectedView = 6
                    }, label: {
                        Text("Next")
                            .bold()
                    })
                    .padding(.vertical, 10)
                    .padding(.horizontal, 50)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color(UIColor(named: "button_blue")!))
                    )
                    Spacer()
                }
                .padding(.bottom, 40)
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
        }
        .foregroundColor(.white)
    }
}

//#Preview {
//    AddressDetail()
//}
