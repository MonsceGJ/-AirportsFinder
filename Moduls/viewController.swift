//
//  viewController.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 15/05/24.
//

import SwiftUI
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    var airportsMB: [Airport]?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView(frame: self.view.bounds)
        self.view.addSubview(mapView)
        let inicialRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.64031, longitude: -99.09754), span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06))
        mapView.setRegion(inicialRegion, animated: true)
        updateMapAnnotations()
    }

    func updateMapAnnotations() {
        guard let aiportsM = airportsMB else {
            return
                  }
        for item in aiportsM {
            guard let latitud = Double(item.latitudeDege),let longitud = Double(item.longitudeDeg) else { continue
            }
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
            annotation.title = item.name
            mapView.addAnnotation(annotation)
        }
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
}

struct MapViewControllerBridge: UIViewControllerRepresentable {

    var accesViewModel: AirportViewModel
    var mapView = MapViewController()
    
    func makeUIViewController(context: Context) -> MapViewController {
        mapView.airportsMB = accesViewModel.airports2
     
            return mapView
    }
        
        func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
            uiViewController.airportsMB = accesViewModel.airports2
            uiViewController.updateMapAnnotations()

        }
    }
typealias UIViewControllerType = MapViewController
