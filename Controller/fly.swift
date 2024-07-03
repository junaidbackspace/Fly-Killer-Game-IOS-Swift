//
//  GameScene.swift
//  ko
//
//  Created by appe on 06/10/2023.
//
import Foundation

 
import SpriteKit
import GameplayKit

var player = SKSpriteNode()
 
var projecTile = SKSpriteNode()

var fly2 = SKSpriteNode()

var start = SKSpriteNode()

var scoreLabel = SKLabelNode()

var mainLabel = SKLabelNode()

var playerSize = CGSize(width: 140 , height: 140)

var projecTileSize = CGSize(width: 24, height:24)

var enemySize = CGSize(width: 140,height: 140)

var startSize = CGSize()


var offBlackColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)

var offWhiteColor = UIColor(red: 0.95,green:0.95,blue:0.95, alpha: 1)

var orangeCustorColor = UIColor.orange

var projecTiteRate = 0.2

var projecTitleSpeed = 0.9

var enemySpeed = 2.1

var enemySpawnRate = 0.6

var isalive = true

var score = 0

var touchlocation = CGPoint()


struct physicsCategory{
    static let player : UInt32 = 0
    static let projecTile : UInt32 = 1
    static let fly : UInt32 = 2
    
    
    
}


class GameScene: SKScene,SKPhysicsContactDelegate {
    
