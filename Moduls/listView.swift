//
//  listView.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 14/05/24.

import SwiftUI

struct listView: View {
    @ObservedObject var viewModel = AirportViewModel()
    var searchText = ""
    
    var body: some View {
        List(viewModel.airports2 ?? [], id: \.id) { airport in
            Text(airport.name)
        }
        .listStyle(InsetGroupedListStyle())
        .onAppear {
            viewModel.fetchAirports(Country: searchText)
        }
    }
}


#Preview {
    listView()
       
    }
