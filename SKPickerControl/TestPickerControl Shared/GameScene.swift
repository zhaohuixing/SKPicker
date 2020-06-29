///**
/**
Workspace:      Untitled 1
Project: 	TestPickerControl
Target:  	 
Package: 	TestPickerControl Shared 
File: 		GameScene.swift

Created by: Zhaohui Xing on 4/30/20
Copyright (c) 2020 Zhaohui Xing. All rights reserved.
*/
import SpriteKit

class GameScene: SKScene, SKPickerHost {
    
    
    //fileprivate var label : SKLabelNode?
    //fileprivate var spinnyNode : SKShapeNode?
    private var m_ImagePicker1 :  SKPicker?
    private var m_ImagePicker2 :  SKPicker?
    private var m_ImagePicker3 :  SKPicker?
    private var m_ImagePicker4 :  SKPicker?

    private var m_nSelectItem : Int = 0;
    class func newGameScene() -> GameScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
            print("Failed to load GameScene.sks")
            abort()
        }
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        return scene
    }
    
    func setUpScene() {
        var size : CGSize = CGSize(width: 300.0, height: 400.0)
        //var bkImage = SKPickerRender.createColorTexture(red: 1.0, green: 1.0, blue: 0.5, alpha: 0.8, size: size, layout: .veritcal)
        var bkImage = SKPickerRender.createDefaultGradientTexture(size: size, layout: .veritcal)
        m_ImagePicker1 = SKPicker(texture: bkImage, size: size)
        m_ImagePicker1!.layout = .veritcal
        m_ImagePicker1!.displayItems = 3
        m_ImagePicker1!.position = CGPoint(x: -500.0, y: 0.0)
        addChild(m_ImagePicker1!)

        let scale : CGFloat = 1.0
        for i in 1 ... 10 {
            let sImageSet : String = "p\(i)"
            m_ImagePicker1!.AddImageItem(imageset: sImageSet, imagescale: scale)
        }
        for i in 11 ... 100 {
            let sText : String = "Label \(i-10)"
            m_ImagePicker1!.AddLabelItem(text: sText, fontname: "Times New Roman", imagescale: scale)
        }
        m_ImagePicker1!.zPosition = 1

        size = CGSize(width: 200.0, height: 400.0)
        bkImage = SKPickerRender.createColorTexture(red: 0.5, green: 1.0, blue: 1.0, alpha: 1.0, size: size, layout: .veritcal)
        m_ImagePicker2 = SKPicker(texture: bkImage, size: size)
        m_ImagePicker2!.layout = .veritcal
        m_ImagePicker2!.displayItems = 7
        m_ImagePicker2!.position = CGPoint(x: -150.0, y: 0.0)
        addChild(m_ImagePicker2!)

        for i1 in 1 ... 10 {
            let sImageSet1 : String = "p\(i1)"
            m_ImagePicker2?.AddImageItem(imageset: sImageSet1, imagescale: scale)
        }
        for i in 11 ... 50 {
            let sText : String = "Text\(i-10)"
            m_ImagePicker2!.AddLabelItem(text: sText, fontname: "Times New Roman", imagescale: scale)
        }
        m_ImagePicker2!.zPosition = 1

        size = CGSize(width: 400.0, height: 300.0)
        //bkImage = SKPickerRender.createColorTexture(red: 0.5, green: 1.0, blue: 0.5, alpha: 1.0, size: size, layout: .horizontal)
        bkImage = SKPickerRender.createDefaultGradientTexture(size: size, layout: .horizontal)
        m_ImagePicker3 = SKPicker(texture: bkImage, size: size)
        m_ImagePicker3!.layout = .horizontal
        m_ImagePicker3!.displayItems = 3
        m_ImagePicker3!.position = CGPoint(x: 300.0, y: 200.0)
        m_ImagePicker3!.itemSteps = 5
        addChild(m_ImagePicker3!)
        
        for i2 in 1 ... 10 {
            let sImageSet2 : String = "p\(i2)"
            m_ImagePicker3!.AddImageItem(imageset: sImageSet2, imagescale: scale)
        }
        for i in 11 ... 100 {
            let sText : String = "\(i)"
            m_ImagePicker3!.AddLabelItem(text: sText, fontname: "Times New Roman", imagescale: scale)
        }
        m_ImagePicker3!.zPosition = 1

        size = CGSize(width: 400.0, height: 200.0)
        bkImage = SKPickerRender.createColorTexture(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0, size: size, layout: .horizontal)
        m_ImagePicker4 = SKPicker(texture: bkImage, size: size)
        m_ImagePicker4!.layout = .horizontal
        m_ImagePicker4!.displayItems = 7
        m_ImagePicker4!.position = CGPoint(x: 300.0, y: -200.0)
        addChild(m_ImagePicker4!)
        
        for i3 in 1 ... 10 {
            let sImageSet3 : String = "p\(i3)"
            m_ImagePicker4?.AddImageItem(imageset: sImageSet3, imagescale: scale)
        }
        for i in 11 ... 50 {
            let sText : String = "\(i)"
            m_ImagePicker4!.AddLabelItem(text: sText, fontname: "Times New Roman", imagescale: scale)
        }
        m_ImagePicker4!.zPosition = 1

        m_ImagePicker1!.Initialize()
        m_ImagePicker2!.Initialize()
        m_ImagePicker3!.Initialize()
        m_ImagePicker4!.Initialize()

        m_ImagePicker1!.setHost(self)
        m_ImagePicker2!.setHost(self)
        m_ImagePicker3!.setHost(self)
        m_ImagePicker4!.setHost(self)

        m_nSelectItem = 49;
        UpdateSelectItem()
    }
    
    func UpdateSelectItem() {
        var nSelection = m_nSelectItem%m_ImagePicker1!.ItemCount()
        m_ImagePicker1!.selection = nSelection
        
        nSelection = m_nSelectItem%m_ImagePicker2!.ItemCount()
        m_ImagePicker2!.selection = nSelection
        
        nSelection = m_nSelectItem%m_ImagePicker3!.ItemCount()
        m_ImagePicker3!.selection = nSelection
        
        nSelection = m_nSelectItem%m_ImagePicker4!.ItemCount()
        m_ImagePicker4!.selection = nSelection
    }
    
    func TestRollAscend() {
        let tv : CGFloat = 0.5
        if m_ImagePicker1!.CanAnimateOneItem(direction:.ascend) {
            m_ImagePicker1!.AnimateOneItem(speed: tv, direction:.ascend)
        }
        if m_ImagePicker2!.CanAnimateOneItem(direction:.ascend) {
            m_ImagePicker2!.AnimateOneItem(speed: tv, direction:.ascend)
        }
        if m_ImagePicker3!.CanAnimateOneItem(direction:.ascend) {
            m_ImagePicker3!.AnimateOneItem(speed: tv, direction:.ascend)
        }
        if m_ImagePicker4!.CanAnimateOneItem(direction:.ascend) {
            m_ImagePicker4!.AnimateOneItem(speed: tv, direction:.ascend)
        }
    }

    func TestRollDescend() {
        let tv : CGFloat = 0.5
        if m_ImagePicker1!.CanAnimateOneItem(direction:.descend) {
            m_ImagePicker1!.AnimateOneItem(speed: tv, direction:.descend)
        }
        if m_ImagePicker2!.CanAnimateOneItem(direction:.descend) {
            m_ImagePicker2!.AnimateOneItem(speed: tv, direction:.descend)
        }
        if m_ImagePicker3!.CanAnimateOneItem(direction:.descend) {
            m_ImagePicker3!.AnimateOneItem(speed: tv, direction:.descend)
        }
        if m_ImagePicker4!.CanAnimateOneItem(direction:.descend) {
            m_ImagePicker4!.AnimateOneItem(speed: tv, direction:.descend)
        }
    }
    
    func TestRollMultipleItemsAscend() {
        let tv : CGFloat = 0.5
        let items : Int = 7
        m_ImagePicker1!.AnimateItems(items: items, speed: tv, direction:.ascend)
        m_ImagePicker2!.AnimateItems(items: items, speed: tv, direction:.ascend)
        m_ImagePicker3!.AnimateItems(items: items, speed: tv, direction:.ascend)
        m_ImagePicker4!.AnimateItems(items: items, speed: tv, direction:.ascend)
    }

    func TestRollMultipleItemsDescend() {
        let tv : CGFloat = 0.4
        let items : Int = 13
        m_ImagePicker1!.AnimateItems(items: items, speed: tv, direction:.descend)
        m_ImagePicker2!.AnimateItems(items: items, speed: tv, direction:.descend)
        m_ImagePicker3!.AnimateItems(items: items, speed: tv, direction:.descend)
        m_ImagePicker4!.AnimateItems(items: items, speed: tv, direction:.descend)
    }

    #if os(watchOS)
    override func sceneDidLoad() {
        self.setUpScene()
    }
    #else
    override func didMove(to view: SKView) {
        self.setUpScene()
    }
    #endif
    
    func notifyCompletion(sender: SKPicker) {
        NSLog("One of Pickers completed the rolling")
    }
}
