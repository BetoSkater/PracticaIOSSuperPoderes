//
//  BaseView.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import SwiftUI

struct BaseView: View {
    
    @EnvironmentObject var baseViewModel: HeroesTableViewModel
    
    var body: some View {
        switch baseViewModel.status{
        case .none:
            Text("Status:.none")
        case .loading:
          //  Text("Status: .loading")
            LoadingView()
        case .loaded:
            HeroesListView(heroesViewModel: baseViewModel)
            
        case .error(errorMsg: let errorMessage):
            Text("Status: .error. --> \(errorMessage)")
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
            .environmentObject(HeroesTableViewModel())
    }
}
