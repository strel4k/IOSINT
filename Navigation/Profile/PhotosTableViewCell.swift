//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Alexander on 07.04.2022.
//

import UIKit

struct PhotosTableViewCellVIewModel {
    let viewModel: [Photos]
}

protocol PhotosTableViewCellDelegate: AnyObject {
    func collectionTableViewCellDidTupItem()
}

class PhotosTableViewCell: UITableViewCell, UITableViewDelegate {
    
    static let identifier = "PhotosTableViewCell"
    
    weak var delegate: PhotosTableViewCellDelegate?
    
    
    
    private let title: UILabel = {
        let title = UILabel()
        title.text = "Photos"
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let button: UIButton = {
        let arrow = UIButton()
        arrow.setTitle("arrowshape.turn.up.right", for: .normal)
        arrow.setTitleColor(.black, for: .normal)
        arrow.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.addTarget(self, action: #selector(collectionButton), for: .touchUpInside)
        return arrow
    }()

    
    private let usersPhotos: UIImageView = {
        var usersPhotos = UIImageView()
        usersPhotos.translatesAutoresizingMaskIntoConstraints = false
        usersPhotos.contentMode = .scaleAspectFit
        usersPhotos.backgroundColor = .black
        return usersPhotos
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(feed: Photos){
        
        usersPhotos.image = feed.image
        
    }
    
    @objc func collectionButton() {
        print("Button was tapt")
        delegate?.collectionTableViewCellDidTupItem()
    }
}