    override func didMove(to view: SKView) {
        self.backgroundColor = offBlackColor
        physicsWorld.contactDelegate = self
        
        
        
        resetgameveriable()
        leadplayer()
    fireprojectTile()
        timerSpawnEnemies()
        timerStart()
        spawnMainLabel()
    }
    func leadplayer() {
            player = SKSpriteNode(imageNamed: "fly2")
            player.size = player.size
            player.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 250)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.categoryBitMask = physicsCategory.player
        player.physicsBody?.contactTestBitMask = physicsCategory.fly
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.isDynamic = false
        player.name = "PlayerName"
        self.addChild(player)
        }
    func spawnfly(){
        fly2 = SKSpriteNode(imageNamed: "fly2")
        fly2.size = enemySize
        let xPos = randombetweenNumber(firstNum: 0, scoNum: frame.width)
        fly2.position = CGPoint(x: xPos - 500, y: self.frame.size.height/2)
        
        
        fly2.physicsBody = SKPhysicsBody(rectangleOf: fly2.size)
        fly2.physicsBody?.affectedByGravity = false
        fly2.physicsBody?.categoryBitMask = physicsCategory.fly
        fly2.physicsBody?.contactTestBitMask = physicsCategory.projecTile
        fly2.physicsBody?.allowsRotation = false
        fly2.physicsBody?.isDynamic = true
        fly2.name = "flyname"
        moveflyToFloor()
    self.addChild(fly2)
        
    }
    func moveflyToFloor(){
        let moveTo =  SKAction.moveTo(y: -600, duration: enemySpeed)
        let destroy = SKAction.removeFromParent()
        fly2.run(SKAction.sequence([moveTo, destroy]))
    }
    
    
    func randombetweenNumber(firstNum: CGFloat, scoNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - scoNum) + min(firstNum, scoNum)
    }
    
    func resetgameveriable(){
        isalive = true
        score = 0
    }
    func leadprojecttie(){
        projecTile = SKSpriteNode(imageNamed: "fly2")
        projecTile.size = projecTile.size
        projecTile.position = CGPoint(x: player.position.x, y: player.position.y)
       
        projecTile.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        projecTile.physicsBody?.affectedByGravity = false
        projecTile.physicsBody?.categoryBitMask = physicsCategory.projecTile
        projecTile.physicsBody?.contactTestBitMask = physicsCategory.fly
        projecTile.physicsBody?.allowsRotation = false
        projecTile.physicsBody?.isDynamic = true
        projecTile.name = "ProjecTileName"
        projecTile.zPosition = -1
        
        moveprojectiletotop()
        self.addChild(projecTile)

    }
    
    func  spawnStart(){
         let randomSize = Int(arc4random_uniform(12) + 12)
        startSize = CGSize(width: randomSize, height: randomSize)
        start = SKSpriteNode(imageNamed: "bokeh")
        start.size = startSize
        let xPos = randombetweenNumber(firstNum: 0, scoNum: frame.width)
        start.position = CGPoint(x: CGFloat(xPos - 500), y:self.frame.size.height/2)
        
        startsMove()
        self.addChild(start)
     }
    func startsMove(){
        let randomTime = Int(arc4random_uniform(10))
    let doubleRandomTime : Double = Double((randomTime) / 10) + 1
        let moveTo = SKAction.moveTo(y: 600, duration: doubleRandomTime)
        let destroy = SKAction.removeFromParent()
        start.run( SKAction.sequence([moveTo, destroy]))
 
    }
    
    func moveprojectiletotop(){
        let moveForward = SKAction.moveTo(y: 600, duration: projecTitleSpeed)
        let destroy = SKAction.removeFromParent()
        projecTile.run(SKAction.sequence([moveForward, destroy]))
    }
    func spawnMainLabel(){
        mainLabel = SKLabelNode(fontNamed: "futura")
        mainLabel.fontSize = 80
        mainLabel.fontColor = offWhiteColor
        mainLabel.position = CGPoint(x: self.frame.midX, y: self.frame.maxY + 600)
        mainLabel.text = "Score: \(score)"
        self.addChild(mainLabel)
    }
    func spawScoreLabel(){
        scoreLabel = SKLabelNode(fontNamed: "futura")
        scoreLabel.fontSize = 60
        scoreLabel.fontColor = offWhiteColor
        scoreLabel.position = CGPoint(x: self.frame.midX, y: self.frame.maxY + 130)
        scoreLabel.text = "Start"
        self.addChild(scoreLabel)
    }
    
    func timerSpawnEnemies(){
        let wait = SKAction.wait(forDuration: enemySpawnRate)
        let spawn = SKAction.run{
            self.spawnfly()
            
        }
        let sequence = SKAction.sequence([wait, spawn])
        self.run(SKAction.repeatForever(sequence))
        
    }
    func timerStart(){
        let wait = SKAction.wait(forDuration: 0.2)
        let spawn = SKAction.run{
            if isalive == true {
                self.spawnStart()
                self.spawnStart()
                self.spawnStart()
            }
        }
        let sequence = SKAction.sequence([wait, spawn])
        self.run(SKAction.repeatForever(sequence))
    }
    
    func didBegin(_contact:SKPhysicsContact){
        let firstName = _contact.bodyA
        let secondName = _contact.bodyB
        if (firstName.categoryBitMask == physicsCategory.fly) && (secondName.categoryBitMask == physicsCategory.projecTile) || (firstName.categoryBitMask == physicsCategory.projecTile) && (secondName.categoryBitMask == physicsCategory.fly){
            spawnExplosion(bodyTemp: firstName.node as! SKSpriteNode)
            
            flyPtojecTileCollision(contactA: firstName.node as! SKSpriteNode, contactB: secondName.node as! SKSpriteNode)
        }
        if (firstName.categoryBitMask == physicsCategory.fly) && (secondName.categoryBitMask == physicsCategory.player) || (firstName.categoryBitMask == physicsCategory.player) && (secondName.categoryBitMask == physicsCategory.fly){
            playerflyCollision(contactA: firstName.node as!  SKSpriteNode, contactB: secondName.node as!  SKSpriteNode)
            
            
            playerflyCollision(contactA: firstName.node as! SKSpriteNode, contactB: secondName.node as! SKSpriteNode)
            
        }
        
    }
    
    func movePlayerOffScreen(){
        projecTile.removeFromParent()
        spawnExplosion(bodyTemp: player)
    }
    
    func spawnExplosion(bodyTemp: SKSpriteNode){
        let explosionEmitterPath = Bundle.main.path(forResource: "explosionParticle", ofType: "sks")
        let explosion = NSKeyedUnarchiver.unarchiveObject(withFile: explosionEmitterPath! as String) as! SKEmitterNode
        explosion.position = CGPoint(x: bodyTemp.position.x, y: bodyTemp.position.y)
        explosion.zPosition = 1
        explosion.targetNode = self
        self.addChild(explosion)
        let wait =  SKAction.wait(forDuration: 0.5)
        let removeExplosion = SKAction.run{
            explosion.removeFromParent()
        }
        self.run(SKAction.sequence([wait, removeExplosion]))
    }
    func flyPtojecTileCollision(contactA: SKSpriteNode, contactB: SKSpriteNode){
        if contactA.name == "fly2Name" &&  contactB.name == "flyName"{
            score = score + 1
            let destroy = SKAction.removeFromParent()
            contactA.run(SKAction.sequence([destroy]))
                                            contactB.removeFromParent()
           
                                            
            upDateScore ()       }
        
    }
    func upDateScore(){
        scoreLabel.text = "Score /(score)"
        
    }
    
    func playerflyCollision(contactA: SKSpriteNode, contactB: SKSpriteNode){
        if contactA.name == "fly2Name" &&  contactB.name == "playerName"{
            isalive = false
            gameOverLogic()
            
        }
        if contactA.name == "fly2Name" &&  contactB.name == "flyName"{
        isalive = false
            gameOverLogic()
        }
    }
    func gameOverLogic(){
        mainLabel.fontSize = 60
        mainLabel.text = "Game Over"
        //resetTheGame()
    }
    
    func fireprojectTile(){
        let timer = SKAction.wait(forDuration: projecTiteRate)
        let spawn =  SKAction.run(){
            self.leadprojecttie()
        }
        let sequence =  SKAction.sequence([timer, spawn])
        self.run(SKAction.repeatForever(sequence))
    }
  func  moveplayerontouch(){
      player.position.x = (touchlocation.x)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isalive == false{
           
        }
        for touch in touches {
            touchlocation =  touch.location(in: player)
        }
    }
    func movetouch() {
        player.position.x = (touchlocation.x)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            touchlocation =  touch.location(in: player)
            moveplayerontouch()
      
    }
    }
}
