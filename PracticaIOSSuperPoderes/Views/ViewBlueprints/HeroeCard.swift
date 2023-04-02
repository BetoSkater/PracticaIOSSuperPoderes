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
    #if os(watchOS)
        ZStack {
            Rectangle()
                .fill(Color(.lightGray))
                .frame(height: 200)
                .id(0)
            VStack{
                AsyncImage(url: Tool.shared.ThumbnailToURLConverter(this: heroe.thumbnail, withAspect: .portraitUncanny)) {Image in
                    Image
                        .resizable()
                        .frame(height: 140)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(30)
                        .padding()
                } placeholder: {
                    Image(systemName: "person")
                        .resizable()
                        .frame(height: 140)
                        .padding()
                }
                .id(1)
                TitleStyle{
                    Text(heroe.name)
                        .padding(.top, -15)
                        .id(2)
                }
            }
            .frame(height: 200)
            .cornerRadius(30)
        }
        .cornerRadius(30)
        .frame(height: 200)
        
    #else
        ZStack {
            Rectangle()
                .fill(Color(.lightGray))
                .frame(height: 250)
                .id(0)
            VStack{
                AsyncImage(url: Tool.shared.ThumbnailToURLConverter(this: heroe.thumbnail, withAspect: .portraitUncanny)) {Image in
                    Image
                        .resizable()
                        .frame(height: 175)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(30)
                        .padding()
                } placeholder: {
                    Image(systemName: "person")
                        .resizable()
                        .frame(height: 175)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(30)
                        .padding()
                }
                .id(1)
                TitleStyle{
                    Text(heroe.name)
                        .padding(.top, -25)
                        .id(2)
                }
            }
            .frame(height: 225)
            .cornerRadius(30)
        }
        .cornerRadius(30)
        .frame(height: 250)
        
    #endif
    }
}
