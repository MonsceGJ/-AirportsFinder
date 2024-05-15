//
//  viewModel.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 11/05/24.
//


import Foundation
import MapKit
import SwiftUI

class AirportViewModel: ObservableObject {
    let apiClient: APIClient
    
    @Published var airports: [Airport] = []
    @Published var annotations: [MKPointAnnotation] = []
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func searchAirports(forCountry countryCode: String) {
        apiClient.fetchData { result in
            switch result {
            case .success(let airports):
                let filteredAirports = airports.filter { $0.isoCountry == countryCode }
                DispatchQueue.main.async {
                    self.airports = filteredAirports
                    self.updateAnnotations()
                }
            case .failure(let error):
                print("Error al obtener aeropuertos: \(error)")
            }
        }
    }
    
     func updateAnnotations() {
        var newAnnotations: [MKPointAnnotation] = []
        for airport in airports {
            if let latitudeString = airport.latitudeDege,
               let longitudeString = airport.longitudeDeg,
               let latitude = Double(latitudeString),
               let longitude = Double(longitudeString) {
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                annotation.title = airport.isoRegion
                newAnnotations.append(annotation)
            } else {
                print("Error: No se pudieron convertir las coordenadas a Double para el aeropuerto \(airport.isoRegion)")
            }
        }
        DispatchQueue.main.async {
            self.annotations = newAnnotations
        }
    }
}

struct MapContentView: View {
    // Instancia de tu ViewModel
    @ObservedObject var airportsViewModel = AirportViewModel(apiClient: APIClient())
    
    var body: some View {
        mapView(annotations: airportsViewModel.annotations)
            .onAppear {
                airportsViewModel.searchAirports(forCountry: "BE")
            }
            .onReceive(airportsViewModel.$airports) { _ in
                airportsViewModel.updateAnnotations()
            }
    }
}

struct mapView: UIViewRepresentable {
    var annotations: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: mapView
        
        init(parent: mapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? MKPointAnnotation else {
                return nil
            }
            
            let identifier = "AirportPin"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
    }
}
