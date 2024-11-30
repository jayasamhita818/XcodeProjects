//
//  AddSkills.swift
//  FitzuApp
//
//  Created by rounak suri on 10/06/24.
//

//import SwiftUI
//
//struct AddSkills: View {
//    @State var menuScreenActive: Bool = false
//    @State private var selectedOption: Bool = false
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    
//    @State private var skillPickerActive: Bool = false
//    @State private var expPickerActive: Bool = false
//    
//    @State var skillSelectedString: String = ""
//    @State var expSelectedString: String = ""
//    
//    @State var customAlertActive: Bool = false
//    @State var customPicsPickerisActive: Bool = false
//    
//    @State private var selectedImage: UIImage?
//    
//    var body: some View {
//        
//            ZStack{
//                Color.black
//                
//                VStack(alignment: .center){
//                    
//                    HStack(alignment: .center){
//                        Button(action: {
//                            menuScreenActive = true
//                        }){
//                            Image("menu-bar")
//                                .resizable()
//                                .frame(width: 35,height: 20)
//                        }
//                        .padding(.leading)
//                        
//                        Spacer()
//                        Image("fitzu_font")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height: 35)
//                            .padding(.bottom)
//                            .padding(.top)
//                        Spacer()
//                        Button(action: {}, label: {
//                            Image("bell-icon")
//                                .resizable()
//                                .frame(width: 30,height: 30)
//                        })
//                        .padding(.trailing)
//                    }
//                    
//                    VStack{
//                        HStack(alignment: .center){
//                            Button(action: {
//                                self.presentationMode.wrappedValue.dismiss()
//                            }){
//                                Image("back")
//                                    .resizable()
//                                    .frame(width: 20,height: 20)
//                                
//                            }
//                            .padding(.leading)
//                            Spacer()
//                            Text("Select Expertise")
//                                .font(.custom("Poppins-Bold", size: 20))
//                            Spacer()
//                            Button(action: {}){
//                                Image("back")
//                                    .resizable()
//                                    .frame(width: 20,height: 20)
//                                
//                            }.hidden()
//                        }
//                        .padding(.vertical)
//                        .background(.navigationBar)
//                        .padding(.bottom)
//                        
//                          ScrollView {
//                        VStack(alignment: .leading){
//                            
//                            Text("Skills")
//                            Button(action: {
//                                withAnimation(.easeInOut) {
//                                    skillPickerActive = true
//                                }
//                            }){
//                                HStack{
//                                    if skillSelectedString == ""{
//                                        Text("Add your qualifications")
//                                            .font(.custom("Poppins-Medium", size: 15))
//                                    } else {
//                                        Text(skillSelectedString)
//                                            .font(.custom("Poppins-Medium", size: 15))
//                                    }
//                                    
//                                    Spacer()
//                                    Image("down_arrow")
//                                        .resizable()
//                                        .frame(width: 15,height: 15)
//                                }
//                                .foregroundColor(.gray.opacity(0.4))
//                            }
//                            .padding(.horizontal,10)
//                            .padding(.vertical,10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 5)
//                                    .stroke(.gray.opacity(0.4), lineWidth: 1)
//                            )
//                            
//                            Text("Experience")
//                            Button(action: {
//                                withAnimation(.easeInOut) {
//                                    expPickerActive = true
//                                }
//                            }){
//                                HStack{
//                                    if expSelectedString == ""{
//                                        Text("Add your years of experience")
//                                            .font(.custom("Poppins-Medium", size: 15))
//                                    } else {
//                                        Text(expSelectedString)
//                                            .font(.custom("Poppins-Medium", size: 15))
//                                    }
//                                    
//                                    Spacer()
//                                    Image("down_arrow")
//                                        .resizable()
//                                        .frame(width: 15,height: 15)
//                                }
//                                .foregroundColor(.gray.opacity(0.4))
//                            }
//                            .padding(.horizontal,10)
//                            .padding(.vertical,10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 5)
//                                    .stroke(.gray.opacity(0.4), lineWidth: 1)
//                            )
//                            
//                            Text("Upload Cerificate(PDF,PNG etc)")
//                            Button(action: {
//                                customPicsPickerisActive = true
//                            }){
//                                ZStack{
//                                    Color.gray.opacity(0.4)
//                                        .frame(height: 200)
//                                    
//                                        
//                                    if selectedImage == nil {
//                                        Image("add_Image")
//                                            .resizable()
//                                            .frame(width: 100, height: 100)
//                                    } else {
//                                        Image(uiImage: selectedImage!)
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(height: 200)
//                                    }
//                                    
//                                    
//                                }
//                            }
//                            .cornerRadius(20)
//                            HStack{
//                                Button(action: {
//                                    self.selectedOption.toggle()
//                                   
//                                }){
//                                    if selectedOption == true {
//                                        if skillSelectedString != "" || expSelectedString != "" || selectedImage != nil {
//                                            Image("blue_checked")
//                                                .resizable()
//                                        } else {
//                                            Image("blue_unchecked")
//                                                .resizable()
//                                        }
//                                    } else {
//                                        Image("blue_unchecked")
//                                            .resizable()
//                                    }
//                                    
//                                    
//                                }
//                                
//                                .frame(width: 20, height: 20)
//                                
//                                
//                                
//                                Text("Add another skill")
//                                Spacer()
//                            }
//                        }
//                        
//                        .padding(.leading, 30)
//                        .padding(.trailing, 30)
//                        .padding(.bottom, 20)
//                              
//                        Spacer(minLength: 100)
//                        
//                        Button(action: {
//                            customAlertActive = true
//                        }, label: {
//                            Text("Submit")
//                                .bold()
//                        })
//                        .foregroundStyle(.white)
//                        .padding(.vertical, 10)
//                        .padding(.horizontal, 30)
//                        .background(
//                            RoundedRectangle(cornerRadius: 25.0)
//                                .fill(Color(UIColor(named: "button_blue")!))
//                        )
//                        .padding(.bottom, 30)
//                    }
//                        }
//                        .background(.white)
//                        
//                    
//                }
//                if menuScreenActive {
//                    
//                    
//                    MenuScreen(menuScreenActive: $menuScreenActive)
//                        .transition(.move(edge: .bottom))
//                    
//                }
//                if skillPickerActive {
//                   @State var idProofs = ["Aerobics", "Boxing", "Karate"]
//                    CustomIDPicker(isActive: $skillPickerActive, idProofs: $idProofs , selectedString: $skillSelectedString, firstBtnTittle: "Cancel", secondBtnTittle: "Save", pickerTittle: "Select Skill")
//                        .transition(.move(edge: .bottom))
//                        .animation(.easeInOut, value: skillPickerActive)
//                }
//                
//                if expPickerActive {
//                   @State var idProofs = ["3 Years", "2 Years", "1 Year"]
//                    CustomIDPicker(isActive: $expPickerActive, idProofs: $idProofs , selectedString: $expSelectedString, firstBtnTittle: "", secondBtnTittle: "Save", pickerTittle: "Experience")
//                        .transition(.move(edge: .bottom))
//                        .animation(.easeInOut, value: expPickerActive)
//                }
//                if customAlertActive == true {
//                    CustomSingleBtnAlertView(title: "Thank You", description: "Thank you for submitting your documnets. We'll verify your documents and revert back to you in 24 hours", buttonTitle: "Okay", customAlertActive: $customAlertActive,titleColor: Color.yellowButton, descriptionColor: Color.black ,buttonAction: {
//                       self.presentationMode.wrappedValue.dismiss()
//                   })
//                        
//                }
//                if selectedOption == true {
//                    if skillSelectedString == "" || expSelectedString == "" || selectedImage == nil {
//                        CustomSingleBtnAlertView(title: "Alert", description: "Please fill all three specifications", buttonTitle: "OK", customAlertActive: $selectedOption, buttonAction: {selectedOption = false})
//                        
//                    }
//                }
//                if customPicsPickerisActive == true{
//                    CustomPicsPicker(isActive: $customPicsPickerisActive, title: "Certificate", selectedImage: $selectedImage)
//                        .transition(.move(edge: .bottom))
//                        .animation(.easeInOut, value: customPicsPickerisActive)
//                }
//                
//            }
//             .animation(.easeInOut, value: menuScreenActive)
//            .navigationBarHidden(true)
//            .background(.blackWhite, ignoresSafeAreaEdges: .bottom)
//        }
//    }
//
//
//#Preview {
//    AddSkills()
//}


