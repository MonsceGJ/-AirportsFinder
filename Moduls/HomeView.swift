//
//  view.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 11/05/24.
//

import SwiftUI

struct AirportListView: View {
    @ObservedObject var viewModel: AirportViewModel
    @State private var countrySearchText = ""
    @State private var isMapScreenPresented = false // Nuevo estado para controlar la presentación de la pantalla del mapa
  
    var body: some View {
        NavigationView {
            VStack {
                TextField("Ingrese el país", text: $countrySearchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
             
                Button(action: {
                    viewModel.searchAirports(forCountry: countrySearchText)

                    isMapScreenPresented = true
                }) {
                    Text("Buscar")
                }
                .padding()
                
                NavigationLink(destination: tabBarView(), isActive: $isMapScreenPresented) {
                    EmptyView()
                }
                
            }
            .padding()
            .navigationTitle("Buscar Aeropuertos")
        }
    }
}

