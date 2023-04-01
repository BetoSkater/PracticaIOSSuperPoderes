//
//  SerieCard.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 28/3/23.
//

import Foundation
import SwiftUI

struct SerieCard<Content: View> : View{
    @Environment(\.colorScheme) var retrievedColorScheme
    
    var content: Content
    
    
    init(@ViewBuilder content:() -> Content){
        self.content = content()
    }
    
    var body: some View{
        Text("Hola")
    }
}


struct SerieCardTwo<Content: View> : View{
    @Environment(\.colorScheme) var retrievedColorScheme
    @Environment(\.locale) var localizedLanguage
    var content: Content
    var serie: Serie
    
    init(@ViewBuilder content:() -> Content, serie: Serie){
        self.content = content()
        self.serie = serie
//        let language = (localizedLanguage.language.languageCode?.identifier)!
//        debugPrint("the lenguage is \(language)")
    }
    
    var body: some View{
        
        ZStack{
           
            VStack {
                AsyncImage(url: Tool.shared.ThumbnailToURLConverter(this: serie.thumbnail, withAspect: .portraitUncanny)) { Image in
                    Image
                        .resizable()
                        .padding()
                } placeholder: {
                    Image(systemName: "photo.artframe")
                }
                Text(serie.description ?? Tool.shared.localizeThisString(this: "DescriptionNil", in: (localizedLanguage.language.languageCode?.identifier)!))
                    .frame(height: 100)
                    //.background(Color.white)
                    .lineLimit(3)
                    .padding()
                    .padding(.top,-30)
                
            }
            .opacity(0.6)
            
            TitleStyle{
                Text(serie.title)
                    .background(.white.opacity(0.5))
                    .cornerRadius(10)
 
            }
        }
        .frame(height: 600)
        .background(Color(.lightGray)) //TODO: Change to gray
        .cornerRadius(25)
    }
    
}

/*
 struct SerieCardThree<Content: View> : View{
 @Environment(\.colorScheme) var retrievedColorScheme
 
 var content: Content
 var serie: Serie
 
 init(@ViewBuilder serie: (Serie) -> ()){
 // self.content = content()
 //  self.serie = serie()
 }
 
 var body: some View{
 
 Text("Hola: \(serie.title)")
 
 }
 }
 
 */

