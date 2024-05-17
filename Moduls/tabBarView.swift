//
//  mapKitView.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 14/05/24.
//



import SwiftUI
import MapKit


struct tabBarView: View {
    var query = ""
    
    var body: some View{
        TabView{
            mapContentView(searchText: query)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("mapa")
                }
            listView(searchText: query)
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("Lista")
                }
        }
    }
}

struct mapContentView: View {
    @ObservedObject var viewModel = AirportViewModel()
    @State var searchText = ""
    
    var body: some View {
        MapViewControllerBridge(accesViewModel: viewModel )
        .onAppear()  {
                viewModel.fetchAirports(Country: searchText)
            }
    }
}
    struct tabBarList: View {
       var body: some View {
            tabBarView()
        }
    }
    
   

