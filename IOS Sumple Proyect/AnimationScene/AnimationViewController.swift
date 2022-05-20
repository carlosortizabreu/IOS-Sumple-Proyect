//
//  AnimationViewController.swift
//  IOS Sumple Proyect
//
//  Created by Carlos Ortiz Abreu on 12/5/22.
//

import UIKit
import SpriteKit

class AnimationViewController: UIViewController {
    
    var gameScene: AnimationGameScene!

    override func viewDidLoad() {
        super.viewDidLoad()

    // MARK: - GAMESCENE.
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "AnimationGameScene"){
                scene.scaleMode = .fill
                // Size, tamaño.
                // aspectFit, aspectFill, fill, resizeFill.
                gameScene = scene as? AnimationGameScene
                view.presentScene(scene)
            }
            // ? = ¿Tiene un valor? - Does it have a value?
            // ! = Yes, it has value.
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }
}
