///**
/**
Workspace:      Untitled 1
Project: 	TestPickerControl
Target:  	TestPickerControl iOS 
Package: 	TestPickerControl iOS 
File: 		GameViewController.swift

Created by: Zhaohui Xing on 4/30/20
Copyright (c) 2020 Zhaohui Xing. All rights reserved.
*/


import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene.newGameScene()

        // Present the scene
        let skView = self.view as! SKView
        skView.presentScene(scene)
        
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
