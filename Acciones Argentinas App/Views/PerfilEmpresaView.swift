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
                    // MARK: Nombre compañía
                    HStack {
                        Text("Nombre: ")
                            .font(.headline)
                        Text(activo.currentStock!.nombre)
                    }
                    .padding([.bottom, .horizontal])
                    // MARK: Sector de la compañía
                    HStack {
                        Text("Sector: ")
                            .font(.headline)
                        Text(activo.currentStock!.sector.capitalized)
                    }
                    .padding([.bottom, .horizontal])
                    // MARK: Scroll imágenes de la compañía
                    TabView {
                        ForEach(0..<activo.currentStock!.imagenes.count, id:\.self) { index in
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                Image(activo.currentStock!.imagenes[index])
                                    .resizable()
                                    .clipped()
                                    .scaledToFit()
                            }
                            .cornerRadius(20)
                            .padding(.horizontal)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .frame(height: 300, alignment: .center)
                    .shadow(color: .gray, radius: 2, x: -2, y: 2)
                    .padding(.bottom)
                    // MARK: Cuadro indicadores financieros
                    Text("Principales indicadores financieros: ")
                        .font(.headline)
                        .padding(.bottom, 1)
                        .padding(.horizontal)
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 140, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 2, x: -2, y: 2)
                        VStack {
                            HStack(spacing: 20) {
                                Spacer()
                                VStack {
                                    Text("Market Cap.:")
                                        .font(.subheadline)
                                        .bold()
                                        .padding(.bottom, 2)
                                    Text("$ \(activo.currentStock!.marketCap)")
                                        .font(.caption)
                                }
                                Spacer()
                                VStack {
                                    Text("Rdo. Bruto:")
                                        .font(.subheadline)
                                        .bold()
                                        .padding(.bottom, 2)
                                    Text("$ \(activo.currentStock!.resultadoBruto)")
                                        .font(.caption)
                                }
                                Spacer()
                                VStack {
                                    Text("Rdo. Op.:")
                                        .font(.subheadline)
                                        .bold()
                                        .padding(.bottom, 2)
                                    Text("$ \(activo.currentStock!.resultadoOperativo)")
                                        .font(.caption)
                                }
                                Spacer()
                            }
                            .padding(.bottom)
                            HStack(spacing: 20) {
                                Spacer()
                                VStack {
                                    Text("Rdo. Neto:")
                                        .font(.subheadline)
                                        .bold()
                                        .padding(.bottom, 2)
                                    Text("$ \(activo.currentStock!.resultadoNeto)")
                                        .font(.caption)
                                }
                                Spacer()
                                VStack {
                                    Text("BPA:")
                                        .font(.subheadline)
                                        .bold()
                                        .padding(.bottom, 2)
                                    Text("$ \(activo.currentStock!.bpa)")
                                        .font(.caption)
                                }
                                Spacer()
                                VStack {
                                    Text("EBITDA:")
                                        .font(.subheadline)
                                        .bold()
                                        .padding(.bottom, 2)
                                    Text("$ \(activo.currentStock!.ebitda)")
                                        .font(.caption)
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding([.bottom, .horizontal])
                    // MARK: Descripción de la compañía
                    Text("Descripción: ")
                        .font(.headline)
                        .padding(.bottom, 1)
                        .padding(.horizontal)
                    Text(activo.currentStock!.descripcion)
                        .padding([.bottom, .horizontal])
                    // MARK: Productos que creá la compañía
                    if (activo.currentStock!.productos!.count > 0) {
                        Text("Productos comercializados: ")
                            .font(.headline)
                            .padding(.bottom, 1)
                            .padding(.horizontal)
                        ForEach(activo.currentStock!.productos!) { producto in
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
                                        VStack(alignment: .leading) {
                                            Text(producto.nombre)
                                                .lineLimit(1)
                                                .foregroundColor(.black)
                                                .font(.subheadline)
                                        }
                                    }
                                })
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle(activo.currentStock?.ticker ?? "")            
        }
    }
}
