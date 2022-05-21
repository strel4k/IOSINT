//
//  PostViewController.swift
//  Navigation
//
//  Created by Alexander on 11.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    var titlePost: String = "AZAZA"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        self.navigationItem.title = titlePost
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let infoButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(infoButton))
        navigationItem.rightBarButtonItem = infoButton
    }
    
    @objc func infoButton() {
        let infoViewController = InfoViewController()
        let navVC = UINavigationController(rootViewController: infoViewController)
        present(navVC, animated: true)
    }
}

class InfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Инфо"
        setupAlertButton()
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 15
        button.setTitle("Алерт", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(alertButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func showSimpleActionSheet() {
        let alert = UIAlertController(title: "Внимание!", message: "Сейчас вылетит алерт", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Вылет засчитан", style: .default, handler: { (_) in
            print("Анимация ушла с кнопки 1 ")
        }))
        alert.addAction(UIAlertAction(title: "Ну ок", style: .destructive, handler: { (_) in
            print("Анимация ушла с кнопки 2")
        }))
        self.present(alert, animated: true, completion: {
            print("Анимация пошла")
        })
    }
    
    private func setupAlertButton() {
        self.view.addSubview(self.button)
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    @objc private func alertButton() {
        showSimpleActionSheet()
    }
}
