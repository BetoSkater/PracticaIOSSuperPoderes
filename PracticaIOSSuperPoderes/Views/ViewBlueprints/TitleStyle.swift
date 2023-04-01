//
//  TitleStyle.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 28/3/23.
//

import Foundation
import SwiftUI

struct TitleStyle<Content:View> :View{
    
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View{
        content
            .font(.title)
            .bold()
            .foregroundColor(.black)
            .padding()
    }
}
