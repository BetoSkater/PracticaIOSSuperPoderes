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
        let url = URL(string: "\(thumbnail.path)/\(aspectRatio.rawValue).\(thumbnail.thumbnailExtension ?? .jpg )")!
        debugPrint(url)
        return url
        
//        if let thumbnail{
//            // "http://i.annihil.us/u/prod/marvel/i/mg/1/10/622795c13e687/portrait_uncanny.jpg"
//            let url = URL(string: "\(thumbnail.path)/\(aspectRatio.rawValue).\(thumbnail.thumbnailExtension )")!
//                    debugPrint(url)
//                    return url
//        }
    //    return URL(string: "\(thumbnail!.path)/\(aspectRatio.rawValue).jpg)")!
        //return URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available/portrait_uncanny.jpg")!
    }
    
    //Method to retrieve one specific localized string.
    func localizeThisString(this value:String, in language:String) -> String{
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        let languageBundle = Bundle(path: path!)
        return languageBundle!.localizedString(forKey: value, value: nil, table: nil)
    }
    
}
