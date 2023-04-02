//
//  Tool.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import Foundation

/// Enum that contains different images sizes. Needed to create the image URL of a picture.
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
    
    /// Method that transforms a a value of type  Thumbnail and a value of type ImageAspectRatio into an image URL. This conversion is needed to construct the complete URL of an image.
    /// - Parameters:
    ///   - thumbnail: object with data type Thumbnail. This object has two propperties, path (url without extension) and thumbnailExtension with the extension of the image.
    ///   - aspectRatio: Enum that returns the image aspect ratio parameter, needed to construct the complete url.
    /// - Returns: Returns the completed image URL (path + image size + extension)
    func ThumbnailToURLConverter(this thumbnail: Thumbnail, withAspect aspectRatio: ImageAspectRatio) -> URL{
        let url = URL(string: "\(thumbnail.path)/\(aspectRatio.rawValue).\(thumbnail.thumbnailExtension ?? .jpg )")!
        debugPrint(url)
        return url
    }
    
    /// Method to retrieve one specific localized string for the swift files.
    /// - Parameters:
    ///   - value: Name of the localized String.
    ///   - language: The language code needed to retrieve the String from a certain localized file.
    /// - Returns: this method returns the value of the selected localized String.
    func localizeThisString(this value:String, in language:String) -> String{
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        let languageBundle = Bundle(path: path!)
        return languageBundle!.localizedString(forKey: value, value: nil, table: nil)
    }
}
