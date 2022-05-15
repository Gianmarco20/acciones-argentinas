//
//  PanelGeneralListView.swift
//  Acciones Argentinas App
//
//  Created by Gian Marco Caserta on 15/05/2022.
//

import SwiftUI

struct PanelGeneralListView: View {
    
    @EnvironmentObject var model: ActivoModel
    
    var body: some View {
        
        NavigationView {
            
            List {
                // MARK: Sección de acciones del panel general
                ForEach(model.activos) { activo in
                    
                    if activo.panelLider == false {
                        
                        NavigationLink(destination: PerfilEmpresaView()
                            .onAppear(perform: {
                                model.beginStock(activo.id)
                            }), label: {
                                HStack {
                                    Image(activo.logo)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30, alignment: .center)
                                        .padding(.trailing, 20)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        HStack(alignment: .top) {
                                            Text(activo.ticker)
                                                .font(.title3)
                                                .bold()
                                            Spacer()
                                            Text(activo.sector.capitalized)
                                                .font(.caption2)
                                        }
                                        Text(activo.nombre)
                                            .font(.caption)
                                    }
                                }
                            })
                    }
                }
            }
            .navigationTitle(Text("Panel General"))
            .environmentObject(ActivoModel())
        }
        .navigationViewStyle(.stack)
        
    }
}

struct PanelGeneralListView_Previews: PreviewProvider {
    static var previews: some View {
        PanelGeneralListView()
            .environmentObject(ActivoModel())
    }
}
