//
//  AnimationGameScene.swift
//  IOS Sumple Proyect
//
//  Created by Carlos Ortiz Abreu on 12/5/22.
//

import UIKit
import SpriteKit

class AnimationGameScene: SKScene, SKPhysicsContactDelegate {
   
    // MARK: - IMAGES.
    // Presentation.
    let img1 = SKTexture(imageNamed: "imgN1.png")
    let img2 = SKTexture(imageNamed: "imgN2.png")
    let img3 = SKTexture(imageNamed: "imgN3.png")
    let img4 = SKTexture(imageNamed: "imgN4.png")
    let img5 = SKTexture(imageNamed: "imgN5.png")
    let img6 = SKTexture(imageNamed: "imgN6.png")
    let img7 = SKTexture(imageNamed: "imgN7.png")
    // Ball.
    let imgP1 = SKTexture(imageNamed: "imgP1.png")
    let imgP2 = SKTexture(imageNamed: "imgP2.png")
    let imgP3 = SKTexture(imageNamed: "imgP3.png")
    let imgP4 = SKTexture(imageNamed: "imgP4.png")
    // MARK: - NODE.
    var nodeA = SKSpriteNode()
    var nodeB = SKSpriteNode()
    
    // MARK: - func NODE A.
    func NodeA(){
        // Cambio de imagen.
        let animA = SKAction.animate(with: [img1, img2, img3, img4, img5, img6, img7], timePerFrame: 0.4)
        let moveA = SKAction.repeatForever(animA)
        nodeA = SKSpriteNode(texture: img1)
        nodeA.position = CGPoint(x: 0, y: self.frame.midY + self.frame.height / 1)
        nodeA.physicsBody = SKPhysicsBody(circleOfRadius: img1.size().height/8)
        nodeA.physicsBody!.isDynamic = true
        // Dirección movimiento.
       // let mv1 = SKAction.moveBy(x: -frame.size.width, y: 1, duration: 6)
       // let mvA = SKAction.repeatForever(SKAction.sequence([mv1]))
       // Ejecución.
       // nodeA.run(mvA)
        nodeA.run(moveA)
        self.addChild(nodeA)
        
    }
   // MARK: - func NODE B.
    func NodeB(){
        // Cambio de imagen.
        let animB = SKAction.animate(with: [imgP1, imgP2, imgP3, imgP4], timePerFrame: 0.1)
        let moveB = SKAction.repeatForever(animB)
        nodeB = SKSpriteNode(texture: imgP1)
        nodeB.position = CGPoint(x: self.frame.width / -2, y:self.frame.height / 8)
        // Dirección movimiento.
        let mv1 = SKAction.moveBy(x: frame.size.width, y: -4, duration: 2)
        let mv2 = SKAction.moveBy(x: -frame.size.width, y: 200, duration: 2)
        let mv3 = SKAction.moveBy(x: frame.size.width, y: -100, duration: 2)
        let mv4 = SKAction.moveBy(x: -frame.size.width, y: 6, duration: 2)
    
        let mvB = SKAction.repeatForever(SKAction.sequence([mv1,mv2,mv3,mv4]))
        
        // Ejecución.
        nodeB.run(mvB)
        nodeB.run(moveB)
        self.addChild(nodeB)
     }
    
    // MARK: - Gravity.
    private func Gravity(){
        let gravity = SKNode()
        gravity.position = CGPoint(x: self.frame.midX, y: -frame.height / 8)
        // Altura, height.
        gravity.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: 4))
        gravity.physicsBody?.isDynamic = false
        self.addChild(gravity)
    }
    
    // MARK: - SETUPGAME.
    func SetupGame(){
        // Add.
        NodeA()
        NodeB()
        Gravity()
    }
     // MARK: - DIDMOVE.
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        // Add.
        SetupGame()
    }

}
