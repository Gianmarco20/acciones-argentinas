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
            
            PanelLiderListView()
                .tabItem{
                    VStack {
                        Image(systemName: "building.2")
                        Text("Panel líder")
                    }
                }
            
            PanelGeneralListView()
                .tabItem{
                    VStack {
                        Image(systemName: "building")
                        Text("Panel General")
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
