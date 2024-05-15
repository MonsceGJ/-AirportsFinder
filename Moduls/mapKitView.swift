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
            mapContentView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("mapa")
                }
            listView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("Lista")
                }
        }
    }
}

struct mapContentView: View {
    var body: some View {
        MapView()
           // .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        tabBarView()
    }
}

#Preview {
    mapContentView()
}
