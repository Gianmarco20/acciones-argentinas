//
//  ActivoModel.swift
//  Acciones Argentinas App
//
//  Created by Gian Marco Caserta on 13/05/2022.
//

import Foundation

class ActivoModel: ObservableObject {
    
    @Published var activos = [Activo]()
    
    @Published var currentStock: Activo?
    var currentStockIndex = 0
    
    @Published var currentProduct: Producto?
    var currentProductIndex = 0
    
    init() {
        
        activos = DataService.getLocalData()
        
    }
    
    func beginStock(_ stockId: Int) {
        
        for index in 0..<activos.count {
            
            if activos[index].id == stockId {
                
                currentStockIndex = index
                
                break
            }
        }
        currentStock = activos[currentStockIndex]
    }
    
    func beginProduct(_ productIndex: Int) {
        
        if currentProductIndex < currentStock!.productos.count {
            
            currentProductIndex = productIndex
        }
        else {
            currentProductIndex = 0
        }
        currentProduct = currentStock!.productos[currentProductIndex]
    }
}
