//
//  Activo.swift
//  Acciones Argentinas App
//
//  Created by Gian Marco Caserta on 13/05/2022.
//

import Foundation

class Activo: Identifiable, Decodable {
    
    var id: Int
    var nombre: String
    var ticker: String
    var panelLider: Bool
    var sector: String
    var imagen: String
    var descripcion: String
    var productos: [Producto]
    var marketCap: String
    var ingresosTotales: String
    var ingresoBruto: String
    var ingresoNeto: String
    var ebitda: String
    var bpa: String
    
}

class Producto: Identifiable, Decodable {
    
    var id: Int
    var nombre: String
    var imagen: String
    var descripcion: String
    
}
