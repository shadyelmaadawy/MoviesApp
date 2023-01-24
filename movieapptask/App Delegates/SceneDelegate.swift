//
//  SceneDelegate.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private let logger = Logger.shared
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = SplashScreenViewController()
        window?.makeKeyAndVisible()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { [ weak window ] in
            let homeViewController = HomeViewConfigrator.createHomeVC()
            window?.rootViewController = UINavigationController(rootViewController: homeViewController)
            
            self.handleURL(connectionOptions.urlContexts)
        }
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        self.handleURL(URLContexts)
    }
    
    private func handleURL(_ urlContexts: Set<UIOpenURLContext>) {
        guard let baseURL = urlContexts.first,
              let baseHost = baseURL.url.host else { return }
        logger.debug(buffer: baseURL)
        if(baseURL.url.pathComponents.isEmpty == false && baseURL.url.pathComponents.count == 2) {
            switch(baseHost) {
                case "details_screen":
                    guard let movieIndex = Int(baseURL.url.pathComponents[1]),
                    let baseNavigatonController = self.window?.rootViewController as? UINavigationController else {
                        return
                    }
                    baseNavigatonController.pushViewController(DetailsConfigrator.createDetailsVC(with: movieIndex), animated: true)
                default:
                    break
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
    }


}

