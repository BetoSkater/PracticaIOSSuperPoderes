//
//  PracticaIOSSuperPoderesApp.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 22/3/23.
//

import SwiftUI

@main
struct PracticaIOSSuperPoderesApp: App {
    
    @StateObject var baseViewModel = BaseViewModel()
    
    var body: some Scene {
        WindowGroup {
            BaseView()
                .environmentObject(baseViewModel)
            //ContentView(viewModel: HeroesTableViewModel())
        }
    }
}
