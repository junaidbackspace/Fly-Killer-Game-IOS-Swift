//
//  titleScene.swift
//  ko
//
//  Created by Naeem Abbas on 19/10/2023.
//

import Foundation
import SpriteKit

var buttonPlat: UIButton!
var gamePlay: UILabel!
var fly = SKSpriteNode()

class titleScene: SKScene{
    override func didMove(to view: SKView) {
        self.backgroundColor = offBlackColor
        leadfly()
    }
    func leadfly(){
        fly = SKSpriteNode(imageNamed: "fly")
        fly.size = CGSize(width: 180, height: 180)
        fly.position = CGPoint(x: self.frame.minX, y: self.frame.midY)
        self.addChild(fly)
        
    }
    func setUpText(){
        let buttonMargin = CGFloat(50)
        let buttonsize = CGSize(width: 300, height: 180)
    }
    
  
}
