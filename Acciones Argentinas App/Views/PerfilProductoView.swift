//
//  PerfilProductoView.swift
//  Acciones Argentinas App
//
//  Created by Gian Marco Caserta on 14/05/2022.
//

import SwiftUI

struct PerfilProductoView: View {
    
    @EnvironmentObject var activo: ActivoModel
    
    var body: some View {
        
        ScrollView {
            
            if activo.currentProduct != nil {
                // MARK: Datos del producto seleccionado
                VStack {
                    Image(activo.currentProduct!.imagen)
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 300, height: 300, alignment: .center)
                    Text(activo.currentProduct!.descripcion)
                }
                .padding()
            }
        }
        .navigationTitle(activo.currentProduct?.nombre ?? "")
    }
}
