//
//  ContentModel.swift
//  NASK
//
//  Created by Tomasz Kubicki on 28/08/2023.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var rateList = [Table]()
    
    init() {
        self.searchData()
    }
    
    func searchData() {
        
        let url = URL(string: "https://api.nbp.pl/api/exchangerates/tables/a/")

        if let url = url {
            
            // Create url request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Accept:")
            
            // Get url session
            let session = URLSession.shared
            
            // Create data task
            let dataTask = session.dataTask(with: request) { [self] (data, response, error) in
                
                if error == nil{
                    do {
                        // Parse JSON
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([Table].self, from: data!)
                        
                        DispatchQueue.main.async {
                            self.rateList = result
                        }
                        
                        print("result: \(result)")
                        
                    }
                    catch {
                        print("error: \(error)")
                    }
                    
                } else {
                    print("Cannot get data")
                }
            }
            dataTask.resume()
        }
    }
}
