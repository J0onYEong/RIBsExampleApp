//
//  SceneDelegate.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import UIKit

import RootRib

import RIBs

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var rootRouter: RootRouting?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        let rootController: UINavigationController = .init()
        let rootDependencies = RootRibDependencies(
            navigationController: rootController
        )
        let rootRibBuilder: RootBuildable = RootBuilder(dependency: rootDependencies)
        self.rootRouter = rootRibBuilder.build()
        
        self.window?.rootViewController = rootController
        self.window?.makeKeyAndVisible()
        
        rootRouter?.attachEditTextRib()
    }
    
    class RootRibDependencies: RootDependency {
        
        var navigationController: UINavigationController
        
        init(navigationController: UINavigationController) {
            self.navigationController = navigationController
        }
    }
}

