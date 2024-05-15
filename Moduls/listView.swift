//
//  listView.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 14/05/24.


import SwiftUI

struct listView: View {
    // Variable de estado para almacenar los datos de los aeropuertos
    @State private var airports: Airports = []
    
    // Instancia del cliente API para obtener los datos
    let apiClient = APIClient()
    
    var body: some View {
        // Lista para mostrar los aeropuertos
        List(airports, id: \.id) { airport in
            VStack(alignment: .leading) {
                Text("Name: \(airport.name)")
                Text("IATA Code: \(airport.iataCode)")
                Text("Country: \(airport.isoCountry)")
                Text("Continent: \(airport.continent)")
            }
        }
        // Llama al método fetchData() del cliente API cuando la vista se carga
        .onAppear {
            apiClient.fetchData { result in
                switch result {
                case .success(let fetchedAirports):
                    airports = fetchedAirports
                case .failure(let error):
                    //Maneji de error aqui
                    print("Error fetching airports")
                }
            }
        }
    }
}

struct AirportListView_Previews: PreviewProvider {
    static var previews: some View {
       listView()
    }
}
