//
//  SessionsList.swift
//  FitzuApp
//
//  Created by rounak suri on 28/05/24.
//

import SwiftUI

struct SessionsList: View {
    @State private var viewDestination: String? = nil
    @Binding var selectedSegment : Int
    var body: some View {
        List{
            Button(action: {
                self.viewDestination = "SelectedSessionDetail"
                
            }){
                HStack(alignment: .center){
                    Image("2380")
                        .resizable()
                        .frame(width: 70,height: 70)
                        .cornerRadius(50)
                    
                    VStack(alignment: .leading){
                        Text("David")
                            .font(.custom("Poppins-Bold", size: 15))
                            .padding(.bottom,2)
                        Text("$80")
                        
                    }
                    .padding(.leading,5)
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        if selectedSegment != 3 {
                            Text("21 Aug, 12:30 AM")
                                .padding(.bottom,2)
                            Text("12:30 AM")
                        } else {
                            Text("Cancelled")
                                .font(.custom("Poppins-Bold", size: 15))
                                .foregroundColor(.red)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.vertical,5)
            }
            
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            .padding(.vertical,5)
            .background(Color.gray.opacity(0.2))
            Button(action: {
                self.viewDestination = "SelectedSessionDetail"
            }){
                HStack(alignment: .center){
                    Image("2380")
                        .resizable()
                        .frame(width: 70,height: 70)
                        .cornerRadius(50)
                    
                    VStack(alignment: .leading){
                        Text("David")
                            .font(.custom("Poppins-Bold", size: 15))
                            .padding(.bottom,2)
                        Text("$80")
                        
                    }
                    .padding(.leading,5)
                    Spacer()
                    VStack(alignment: .trailing){
                        if selectedSegment != 3 {
                            Text("21 Aug, 12:30 AM")
                                .padding(.bottom,2)
                            Text("12:30 AM")
                        } else {
                            Text("Cancelled")
                                .font(.custom("Poppins-Bold", size: 15))
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.trailing, 5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.vertical,5)
            }
           
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            .padding(.vertical,5)
            .background(Color.gray.opacity(0.2))
        }
        .foregroundColor(.black)
        .scrollContentBackground(.hidden)
        .background(.white)
        NavigationLink(destination: SelectedSessionDetail(selectedSegment: $selectedSegment), tag: "SelectedSessionDetail", selection: $viewDestination) { EmptyView() }
    }
}


//#Preview {
//    SessionsList()
//}
