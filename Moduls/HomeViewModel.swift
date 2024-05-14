//
//  viewModel.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 11/05/24.
//

import Foundation
import SwiftUI


protocol SearchRepositoryProtocol {
    func search(whiRadius radius: Double) -> [String]
}

class searchRepository: SearchRepositoryProtocol{
    func search(whiRadius radius: Double) -> [String] {
        return[""]
    }
}

class FirstScreenViewModel: ObservableObject {
    @Published var searchRadius: Double
    private let searchRepository: SearchRepositoryProtocol
    
    init(searchRepository: SearchRepositoryProtocol) {
        self.searchRadius = 10 // Valor por defecto
        self.searchRepository = searchRepository
    }
}

struct FirstScreen: View {
    @ObservedObject var viewModel: FirstScreenViewModel
    init(viewModel: FirstScreenViewModel) {
           self.viewModel = viewModel
       }
    
    var body: some View {
        VStack{
            Slider(value: $viewModel.searchRadius, in: 1...100, step: 1)
                .padding()
            
            Button(action: {
                
              //  let results = $viewModel.performSearch
                // navigation tabBarController
            }) {
                Text("Buscar")
            }
            .padding()
        }
    }
}


