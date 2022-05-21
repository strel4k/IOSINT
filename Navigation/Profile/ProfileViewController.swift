//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alexander on 11.03.2022.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController, UITableViewDelegate {
    
    let profileHeaderView = ProfileHeaderView()
    let posts = Post.createPostsArray()
    
    lazy var tableView: UITableView = {
        var myTableView = UITableView()
        myTableView.backgroundColor = .white
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
#if DEBUG
        tableView.backgroundColor = .red
#else
        tableView.backgroundColor = .white
#endif
        
        return myTableView
    } ()
    
    //    private lazy var collectionView: UICollectionView = {
    //       let collection = UICollectionViewFlowLayout()
    //        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collection)
    //        collectionView.translatesAutoresizingMaskIntoConstraints = false
    //        collectionView.backgroundColor = .systemRed
    //        collection.scrollDirection = .vertical
    //        collectionView.dataSource = self
    //        collectionView.delegate = self
    //        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
    //        return collectionView
    //    }()
    //MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мой профиль"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        profileHeaderView.statusTextField.delegate = self
        layout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        self.profileHeaderView.frame = self.view.frame
        self.profileHeaderView.backgroundColor = .lightGray
    }
    
    private func layout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.userImage.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.userName.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.statusTextField.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //MARK: - TABLEVIEW
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            //MARK: - PROFILEHEADERVIEW
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            //MARK: - PROFILEHEADERVIEW.USERIMAGE
            profileHeaderView.userImage.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            profileHeaderView.userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileHeaderView.userImage.widthAnchor.constraint(equalToConstant: 125),
            profileHeaderView.userImage.heightAnchor.constraint(equalToConstant: 125),
            //MARK: - PROFILEHEADERVIEW.USERNAME
            profileHeaderView.userName.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 27),
            profileHeaderView.userName.leadingAnchor.constraint(equalTo: profileHeaderView.centerXAnchor, constant: -40),
            profileHeaderView.userName.heightAnchor.constraint(equalToConstant: 18),
            //MARK: - PROFILEHEADERVIEW.STATUSTEXTFIELD
            profileHeaderView.statusTextField.bottomAnchor.constraint(equalTo: profileHeaderView.setStatusButton.topAnchor, constant: -34),
            profileHeaderView.statusTextField.leadingAnchor.constraint(equalTo: profileHeaderView.centerXAnchor, constant: -40),
            profileHeaderView.statusTextField.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16),
            profileHeaderView.statusTextField.heightAnchor.constraint(equalToConstant: 30),
            //MARK: - PROFILEHEADERVIEW.SETSTATUSBUTTON
            profileHeaderView.setStatusButton.topAnchor.constraint(equalTo: profileHeaderView.userImage.bottomAnchor, constant: 16),
            profileHeaderView.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            profileHeaderView.setStatusButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            profileHeaderView.setStatusButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16)
            
            
        ])
        
        
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        cell.setupCell(feed: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var vw = UIView()
        vw = profileHeaderView
        vw.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 220)
        return vw
    }
}

//MARK: -EXTENSION
extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        view.endEditing(true)
        return true
    }
}

// MARK: - UICollectionVIewDataSource OF COLLECTIONVIEW

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    
}

// MARK: EXTENSION - UICollectionViewDelegate OF COLLECTIONVIEW

extension ProfileViewController: UICollectionViewDelegate {
    
}
