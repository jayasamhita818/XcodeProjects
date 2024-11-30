//
//  ProfilePics.swift
//  FitzuApp
//
//  Created by rounak suri on 24/05/24.
//

import SwiftUI
import Combine

struct TextView: UIViewRepresentable {
 
    @Binding var text: String
    @Binding var textStyle: UIFont.TextStyle
    
    
 
    func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }
     
    class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
     
        init(_ text: Binding<String>) {
            self.text = text
        }
     
        func textViewDidChange(_ textView: UITextView) {
            self.text.wrappedValue = textView.text
        }
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = UIFont.preferredFont(forTextStyle: textStyle)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.backgroundColor = .clear
        textView.textColor = .white
 
        return textView
    }
 
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
}

import SwiftUI

struct ProfilePics: View {
    @Binding var selectedView: Int
    @State private var textStyle = UIFont.TextStyle.body
    @State private var aboutYourselfText: String = ""
    @State private var isActive: Bool = false
    @State var selectedImage: UIImage?
    var body: some View {
        ZStack {
            Image("bg_image")
                .resizable()
                .ignoresSafeArea(.keyboard)
            
            VStack(spacing: 20) {
                HStack {
                    Text("Add profile picture")
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isActive = true
                        }
                    }, label: {
                        Text("Choose")
                    })
                    .padding(.horizontal, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color(UIColor(named: "button_blue")!))
                    )
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                .padding(.top, 20)
                
                HStack {
                    Text("Add Gallery")
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isActive = true
                        }
                    }, label: {
                        Text("Choose")
                    })
                    .padding(.horizontal, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color(UIColor(named: "button_blue")!))
                    )
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                ZStack(alignment: .topLeading) {
                    if aboutYourselfText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        Text("About Yourself")
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                    TextView(text: $aboutYourselfText, textStyle: $textStyle)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .background(.clear)
                        .frame(height: 150)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))))
                
                Spacer()
                
                Button(action: {
                    selectedView = 7
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
                .padding(.bottom, 30)
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
            
            if isActive {
//                CustomPicsPicker(isActive: $isActive, title: "Profile Picture", selectedImage: $selectedImage)
//                    .transition(.move(edge: .bottom))
//                    .animation(.easeInOut, value: isActive)
            } 
        }
        // Apply animation to the entire ZStack
        .bold()
        .foregroundColor(.white)
    }
}

