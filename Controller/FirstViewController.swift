//
//  FirstViewController.swift
//  FlyKillerGame
//
//  Created by Naeem Abbas on 07/01/2024.
//
import AVFoundation
import UIKit
import DropDown
let db = DBManager()
var flyArray: [Fly] = []
let myButton = UIButton(type: .system)
let myb = UIButton(type: .system)
let ShopButton = UIButton(type: .system)
let Exitbutton = UIButton(type: .system)

var insectImageView = UIImageView()

 
class FirstViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    var audioPlayer: AVAudioPlayer?
    var flyImageView: UIImageView!
       var isMovingForward = true
    var isMovingUp = true
    var isMovingDown = true
    var isMovingRight = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // controller ka background color change
//        // Create gradient layer
//        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
//          backgroundImageView.image = UIImage(named: "Background_Game-removebg-preview") // Replace "backgroundImage" with the name of your image file
//          backgroundImageView.contentMode = .scaleAspectFill
//          view.addSubview(backgroundImageView)
//          view.sendSubviewToBack(backgroundImageView)
        
  
        
        
    // Set button title and frame
        myButton.setTitle("Play", for: .normal)
        myButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
    // Set button background color
        myButton.backgroundColor = UIColor.systemPurple
        // Set button title color
        myButton.setTitleColor(UIColor.white, for: .normal)
        // Set button corner radius
        myButton.layer.cornerRadius = 50
        // Set button border
        myButton.layer.borderWidth = 2
        myButton.layer.borderColor = UIColor.white.cgColor
        // Set button font
        myButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        // Add action to button
        myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        // Add button to view
        self.view.addSubview(myButton)
       // db.createTable(query: "create table if not exists fly (id text, name text, score text, price text")
        let buttonWidth: CGFloat = 200
              let buttonHeight: CGFloat = 50
              let screenWidth = UIScreen.main.bounds.width
              let screenHeight = UIScreen.main.bounds.height
              myButton.frame = CGRect(x: (screenWidth - buttonWidth) / 2,
                                      y: (screenHeight - buttonHeight) / 2.44,
                                      width: buttonWidth,
                                      height: buttonHeight)
