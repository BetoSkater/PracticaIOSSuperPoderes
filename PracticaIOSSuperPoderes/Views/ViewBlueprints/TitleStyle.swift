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
        
    #if os(watchOS)
        content
            .font(.title3)
            .bold()
            .foregroundColor(.black)
            .padding()
            .lineLimit(3)
    #else
        content
            .font(.title)
            .bold()
            .foregroundColor(.black)
            .padding()
    #endif
    }
}
