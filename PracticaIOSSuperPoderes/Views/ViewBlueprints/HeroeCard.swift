//
//  HeroeCard.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 31/3/23.
//

import Foundation
import SwiftUI

struct HeroeCard<Content: View> : View{
    @Environment(\.colorScheme) var retrievedColorScheme
    
    var content: Content
    var heroe: Heroe
    
    init(@ViewBuilder content:() -> Content, heroe: Heroe){
        self.content = content()
        self.heroe = heroe
    }
    
    var body: some View{
        ZStack {
            Rectangle()
                .fill(Color(.lightGray))
                .frame(height: 250)
            VStack{
                AsyncImage(url: Tool.shared.ThumbnailToURLConverter(this: heroe.thumbnail, withAspect: .portraitUncanny)) {Image in
                    Image
                        .resizable()
                       // .frame(width:225 ,height: 175)
                        .frame(height: 175)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20)
                        .padding()
                } placeholder: {
                    Image(systemName: "person")
                }
                TitleStyle{
                    Text(heroe.name)
                        .padding(.top, -25)
                }
            }
            .frame(height: 225)
            .cornerRadius(30)
        }
        .cornerRadius(30)
       // .background(.red)
        .frame(height: 250)
       // .padding()
    }
}
