//
//  HTMLParser.swift
//  ConstraintsTestApp
//
//  Created by Pedro Del Rio Ortiz on 21/01/2019.
//  Copyright © 2019 Pedro Del Rio Ortiz. All rights reserved.
//

import Foundation

class HTMLParser {
    
    func parseHTML(urlSring: String, completion: @escaping (String?) -> ()) {
        
        guard let url = URL(string: urlSring) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            if let err = err {
                completion(nil)
                print("Failed to fetch courses:", err)
                return
            }
            
            // Response
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(String.self, from: data)
                DispatchQueue.main.async {
                    completion(response)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }
        
    }
    
    
}
