//
//  SceneDelegate.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 20.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        
        let menuViewController = MenuViewController()
        let navigationController = UINavigationController(rootViewController: menuViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
}

