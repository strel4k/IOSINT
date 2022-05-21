//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alexander on 14.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        self.addSubview(userImage)
        self.addSubview(userName)
        self.addSubview(setStatusButton)
        self.addSubview(statusTextField)
//        self.addSubview(button)
    }
    
    
    let userImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.image = UIImage(named: "bruce")
        avatarImage.layer.cornerRadius = 62.5
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.clipsToBounds = true
        
        return avatarImage
    }()
    
    let userName: UILabel = {
        let nameField = UILabel()
        nameField.text = "Bruce The Cat"
        nameField.font = .boldSystemFont(ofSize: 18)
        nameField.textColor = .black
        return nameField
    }()
    
    var statusTextField: UITextField = {
        let text = UITextField()
        text.textColor = .darkGray
        text.attributedPlaceholder = NSAttributedString.init(string: "Ваш статус...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.layer.borderColor = UIColor.black.cgColor
        text.backgroundColor = .white
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        text.leftView = paddingView
        text.leftViewMode = .always
        return text
    }()
    
    var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        //        button.frame = CGRect(x: 16, y: 157, width: 395, height: 50)
        button.layer.cornerRadius = 14
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitle("Показать статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(pushTheButton), for: .touchUpInside)
        return button
    }()
    
    @objc func pushTheButton(){
        
        if let text = statusTextField.text{
            print(text)
        }
    }
    
//    let button: UIButton = {
//        let someButton = UIButton()
//        someButton.backgroundColor = .systemRed
//        someButton.setTitle("SOME TITLE", for: .normal)
//        return someButton
//    }()
}
