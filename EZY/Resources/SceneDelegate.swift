//
//  SceneDelegate.swift
//  EZY
//
//  Created by 김유진 on 2021/05/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        let mainViewController = LoginViewController()
=======
<<<<<<< HEAD:EZY/SceneDelegate.swift
        let mainViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: ErrandDetailsViewController())
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
=======
=======
>>>>>>> 19d6eb730b5d1416bdbb7072919b5a02da8344da

        let mainViewController = ShowPlanViewController()

<<<<<<< HEAD
>>>>>>> d2f6fac03cd2fe4c6903d6eddb34a20147e3874b
=======
>>>>>>> 920819ae5e7c9dabc49a615e0742caedba1293ac
        let navigationController = UINavigationController(rootViewController: mainViewController)

        navigationController.navigationBar.isHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        

        for fontFaily in UIFont.familyNames{
            for fontName in UIFont.fontNames(forFamilyName: fontFaily){
                print(fontName)
            }
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

