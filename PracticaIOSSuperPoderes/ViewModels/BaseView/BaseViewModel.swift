//
//  BaseViewModel.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import Foundation
import Combine

final class BaseViewModel: ObservableObject{
    @Published var status: Status = .none
    
    var suscriptors = Set<AnyCancellable>()
    
    
}
