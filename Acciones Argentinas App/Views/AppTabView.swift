//
//  AppTabView.swift
//  Acciones Argentinas App
//
//  Created by Gian Marco Caserta on 13/05/2022.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        
        TabView {
            
            ActivosListView()
                .tabItem{
                    VStack {
                        Image(systemName: "building.2")
                        Text("Activos")
                    }
                }
            
            SectoresListView()
                .tabItem{
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Sectores")
                    }
                }
        }
        .environmentObject(ActivoModel())
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
