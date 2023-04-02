//
//  Status.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 25/3/23.
//

import Foundation

enum Status: Equatable{
    case none, loading, loadedHeroes, loadedSeries, error(errorMsg: String)
}
