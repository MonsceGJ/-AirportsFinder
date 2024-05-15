//
//  ApiClient.swift
//  AirportsFinder
//
//  Created by monscerrat gutierrez on 11/05/24.
//

import Foundation


import Foundation

class APIClient {
    func fetchData() {
        let headers = [
            "X-RapidAPI-Key": "c2bcfa61f1mshf2abcf111b8af04p11138ejsnd5ae171d439b",
            "X-RapidAPI-Host": "radarflight.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://radarflight.p.rapidapi.com/api/v1/airport/BE/availables")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print("Error: \(error)")
            } else if let httpResponse = response as? HTTPURLResponse {
                print("Response: \(httpResponse)")
                
                if let data = data {
                    // Aquí puedes manejar los datos recibidos, por ejemplo, decodificarlos si son JSON
                }
            }
        })
        
        dataTask.resume()
    }
}
