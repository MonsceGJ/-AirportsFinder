//
//  view.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 11/05/24.
//

import SwiftUI

struct searchView: View {
 @State  var searchText = ""
 
var body: some View {
        NavigationView {
            VStack {
                Text("BUSCAR AEROPUERTOS")
                    .font(.title)
                    
                TextField("Ingrese el país", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                NavigationLink(destination: tabBarView(query: searchText)) {
                    Text("Buscar")
                }
              
                   
                }
                .padding()
                
               
                
            }
          
        }
    }

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        searchView(searchText: "")
    }
}
