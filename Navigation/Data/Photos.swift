//
//  Photos.swift
//  Navigation
//
//  Created by Alexander on 07.04.2022.
//


import UIKit

struct Photos {

    var image: UIImage


    static func createPhotosArray() -> [Photos]{
        var photo = [Photos]()
        photo.append(Photos(image: UIImage(named: "01")!))
        photo.append(Photos(image: UIImage(named: "02")!))
        photo.append(Photos(image: UIImage(named: "03")!))
        photo.append(Photos(image: UIImage(named: "04")!))
        photo.append(Photos(image: UIImage(named: "05")!))
        photo.append(Photos(image: UIImage(named: "06")!))
        photo.append(Photos(image: UIImage(named: "07")!))
        photo.append(Photos(image: UIImage(named: "08")!))
        photo.append(Photos(image: UIImage(named: "09")!))
        photo.append(Photos(image: UIImage(named: "10")!))
        photo.append(Photos(image: UIImage(named: "11")!))
        photo.append(Photos(image: UIImage(named: "12")!))
        photo.append(Photos(image: UIImage(named: "13")!))
        photo.append(Photos(image: UIImage(named: "14")!))
        photo.append(Photos(image: UIImage(named: "15")!))
        photo.append(Photos(image: UIImage(named: "16")!))
        photo.append(Photos(image: UIImage(named: "17")!))
        photo.append(Photos(image: UIImage(named: "18")!))
        photo.append(Photos(image: UIImage(named: "19")!))
        photo.append(Photos(image: UIImage(named: "20")!))
        
        return photo
    }
}