import SwiftUI

struct SkillSection {
    var skillPickerActive: Bool = false
    var expPickerActive: Bool = false
    var skillSelectedString: String = ""
    var expSelectedString: String = ""
    var customPicsPickerisActive: Bool = false
    var selectedImage: UIImage? = nil
}

struct AddSkills: View {
    @State var menuScreenActive: Bool = false
    @State private var selectedOption: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var viewDestination: String? = nil
    @State private var skillSections: [SkillSection] = [SkillSection()]
    
    @State var customAlertActive: Bool = false
    
    var body: some View {
        
        ZStack {
            Color.black
            
            VStack(alignment: .center) {
                
                HStack(alignment: .center) {
                    Button(action: {
                        menuScreenActive = true
                    }) {
                        Image("menu-bar")
                            .resizable()
                            .frame(width: 35, height: 20)
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
                
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("back")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                        }
                        .padding(.leading)
                        Spacer()
                        Text("Select Expertise")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        Button(action: {}) {
                            Image("back")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                        }.hidden()
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            ForEach(0..<skillSections.count, id: \.self) { index in
                                skillSectionView(section: $skillSections[index])
                            }
                            
                            HStack {
                                Button(action: {
                                    if skillSections.contains(where: { $0.skillSelectedString == "" || $0.expSelectedString == "" || $0.selectedImage == nil }) {
                                        selectedOption = true
                                    } else {
                                        addSkillSection()
                                    }
                                }) {
                                    Image("add-profile")
                                    Text("Add another skill")
                                        .foregroundStyle(.black)
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 30)
                            .padding(.bottom, 20)
                            
                            Spacer(minLength: 100)
                            
                            HStack{
                                Spacer()
                                Button(action: {
                                    customAlertActive = true
                                }, label: {
                                    Text("Submit")
                                        .bold()
                                })
                                .foregroundStyle(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .fill(Color(UIColor(named: "button_blue")!))
                                )
                                
                                Spacer()
                            }
                            
                            .padding(.bottom, 30)
                        }
                        .padding(.top)
                    }
                    .background(.white)
                    .onAppear(perform: {
                        UIScrollView.appearance().bounces = false
                    })
                }
                
                
            }
            
            if menuScreenActive {
                MenuScreen(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
            }
            
            ForEach(0..<skillSections.count, id: \.self) { index in
                if skillSections[index].skillPickerActive {
                    CustomIDPicker(isActive: $skillSections[index].skillPickerActive,
                                   idProofs: .constant(["Aerobics", "Boxing", "Karate"]),
                                   selectedString: $skillSections[index].skillSelectedString,
                                   firstBtnTittle: "Cancel",
                                   secondBtnTittle: "Save",
                                   pickerTittle: "Select Skill")
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut, value: skillSections[index].skillPickerActive)
                }
                
                if skillSections[index].expPickerActive {
                    CustomIDPicker(isActive: $skillSections[index].expPickerActive,
                                   idProofs: .constant(["3 Years", "2 Years", "1 Year"]),
                                   selectedString: $skillSections[index].expSelectedString,
                                   firstBtnTittle: "",
                                   secondBtnTittle: "Save",
                                   pickerTittle: "Experience")
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut, value: skillSections[index].expPickerActive)
                }
                
                if skillSections[index].customPicsPickerisActive {
                    CustomPicsPicker(isActive: $skillSections[index].customPicsPickerisActive,
                                     title: "Certificate",
                                     selectedImage: $skillSections[index].selectedImage)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut, value: skillSections[index].customPicsPickerisActive)
                }
            }
            
            if customAlertActive {
                CustomSingleBtnAlertView(title: "Thank You",
                                         description: "Thank you for submitting your documents. We'll verify your documents and revert back to you in 24 hours",
                                         buttonTitle: "Okay",
                                         customAlertActive: $customAlertActive,
                                         titleColor: Color.yellowButton,
                                         descriptionColor: Color.black,
                                         buttonAction: {
                    self.presentationMode.wrappedValue.dismiss()
                })
            }
            
            if selectedOption {
                
                    CustomSingleBtnAlertView(title: "Alert",
                                             description: "Please fill all three specifications",
                                             buttonTitle: "OK",
                                             customAlertActive: $selectedOption,
                                             buttonAction: { selectedOption = false })
                
            }
            
            
        }
        .animation(.easeInOut, value: menuScreenActive)
        .navigationBarHidden(true)
        .background(.black, ignoresSafeAreaEdges: .all)
       
    }
    
    func addSkillSection() {
        skillSections.append(SkillSection())
    }
    
    func skillSectionView(section: Binding<SkillSection>) -> some View {
        VStack(alignment: .leading) {
            Text("Skills")
            Button(action: {
                withAnimation(.easeInOut) {
                    section.skillPickerActive.wrappedValue = true
                }
            }) {
                HStack {
                    if section.skillSelectedString.wrappedValue == "" {
                        Text("Add your qualifications")
                            .font(.custom("Poppins-Medium", size: 15))
                    } else {
                        Text(section.skillSelectedString.wrappedValue)
                            .font(.custom("Poppins-Medium", size: 15))
                    }
                    Spacer()
                    Image("down_arrow")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                .foregroundColor(.gray.opacity(0.4))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.4), lineWidth: 1)
            )
            
            Text("Experience")
            Button(action: {
                withAnimation(.easeInOut) {
                    section.expPickerActive.wrappedValue = true
                }
            }) {
                HStack {
                    if section.expSelectedString.wrappedValue == "" {
                        Text("Add your years of experience")
                            .font(.custom("Poppins-Medium", size: 15))
                    } else {
                        Text(section.expSelectedString.wrappedValue)
                            .font(.custom("Poppins-Medium", size: 15))
                    }
                    Spacer()
                    Image("down_arrow")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                .foregroundColor(.gray.opacity(0.4))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.4), lineWidth: 1)
            )
            
            Text("Upload Certificate (PDF, PNG, etc.)")
            Button(action: {
                section.customPicsPickerisActive.wrappedValue = true
            }) {
                ZStack {
                    Color.gray.opacity(0.4)
                        .frame(height: 200)
                    if section.selectedImage.wrappedValue == nil {
                        Image("add_Image")
                            .resizable()
                            .frame(width: 100, height: 100)
                    } else {
                        Image(uiImage: section.selectedImage.wrappedValue!)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                }
            }
            .cornerRadius(20)
        }
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .padding(.bottom, 20)
    }
}
#Preview {
    AddSkills()
}
