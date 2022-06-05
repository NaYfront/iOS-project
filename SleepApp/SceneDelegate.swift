//
//  SceneDelegate.swift
//  Sleep App
//
//  Created by Алексей Горбунов on 12.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let coreDataHandler = CoreDataHandler()
        let user = getUser(coreDataHandler: coreDataHandler)
        
        let profile = ProfileModuleBuilder.createProfileFirstScreen(coreDataHandler: coreDataHandler)
        
        let profileVC = profile.0
        let profileVP = profile.1
        let restVC = RestModuleBuilder.createRestFirstScreen(coreDataHandler: coreDataHandler, user: user, profileViewPresenter: profileVP)
        let infoVC = InfoModuleBuilder.createInfoFirstScreen()
        let listenVC = ListenModuleBuilder.createListenFirstScreen()
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = UIColor(named: "iceGreen")
        tabBarController.tabBar.barTintColor = UIColor(named: "darkBlue")
        
        if #available(iOS 15, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.selectionIndicatorTintColor = UIColor(named: "iceGreen")
            tabBarAppearance.backgroundColor = UIColor(named: "darkBlue")
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        
        
        
        tabBarController.viewControllers = [restVC, infoVC, listenVC, profileVC]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    func getUser(coreDataHandler: CoreDataHandler) -> User {
        if coreDataHandler.getAllObjects(objectName: "User")!.count == 0 {
            let user = User(context: coreDataHandler.getContext())
            user.state = "awake"
            user.preferableSleepTime = Time(hours: 20, minutes: 0)
            user.preferableWakeTime = Time(hours: 8, minutes: 0)
            coreDataHandler.saveContext()
            
            return user
        } else {
            return coreDataHandler.getLastObject(objectName: "User") as! User
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
