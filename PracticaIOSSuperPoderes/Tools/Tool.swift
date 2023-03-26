//
//  Tool.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import Foundation


enum ImageAspectRatio:String{
    case portraitSmall = "portrait_small"
    case portraitMedium = "portrait_medium"
    case portraitXlage = "portrait_xlarge"
    case portraitFantastic = "portrait_fantastic"
    case portraitUncanny = "portrait_uncanny"
    case portraitIncredible = "portrait_incredible"
    

}

final class Tool{
    
    static let shared = Tool()
    
    func ThumbnailToURLConverter(this thumbnail: Thumbnail, withAspect aspectRatio: ImageAspectRatio) -> URL{
       // "http://i.annihil.us/u/prod/marvel/i/mg/1/10/622795c13e687/portrait_uncanny.jpg"
        let url = URL(string: "\(thumbnail.path)/\(aspectRatio.rawValue).\(thumbnail.thumbnailExtension)")!
        debugPrint(url)
        return url
        
        
    }
    
    
}
