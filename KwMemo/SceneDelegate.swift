//
//  SceneDelegate.swift
//  KwMemo
//
//  Created by KyunWu on 2020/12/15.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    
    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
        DataManager.shared.saveContext()
    }
}

