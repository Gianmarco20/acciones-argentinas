//
//  PerfilEmpresaView.swift
//  Acciones Argentinas App
//
//  Created by Gian Marco Caserta on 13/05/2022.
//

import SwiftUI

struct PerfilEmpresaView: View {
    
    @EnvironmentObject var activo: ActivoModel
    
    var body: some View {
        
        ScrollView {
            // MARK: Datos de la compańía seleccionada
            VStack(alignment: .leading) {
                
                if activo.currentStock != nil {
                    
                    HStack {
                        Text("Nombre: ")
                            .font(.headline)
                        Text(activo.currentStock!.nombre)
                    }
                    .padding(.bottom)
                    HStack {
                        Text("Sector: ")
                            .font(.headline)
                        Text(activo.currentStock!.sector.capitalized)
                    }
                    .padding(.bottom)
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 80, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 2, x: -2, y: 2)
                        HStack(spacing: 20) {
                            
                            VStack {
                                Text("Market cap")
                                    .font(.headline)
                                    .padding(.bottom, 2)
                                Text("$ \(activo.currentStock!.marketCap)")
                                    .font(.subheadline)
                            }
                            VStack {
                                Text("Ingresos totales")
                                    .font(.headline)
                                    .padding(.bottom, 2)
                                Text("$ \(activo.currentStock!.ingresosTotales)")
                                    .font(.subheadline)
                            }
                            VStack {
                                Text("Ingreso neto")
                                    .font(.headline)
                                    .padding(.bottom, 2)
                                Text("$ \(activo.currentStock!.ingresoNeto)")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .padding(.bottom)
                    Text("Descripción: ")
                        .font(.headline)
                        .padding(.bottom, 1)
                    Text(activo.currentStock!.descripcion)
                        .padding(.bottom)
                    ForEach(activo.currentStock!.productos) { producto in
                        
                        LazyVStack(alignment: .leading) {
                            
                            NavigationLink(destination: PerfilProductoView()
                                .onAppear(perform: {
                                    activo.beginProduct(producto.id)
                                })
                                           , label: {
                                HStack {
                                    Image(producto.imagen)
                                        .resizable()
                                        .frame(width: 60, height: 60, alignment: .center)
                                        .padding(.trailing)
                                    Text(producto.nombre)
                                        .foregroundColor(.black)
                                        .font(.headline)
                                }
                            })
                        }
                    }
                }
            }
            .padding()
            .navigationTitle(activo.currentStock?.ticker ?? "")
        }
    }
}
