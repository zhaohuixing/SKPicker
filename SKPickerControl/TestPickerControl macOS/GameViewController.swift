///**
/**
Workspace:      Untitled 1
Project: 	TestPickerControl
Target:  	TestPickerControl macOS 
Package: 	TestPickerControl macOS 
File: 		GameViewController.swift

Created by: Zhaohui Xing on 4/30/20
Copyright (c) 2020 Zhaohui Xing. All rights reserved.
*/


import Cocoa
import SpriteKit
import GameplayKit

class GameViewController: NSViewController {

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

}

