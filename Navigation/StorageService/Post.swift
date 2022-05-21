//
//  Post.swift
//  Navigation
//
//  Created by Alexander on 11.03.2022.
//

import Foundation
import UIKit

    public struct Post {
    var author: String
    var description: String
    var image: UIImage
    var likes: Int
    var views: Int
    
    static func createPostsArray() -> [Post]{
        var feed = [Post]()
        feed.append(Post (author: "bruce.official", description: "We already have a 1 000 000", image: UIImage(named: "cat1")!, likes: 96928, views: 600000))
        feed.append(Post(author: "bbc.news", description: "New photo of the Sun", image: UIImage(named: "sun1")!, likes: 21312, views: 32123))
        feed.append(Post(author: "oskar.fun", description: "my 2022", image: UIImage(named: "punch")!, likes: 1231233, views: 332123))
        feed.append(Post(author: "reddit", description: "Jared Leto on grammy awards", image: UIImage(named: "grammy")!, likes: 5621312, views: 7732123))
        return feed
    }
}
