//
//  LogInViewController.swift
//  Navigation
//
//  Created by Alexander on 23.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let loginView = LoginView()
    let scrollView = UIScrollView()
    private let nc = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.hideNavigationBar()
        view.addSubview(loginView.logoImage)
        view.addSubview(loginView.loginButton)
        view.addSubview(loginView.loginText)
        view.addSubview(loginView.passwordText)
        layout()
        loginView.loginText.delegate = self
        loginView.passwordText.delegate = self
        
    }
    
    func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func kbdShow( notification: NSNotification){
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc func kbdHide( notification: NSNotification){
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(loginView)
        self.loginView.frame = self.view.frame
        self.loginView.backgroundColor = .white
        
    }
    
    
    private func layout() {
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            loginView.heightAnchor.constraint(equalToConstant: 0)
        ])
        
        loginView.logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.logoImage.topAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.topAnchor, constant: 120),
            loginView.logoImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 50),
            loginView.logoImage.widthAnchor.constraint(equalToConstant: 100),
            loginView.logoImage.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        loginView.loginText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.loginText.topAnchor.constraint(equalTo: loginView.logoImage.bottomAnchor, constant: 120),
            loginView.loginText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginView.loginText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginView.loginText.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        loginView.passwordText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.passwordText.topAnchor.constraint(equalTo: loginView.loginText.bottomAnchor, constant: 0),
            loginView.passwordText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginView.passwordText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginView.passwordText.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        loginView.loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.loginButton.topAnchor.constraint(equalTo: loginView.logoImage.bottomAnchor, constant: 236),
            loginView.loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            loginView.loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            loginView.loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func pushTheButton() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
        loginView.loginButton.alpha = 0.5
    }
    
}


extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        view.endEditing(true)
        return true
    }
}
