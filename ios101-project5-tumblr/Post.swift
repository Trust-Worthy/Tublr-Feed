//
//  Post.swift
//  ios101-project5-tumbler
//

import Foundation

struct Blog: Decodable {
    let response: Response
}

struct Response: Decodable {
    let posts: [Post]
}

struct Post: Decodable {
    
    let title: String
    let summary: String
    let caption: String
    let photos: [Photo]?
    
    private enum CodingKeys: String, CodingKey {
        case blog
        case summary
        case caption
        case photos
    }
    
    private enum BlogKeys: String, CodingKey {
        case title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // decode summary and caption normally
        
        self.summary = try container.decode(String.self, forKey: .summary)
        self.caption = try container.decode(String.self, forKey: .caption)
        self.photos = try container.decodeIfPresent([Photo].self, forKey: .photos)
        
        // decode the blog title
        let blogContainer = try container.nestedContainer(keyedBy: BlogKeys.self, forKey: .blog)
        self.title = try blogContainer.decode(String.self, forKey: .title)
    }
}

struct Photo: Decodable {
     let originalSize: PhotoInfo

    enum CodingKeys: String, CodingKey {

        // Maps API key name to a more "swifty" version (i.e. lowerCamelCasing and no `_`)
        case originalSize = "original_size"
    }
}

struct PhotoInfo: Decodable {

    // The url for the location of the photo image
    let url: URL
}
