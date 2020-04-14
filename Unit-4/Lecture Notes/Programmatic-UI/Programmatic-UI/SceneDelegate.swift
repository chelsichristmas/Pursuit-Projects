//
//  SceneDelegate.swift
//  Programmatic-UI
//
//  Created by Chelsi Christmas on 1/28/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // iOS 13 now has a scene delegate, this is where the wiondow property is
    // in order to set up your programmatic UI code, you must set the rootViewController property of the window
    // e.g window.rootViewController  = ViewController()
    
    // Steps in removing the default Main.storyboard file from the info.plist file
    // 1. delete the "Main storyboard" entry from the info.plist
    // 2. delete the storyboard name value from the "Scene configuration"
    // 3. delete the Main.storyboard file (optional)
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        //Steps in configuring programmatic UI in the SceneDelegate
        //Steps in configuring the window property
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // set up the windows to take up the entire device's screen
        // instantiating the window with a frame
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
        
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

