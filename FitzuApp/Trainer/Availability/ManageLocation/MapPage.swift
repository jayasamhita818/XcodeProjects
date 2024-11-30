//
//  MapPage.swift
//  FitzuApp
//
//  Created by rounak suri on 30/05/24.
//
import MapKit
import SwiftUI

struct MapPage: View {
    
    @StateObject private var locationManager = LocationManager()
       @State private var searchText = ""
       @State private var annotations: [MKPointAnnotation] = []
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
                VStack(spacing: 0){
                    HStack(alignment: .center){
                        Button(action: {}){
                            Image("back")
                                .resizable()
                                .frame(width: 20,height: 20)
                            
                        }
                        .padding(.leading)
                        Spacer()
                        Text("Location Base")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        Button(action: {}){
                            Image("back")
                                .resizable()
                                .frame(width: 20,height: 20)
                            
                        }.hidden()
                    }
                    .padding(.vertical)
                    .background(.navigationBar)
                    
                    SearchBar(text: $searchText)
                                    .padding()

                    MapView(region: $locationManager.region, annotations: annotations)
                                   .edgesIgnoringSafeArea(.all)
                                   .onChange(of: searchText) { newValue in
                                       searchLocation()
                                   }
                }
            }
            if menuScreenActive {
                
                
                MenuScreen(menuScreenActive: $menuScreenActive)
                    .transition(.move(edge: .bottom))
                
            }
            
        }
         .animation(.easeInOut, value: menuScreenActive)
            .navigationBarHidden(true)
    }
    private func searchLocation() {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = searchText

            let search = MKLocalSearch(request: request)
            search.start { response, error in
                guard let response = response else {
                    print("Error: \(String(describing: error))")
                    return
                }

                let matchingItems = response.mapItems
                annotations = matchingItems.map { item in
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    return annotation
                }

                if let firstItem = matchingItems.first {
                    locationManager.region = MKCoordinateRegion(
                        center: firstItem.placemark.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    )
                }
            }
        }
}

#Preview {
    MapPage()
}
