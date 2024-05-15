//
//  mapKitView.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 14/05/24.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
      
    }
}

struct tabBarView: View {
    var body: some View{
        TabView{
            MapContentView()
                .tabItem {
                    Image(systemName: "map.circle")
                    Text("mapa")
                }
            listView()
                .tabItem {
                    Image(systemName: "list.bullet.circle")
                    Text("Lista")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        tabBarView()
    }
}

struct MapContentView: View {
    // Instancia de tu ViewModel
    @ObservedObject var airportsViewModel = AirportViewModel(apiClient: APIClient())
    
    var body: some View {
        
        // Llama a la función fetchData al aparecer la vista
        MapView()
            .onAppear {
                airportsViewModel.searchAirports(forCountry: "BE")
            }
    }
}


#Preview {
    MapContentView()
}
