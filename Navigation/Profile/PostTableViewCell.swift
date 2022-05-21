//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Alexander on 04.04.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    private let contentOnView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let usersPostImage: UIImageView = {
        var postImageView = UIImageView()
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = .black
        return postImageView
    }()
    
    private let author: UILabel = {
        var authorName = UILabel()
        authorName.font = UIFont.boldSystemFont(ofSize: 20)
        authorName.numberOfLines = 2
        authorName.translatesAutoresizingMaskIntoConstraints = false
        
        return authorName
    }()
    
    private let descriptionsPost: UITextField = {
        let userDescription = UITextField()
        userDescription.font = .systemFont(ofSize: 14)
        userDescription.textColor = .systemGray
        userDescription.translatesAutoresizingMaskIntoConstraints = false
        return userDescription
    }()
    
    private let viewsPosts: UITextField = {
        let views = UITextField()
        views.font = .systemFont(ofSize: 16)
        views.textColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    private let postsLikes: UITextField = {
        let likes = UITextField()
        likes.font = .systemFont(ofSize: 16)
        likes.textColor = .black
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeCell()
        setupContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(feed: Post){
        usersPostImage.image = feed.image
        author.text = feed.author
        descriptionsPost.text = feed.description
        postsLikes.text = "Likes: " + String(feed.likes)
        viewsPosts.text = "Views: " + String(feed.views)
    }
    private func customizeCell() {
        contentView.backgroundColor = .systemGray6
    }
    
    private func setupContent(){
        [contentOnView, author, usersPostImage, descriptionsPost, postsLikes, viewsPosts].forEach {contentView.addSubview($0)}
        NSLayoutConstraint.activate([
            contentOnView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentOnView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentOnView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentOnView .bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentOnView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            
            author.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            author.leadingAnchor.constraint(equalTo: contentOnView.leadingAnchor, constant: 16),
            author.heightAnchor.constraint(equalToConstant: 20),
            
            usersPostImage.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 12),
            usersPostImage.leadingAnchor.constraint(equalTo: contentOnView.leadingAnchor),
            usersPostImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            usersPostImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionsPost.topAnchor.constraint(equalTo: usersPostImage.bottomAnchor, constant: 16),
            descriptionsPost.leadingAnchor.constraint(equalTo: usersPostImage.trailingAnchor, constant: 16),
            descriptionsPost.trailingAnchor.constraint(equalTo: contentOnView.trailingAnchor, constant: 16),
            descriptionsPost.heightAnchor.constraint(equalToConstant: 20),
            descriptionsPost.widthAnchor.constraint(equalTo: contentOnView.widthAnchor),
            
            postsLikes.topAnchor.constraint(equalTo: descriptionsPost.bottomAnchor, constant: 16),
            postsLikes.leadingAnchor.constraint(equalTo: contentOnView.leadingAnchor, constant: 16),
            postsLikes .bottomAnchor.constraint(equalTo: contentOnView.bottomAnchor, constant: -16),
            
            viewsPosts.topAnchor.constraint(equalTo: descriptionsPost.bottomAnchor, constant: 16),
            viewsPosts.trailingAnchor.constraint(equalTo: contentOnView.trailingAnchor, constant: -16),
            viewsPosts .bottomAnchor.constraint(equalTo: contentOnView.bottomAnchor, constant: -16)
            
            
        ])
        
        
        
        
    }
}
