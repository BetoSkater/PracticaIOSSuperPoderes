//
//  BaseViewModel.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import Foundation
import Combine

final class BaseViewModel: ObservableObject{
    @Published var status: Status = .loading
    
    //Todo: I think that a subscriptor might not be necessary in here if I create a separate ViewModel for the tableView.
    var suscriptors = Set<AnyCancellable>()
    
    
}
