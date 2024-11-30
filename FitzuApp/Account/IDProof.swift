//
//  IDProof.swift
//  FitzuApp
//
//  Created by rounak suri on 24/05/24.
//

import SwiftUI

struct IDProof: View {
    
    @State private var isActive: Bool = false
    @Binding var selectedView: Int
    @State var selectedIDProof: String = ""
    var body: some View {
        
        ZStack{
            Image("bg_image")
                .resizable()
                .ignoresSafeArea(.keyboard)
            VStack(alignment: .center, spacing: 20){
                Text("Trainer")
                    .font(.custom("Poppins-Bold", size: 17))
                    .padding(.top, 20)
                HStack{
                    
                    if selectedIDProof == ""{
                        Text("Select Id Proof")
                            .font(.custom("Poppins-Bold", size: 17))
                    } else {
                        Text(selectedIDProof)
                            .font(.custom("Poppins-Bold", size: 17))
                    }
                        
                        Spacer()
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isActive = true
                        }
                    }, label: {
                        Image("down_arrow_black")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .colorInvert()
                    })
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                    )
                
                if selectedIDProof != "" {
                    VStack{
                        HStack{
                            Text("Upload front side")
                            Spacer()
                        }
                        
                        VStack{
                            Spacer()
                            HStack{
                                Text("Profile.png")
                                    .foregroundColor(.black)
                                    .padding(.leading, 10)
                                Spacer()
                                Button(action: {}, label: {
                                    Text("Choose")
                                        .foregroundColor(.blue)
                                })
                                Button(action: {}, label: {
                                    Text("Remove")
                                        .foregroundColor(.red)
                                })
                                .padding(.trailing, 10)
                            }
                            .padding(.vertical,5)
                            .background(.white)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 5.0)
                                .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                        )
                        .frame(maxHeight: 200)
                    }
                    .cornerRadius(5.0)
                    
                    VStack{
                        HStack{
                            Text("Upload back side")
                            Spacer()
                        }
                        
                        VStack{
                            Spacer()
                            HStack{
                                Text("Profile.png")
                                    .foregroundColor(.black)
                                    .padding(.leading, 10)
                                Spacer()
                                Button(action: {}, label: {
                                    Text("Choose")
                                        .foregroundColor(.blue)
                                })
                                Button(action: {}, label: {
                                    Text("Remove")
                                        .foregroundColor(.red)
                                })
                                .padding(.trailing, 10)
                            }
                            .padding(.vertical,5)
                            .background(.white)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 5.0)
                                .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                        )
                        .frame(maxHeight: 200)
                    }
                    .cornerRadius(5.0)
                }
                Spacer()
                Button(action: {
                    selectedView = 8
                }, label: {
                    Text("Save")
                        .bold()
                })
                .padding(.vertical, 10)
                .padding(.horizontal, 50)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(UIColor(named: "button_blue")!))
                )
                .padding(.bottom, 30)
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
            
            if isActive {
               @State var idProofs = ["Passport", "Driving License", "Other"]
                CustomIDPicker(isActive: $isActive, idProofs: $idProofs , selectedString: $selectedIDProof, firstBtnTittle: "Cancel", secondBtnTittle: "Save", pickerTittle: "Profile Picture")
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut, value: isActive)
            }
        }
        .foregroundColor(.white)
    }
}

//#Preview {
//    CustomIDPicker()
//}

