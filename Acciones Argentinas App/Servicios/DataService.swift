//
//  DataService.swift
//  Acciones Argentinas App
//
//  Created by Gian Marco Caserta on 13/05/2022.
//

import Foundation

struct DataService {
    
    static func getLocalData() -> [Activo] {
        
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        
        guard url != nil else {
            return [Activo]()
        }
        
        do {
            let data = try Data(contentsOf: url!)
            
            let decoder = JSONDecoder()
            
            do {
                let activosData = try decoder.decode([Activo].self, from: data)
                
                return activosData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        return [Activo]()
    }
}
