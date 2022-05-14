//
//  ActivosListView.swift
//  Acciones Argentinas App
//
//  Created by Gian Marco Caserta on 13/05/2022.
//

import SwiftUI

struct ActivosListView: View {
    
    @EnvironmentObject var model: ActivoModel
    
    var body: some View {
        
        NavigationView {
            
            List {
                // MARK: Sección de acciones del panel líder
                Section(header: Text("Panel Líder")
                    .foregroundColor(.black)) {
                        
                        ForEach(model.activos) { activo in
                            
                            if activo.panelLider == true {
                                
                                NavigationLink(destination: PerfilEmpresaView()
                                    .onAppear(perform: {
                                        model.beginStock(activo.id)
                                    }), label: {
                                    HStack {
                                        Image(activo.logo)
                                            .resizable()
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
            }
            .navigationTitle(Text("Lista de activos"))
            .environmentObject(ActivoModel())
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ActivosListView()
            .environmentObject(ActivoModel())
    }
}
