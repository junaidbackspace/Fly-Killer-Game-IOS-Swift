//
//  GameLevelViewController.swift
//  FlyKillerGame
//
//  Created by Naeem Abbas on 10/01/2024.
//

import UIKit

class GameLevelViewController: UIViewController {
   

 
    var levelCompletionStatus: [Int: Bool] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }
 
    @IBAction func btn1(_ sender: Any) {
        
//        if canAccessLevel(1) {
//                    startGame(levelNumber: 1)
//                } else {
//                    print("You must complete the previous level before accessing this one.")
//                }
     
       
       let Start = storyboard?.instantiateViewController(identifier: "GamePlayViewController") as! GamePlayViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
    }
 
    @IBAction func btn2(_ sender: Any) {
   let Start = storyboard?.instantiateViewController(identifier: "nextViewController") as! nextViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
    }
    @IBAction func btn3(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "nextViewController") as! nextViewController
             Start.modalPresentationStyle = .fullScreen
                    present(Start, animated: true)
    }
    @IBAction func btn4(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "nextViewController") as! nextViewController
             Start.modalPresentationStyle = .fullScreen
                    present(Start, animated: true)
    }
    @IBAction func btn5(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "nextViewController") as! nextViewController
             Start.modalPresentationStyle = .fullScreen
                    present(Start, animated: true)
    }
    @IBAction func btn6(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "nextViewController") as! nextViewController
             Start.modalPresentationStyle = .fullScreen
                    present(Start, animated: true)
    }
    @IBAction func custombtn1(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "CustomViewController") as! CustomViewController
             Start.modalPresentationStyle = .fullScreen
                    present(Start, animated: true)
    }
    
    @IBAction func custombtn2(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "CustomViewController") as! CustomViewController
             Start.modalPresentationStyle = .fullScreen
                    present(Start, animated: true)
    }
    
    @IBAction func custombtn3(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "CustomViewController") as! CustomViewController
             Start.modalPresentationStyle = .fullScreen
                    present(Start, animated: true)
    }
    
    @IBAction func custombtn4(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "CustomViewController") as! CustomViewController
             Start.modalPresentationStyle = .fullScreen
                    present(Start, animated: true)
    }
    
    @IBAction func custombtn5(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "CustomViewController") as! CustomViewController
             Start.modalPresentationStyle = .fullScreen
                    present(Start, animated: true)
    }
    
    @IBAction func custombtn6(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "CustomViewController") as! CustomViewController
             Start.modalPresentationStyle = .fullScreen
                    present(Start, animated: true)
    }
    
    func startGame(levelNumber: Int) {
           // Start the game with the specified level
           let gamePlayViewController = storyboard?.instantiateViewController(identifier: "GamePlayViewController") as! GamePlayViewController
           gamePlayViewController.level = levelNumber
           gamePlayViewController.modalPresentationStyle = .fullScreen
           present(gamePlayViewController, animated: true)
       }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    @IBAction func btnHome(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "FirstViewController") as! FirstViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
        
    }
     
    @IBAction func btnshop(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "ShopViewController") as! ShopViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
    }
}
