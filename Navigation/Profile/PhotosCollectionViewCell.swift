//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Alexander on 07.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotosCollectionViewCell"
    
    lazy private  var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(imageView)

        setupLayouts()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupLayouts() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),

            contentView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }

    func setup(with image: UIImage) {
        imageView.image = image
    }
}
