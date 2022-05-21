//
//  LoginView.swift
//  Navigation
//
//  Created by Alexander on 23.03.2022.
//

import UIKit

class LoginView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoginViews()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupLoginViews(){
        self.addSubview(logoImage)
        self.addSubview(loginButton)
        self.addSubview(loginText)
        self.addSubview(passwordText)
    }
    
    let logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        
        return logo
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "Color")
        button.addTarget(self, action: #selector(LogInViewController.pushTheButton), for: .touchUpInside)
        return button
    }()
    
    var loginText: UITextField = {
        let login = UITextField()
        login.textColor = .black
        login.attributedPlaceholder = NSAttributedString.init(string: "Email or phone", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        login.font = .systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.layer.borderWidth = 0.5
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.cornerRadius = 10
        login.backgroundColor = .systemGray6
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        login.leftView = paddingView
        login.leftViewMode = .always
        login.tintColor = UIColor(named: "MainColor")
        login.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        login.clearButtonMode = .unlessEditing
        login.clearButtonMode = .always
        return login
    }()
    
    var passwordText: UITextField = {
        let password = UITextField()
        
        
        password.translatesAutoresizingMaskIntoConstraints = false
        password.textColor = .black
        password.attributedPlaceholder = NSAttributedString.init(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        password.font = .systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.cornerRadius = 10
        password.isSecureTextEntry = true
        password.backgroundColor = .systemGray6
        password.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        password.tintColor = UIColor(named: "MainColor")
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        password.leftView = paddingView
        password.leftViewMode = .always
        password.addTarget(self, action: #selector(passSet), for: .editingChanged)
        password.clearButtonMode = .unlessEditing
        password.clearButtonMode = .always
        
        
        return password
    }()
    
    @objc func passSet() {
        
    }
    
    
    
}

extension UIView: UITextFieldDelegate {
    
}


