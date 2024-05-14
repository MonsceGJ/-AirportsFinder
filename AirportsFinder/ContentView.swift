//
//  ContentView.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 11/05/24.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        let searchRepository = searchRepository()
     let viewModel = FirstScreenViewModel(searchRepository: searchRepository)
        return FirstScreen(viewModel: viewModel)
  }
}
