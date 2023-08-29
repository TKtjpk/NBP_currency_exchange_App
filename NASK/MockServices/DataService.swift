//
//  DataService.swift
//  NASK
//
//  Created by Tomasz Kubicki on 29/08/2023.
//

import Foundation

class DataService {
    
    func mockedData() -> [Table] {
        
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        guard pathString != nil else {
            return [Table]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                // Get data
                let tableData = try decoder.decode([Table].self, from: data)
                
                print(tableData)
                return tableData
                
            }
            catch {
                // porint error
                print(error)
            }
        }
        
        catch {
            // error with getting data
            print(error)
        }
        
        //  Return the recipes
        return [Table]()
    }
}
