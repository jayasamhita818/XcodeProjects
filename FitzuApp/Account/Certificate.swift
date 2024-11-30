//
//  Certificate.swift
//  FitzuApp
//
//  Created by rounak suri on 27/05/24.
//

import SwiftUI

struct Certificate: View {
    @Binding var selectedView: Int
     @Binding var professionName : String
    
  
    @State private var selectedOption = false
    
    @State private var skillPickerActive: Bool = false
    @State private var expPickerActive: Bool = false
    
    @State var skillSelectedString: String = ""
    @State var expSelectedString: String = ""
    
    var body: some View {
        ZStack{
            Image("bg_image")
                .resizable()
                .ignoresSafeArea(.keyboard)
            VStack(alignment: .center, spacing: 20){
                Text("professionName")
                    .font(.custom("Poppins-Bold", size: 17))
                    .padding(.top, 20)
                
                HStack{
                    
                    if skillSelectedString == ""{
                        Text("Add your Expertise")
                            .font(.custom("Poppins-Bold", size: 17))
                    } else {
                        Text(skillSelectedString)
                            .font(.custom("Poppins-Bold", size: 17))
                    }
                    
                        
                    Spacer()
                    Button(action: {
                       
                        withAnimation(.easeInOut) {
                            skillPickerActive = true
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
                
                HStack{
                    
                    if expSelectedString == ""{
                        Text("Add your Experience")
                            .font(.custom("Poppins-Bold", size: 17))
                    } else {
                        Text(expSelectedString)
                            .font(.custom("Poppins-Bold", size: 17))
                    }
                    
                        
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut) {
                            expPickerActive = true
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
                
                VStack{
                    HStack{
                        Text("Upload certificate(PDF,PNG etc)")
                            .font(.custom("Poppins-Regular", size: 15))
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
                    .frame(maxHeight: 180)
                    .cornerRadius(5.0)
                    HStack{
                        Button(action: {
                            self.selectedOption.toggle()
                            
                        }){
                            if selectedOption == true {
                                Image("blue_checked")
                                    .resizable()
                            } else {
                                Image("blue_unchecked")
                                    .resizable()
                            }
                        }
                        
                        .frame(width: 20, height: 20)
                        
                        
                        
                        Text("Add another skill")
                        Spacer()
                    }
    
                }
                .cornerRadius(5.0)
                Spacer()
                Button(action: {
                    selectedView = 9
                }, label: {
                    Text("Submit")
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
            
            if skillPickerActive {
               @State var idProofs = ["Aerobics", "Boxing", "Karate"]
                CustomIDPicker(isActive: $skillPickerActive, idProofs: $idProofs , selectedString: $skillSelectedString, firstBtnTittle: "Cancel", secondBtnTittle: "Save", pickerTittle: "Select Skill")
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut, value: skillPickerActive)
            }
            
            if expPickerActive {
               @State var idProofs = ["3 Years", "2 Years", "1 Year"]
                CustomIDPicker(isActive: $expPickerActive, idProofs: $idProofs , selectedString: $expSelectedString, firstBtnTittle: "", secondBtnTittle: "Save", pickerTittle: "Experience")
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut, value: expPickerActive)
            }
        }
        .foregroundColor(.white)
    }
}

//#Preview {
//    Certificate()
//}