// Do any additional setup after loading the view.
        // Set button title and frame
            myb.setTitle("Customization", for: .normal)
        myb.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        // Set button background color
        myb.backgroundColor = UIColor.systemPurple
            // Set button title color
        myb.setTitleColor(UIColor.white, for: .normal)
            // Set button corner radius
        myb.layer.cornerRadius = 50
            // Set button border
        myb.layer.borderWidth = 2
        myb.layer.borderColor = UIColor.white.cgColor
            // Set button font
        myb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            // Add action to button
        myb.addTarget(self, action: #selector(buttonTappe), for: .touchUpInside)
            // Add button to view
            self.view.addSubview(myb)
           // db.createTable(query: "create table if not exists fly (id text, name text, score text, price text")
        let customizeWidtt: CGFloat = 200
              let customizebuttonHeight: CGFloat = 10 //ya button ki width or height hy
              let customizebuttonscWidth = UIScreen.main.bounds.width // or ya screen ki width or height
              let shopbuttonscHeight = UIScreen.main.bounds.height
    myb.frame = CGRect(x: (customizebuttonscWidth - buttonWidth) / 2,
                       y: (customizebuttonscWidth - buttonHeight) / 0.88,
                                      width: buttonWidth,
                                      height: buttonHeight)
           
        
        // Do any additional setup after loading the view.
                // Set button title and frame
        ShopButton.setTitle("Shop", for: .normal)
        ShopButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
                // Set button background color
        ShopButton.backgroundColor = UIColor.systemPurple
                    // Set button title color
        ShopButton.setTitleColor(UIColor.white, for: .normal)
                    // Set button corner radius
        ShopButton.layer.cornerRadius = 50
                    // Set button border
        ShopButton.layer.borderWidth = 2
        ShopButton.layer.borderColor = UIColor.white.cgColor
                    // Set button font
        ShopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                    // Add action to button
        ShopButton.addTarget(self, action: #selector(shopbuttontapped), for: .touchUpInside)
                    // Add button to view
                    self.view.addSubview(ShopButton)
                   // db.createTable(query: "create table if not exists fly (id text, name text, score text, price text")
                    let shopbuttonWidtt: CGFloat = 200
                          let shopbuttonHeight: CGFloat = 10 //ya button ki width or height hy
                          let shopbuttonscWidth = UIScreen.main.bounds.width // or ya screen ki width or height
                          let shopHeight = UIScreen.main.bounds.height
        ShopButton.frame = CGRect(x: (shopbuttonscWidth - buttonWidth) / 2,
                                  y: (shopbuttonscWidth - buttonHeight) / 0.75,
                                                  width: buttonWidth,
                                                  height: buttonHeight)
        
        
        
        Exitbutton.setTitle("Exit", for: .normal)
        Exitbutton.frame = CGRect(x: 100, y: 100, width: 200, height: 70)
                // Set button background color
        Exitbutton.backgroundColor = UIColor.systemPurple
                    // Set button title color
        Exitbutton.setTitleColor(UIColor.white, for: .normal)
                    // Set button corner radius
        Exitbutton.layer.cornerRadius = 50
                    // Set button border
        Exitbutton.layer.borderWidth = 2
        Exitbutton.layer.borderColor = UIColor.white.cgColor
                    // Set button font
        Exitbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                    // Add action to button
        Exitbutton.addTarget(self, action: #selector(Exitbuttontapped), for: .touchUpInside)
                    // Add button to view
                    self.view.addSubview(Exitbutton)
                   // db.createTable(query: "create table if not exists fly (id text, name text, score text, price text")
                    let ExitbuttonWidtt: CGFloat = 200
                          let ExitbuttonHeight: CGFloat = 10 //ya button ki width or height hy
                          let ExitbuttonscWidth = UIScreen.main.bounds.width // or ya screen ki width or height
                          let ExitHeight = UIScreen.main.bounds.height
        Exitbutton.frame = CGRect(x: (ExitbuttonscWidth - buttonWidth) / 2,
                                  y: (ExitbuttonscWidth - buttonHeight) / 0.65,
                                                  width: buttonWidth,
                                                  height: buttonHeight)
        //setting button code
      
               
               
        
        
        let flyImage = UIImage(named: "fly2") // Replace "fly" with your image name
               flyImageView = UIImageView(image: flyImage)
               flyImageView.frame = CGRect(x: 100, y: -100, width: 60, height: 60) // Initial position and size
        
               view.addSubview(flyImageView)

               // Start moving the fly image
               moveFly()
        
         //kill image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
             flyImageView.isUserInteractionEnabled = true
             flyImageView.addGestureRecognizer(tapGestureRecognizer)
             
             // Start the animation
             
     
            

        
       
        
    }
 

       func createButton(title: String, image: UIImage?) -> UIButton {
           let button = UIButton(type: .custom)
           button.setTitle(title, for: .normal)
           button.setImage(image, for: .normal)
           button.setTitleColor(UIColor.red, for: .normal)
           button.addTarget(self, action: #selector(buttonTapp(_:)), for: .touchUpInside)
           return button
       }
    @objc func buttonTapp(_ sender: UIButton) {
          // Handle button tap actions here
          if let title = sender.titleLabel?.text {
              print("Button tapped:", title)
          }
      }
       func presentActionSheet(_ actionSheet: UIView) {
           let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
           alertController.view.addSubview(actionSheet)
           
           let height: NSLayoutConstraint = NSLayoutConstraint(item: alertController.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
           alertController.view.addConstraint(height)
           
           let cancelAction = UIAlertAction(title: "X", style: .cancel, handler: nil)
           alertController.addAction(cancelAction)
           
           present(alertController, animated: true, completion: nil)
       }
    func playSound() {
           // Play sound logic
           // For example:
           if let soundURL = Bundle.main.url(forResource: "fly2", withExtension: "mp3") {
               do {
                   audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                   audioPlayer?.play()
               } catch {
                   print("Error playing sound: \(error.localizedDescription)")
               }
           }
    }
        
        @objc func imageViewTapped() {
            // Stop the animation
            flyImageView.layer.removeAllAnimations()
            
            // Optionally hide or remove the image view from the screen
            flyImageView.isHidden = true
        }

    @objc func buttonTapped() {
        print("Button tapped!")
        let Start = storyboard?.instantiateViewController(identifier: "GameLevelViewController") as! GameLevelViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
    }
     
    @objc func buttonTappe() {
        print("Button tapped!")
        let Start = storyboard?.instantiateViewController(identifier: "CustomizeViewController") as! CustomizeViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
    }
     
    @objc func shopbuttontapped() {
        print("Button tapped!")
        let Start = storyboard?.instantiateViewController(identifier: "ShopViewController") as! ShopViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
    }

    //exit button code
    @objc func Exitbuttontapped() {
       
       
                let alertController = UIAlertController(title: "Exit Confirmation", message: "Are you sure you want to exit the game?", preferredStyle: .alert)
                
                let exitAction = UIAlertAction(title: "YES", style: .destructive) { _ in
                    
                    // Handle exit action here
                    exit(0) // This will terminate the app
                 
                }
     
                
                let restartAction = UIAlertAction(title: "NO,THANKS", style: .default)
                
               // let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel, handler: nil)
                
                alertController.addAction(exitAction)
                alertController.addAction(restartAction)
                //alertController.addAction(cancelAction)
                
                present(alertController, animated: true, completion: nil)
        
        //fly move in the screen
         
            
     
    }
    func moveFly() {
        let originalY = self.flyImageView.frame.origin.y
        let targetYTop = CGFloat(10) // Define the top target point
        let targetYBottom = self.view.frame.maxY - self.flyImageView.frame.size.height - 100 // Define the bottom target point
        
        UIView.animate(withDuration: 4.5, delay: 0, options: .curveLinear, animations: {
            // Move the fly image up to the top target point
            if self.isMovingDown {
                self.flyImageView.frame.origin.y = targetYBottom
            } else {
                self.flyImageView.frame.origin.y = targetYTop
            }
            
            // Move the fly image forward or backward based on the direction
            if self.isMovingForward {
                self.flyImageView.frame.origin.x += 200 // Move forward
            } else {
                self.flyImageView.frame.origin.x -= 200 // Move backward
            }
        }) { _ in
            // Toggle the direction
            self.isMovingDown = !self.isMovingDown
            self.isMovingForward = !self.isMovingForward
            
            // Continue moving the fly image
            self.moveFly()
        }
    }

    






        
   // @objc func settingsButtonTapped() {
//            print("Settings button tapped!")
//            // Perform any action you want when the settings button is tapped
//        let Start = storyboard?.instantiateViewController(identifier: "CustomizeViewController") as! CustomizeViewController
//        Start.modalPresentationStyle = .fullScreen
//               present(Start, animated: true)
      //  }

    
    
    @IBAction func btnPlay(_ sender: Any) {
       
        let Start = storyboard?.instantiateViewController(identifier: "GameLevelViewController") as! GameLevelViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
      
    }
//    @IBAction func Exit(_ sender: Any) {
//        let alertController = UIAlertController(title: "Exit Confirmation", message: "Are you sure you want to exit the game?", preferredStyle: .alert)
//
//        let exitAction = UIAlertAction(title: "YES", style: .destructive) { _ in
//
//            // Handle exit action here
//            exit(0) // This will terminate the app
//        }
//
//        let restartAction = UIAlertAction(title: "NO,THANKS", style: .default) { _ in
//            // Handle restart action here
//            // For example, you can reset the game state
//            print("Restarting the game...")
//        }
//
//        let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel, handler: nil)
//
//        alertController.addAction(exitAction)
//        alertController.addAction(restartAction)
//        alertController.addAction(cancelAction)
//
//        present(alertController, animated: true, completion: nil)
//
//
//
//    }
    
    @IBAction func Customizebtn(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "CustomizeViewController") as! CustomizeViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
    }
     
    @IBAction func Shopbtn(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "ShopViewController") as! ShopViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
    }
     
    @IBAction func Exitbtn(_ sender: Any) {
         
    }
    
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controll;er.;;;
    }
    */

}
