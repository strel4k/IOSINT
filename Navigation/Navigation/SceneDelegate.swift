//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Alexander on 11.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        
        let tabBarController = UITabBarController()
        let postViewController = UINavigationController(rootViewController: PostViewController())
        tabBarController.viewControllers = [feedViewController, profileViewController]
        window?.rootViewController = UINavigationController(rootViewController: profileViewController)
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = UIColor.systemBlue
            profileViewController.navigationBar.standardAppearance = navBarAppearance
            profileViewController.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            profileViewController.edgesForExtendedLayout = []
        }
        
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
    
    func createFeedViewController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Лента"
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "chart.bar.doc.horizontal.fill"), tag: 0)
        
        return UINavigationController(rootViewController: feedViewController)
    }
    
    func createProfileViewController() -> UINavigationController {
        let profileViewController = LogInViewController()
        profileViewController.title = "Профиль"
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle.fill"), tag: 1)
        
        return UINavigationController(rootViewController: profileViewController)
        
        
    }
    
    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemBackground
        tabBarController.viewControllers = [createFeedViewController(), createProfileViewController()]
        return tabBarController
    }
    
}

