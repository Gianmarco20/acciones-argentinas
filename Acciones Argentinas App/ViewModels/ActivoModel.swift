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
    // MARK: Función dedicada a la obtención y asignación de datos del archivo json
    init() {
        
        activos = DataService.getLocalData()
        
    }
    
    // MARK: Función dedicada a reconocer la acción seleccionada
    func beginStock(_ stockId: Int) {
        
        for index in 0..<activos.count {
            
            if activos[index].id == stockId {
                
                currentStockIndex = index
                
                break
            }
        }
        currentStock = activos[currentStockIndex]
    }
    
    // MARK: Función dedicada a reconocer el producto seleccionado
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
