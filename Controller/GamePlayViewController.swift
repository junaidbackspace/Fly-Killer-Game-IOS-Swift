//
//  GamePlayViewController.swift
//  FlyKillerGame
//
//  Created by Naeem Abbas on 18/03/2024.
//

import UIKit

class GamePlayViewController: UIViewController {



    @IBOutlet weak var imageview2: UIImageView!
  //  @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageview3: UIImageView!

    @IBOutlet weak var imageView: UIImageView!
    var fly1 = 1

     var gameTimer: CADisplayLink?
    @IBOutlet weak var imagekillview1: UIImageView!
    var gameRunning = false

    var selectedImage: UIImage?
    var gameStopped = false

    var level: Int = 1
    var lifecount = 0
    var checklife1 = true
    var checklife2 = true
    var checklife3 = true

    @IBOutlet weak var imagelife1: UIImageView!
    @IBOutlet weak var scoretetfield: UITextField!

    @IBOutlet weak var imagelife2: UIImageView!
    @IBOutlet weak var imagelife3: UIImageView!
    //var score = 0 // Initial score
//    var lifeCount = 3

    var totalScore = 0
    // Assuming you have IBOutlets for your UIImageViews


    var dispatchWorkItem1: DispatchWorkItem?

    var animator: UIViewPropertyAnimator?
    var animator1: UIViewPropertyAnimator?
    var animator2: UIViewPropertyAnimator?
    var animator3: UIViewPropertyAnimator?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "fly2")
        imageview2.image = UIImage(named: "fly2")
        imageview3.image = UIImage(named: "fly2")




        lifecount = 0
            score = 0
            checklife1 = true
            checklife2 = true
            checklife3 = true
            imagelife1.isHidden = false
            imagelife2.isHidden = false
            imagelife3.isHidden = false
            scoretetfield.text = "Score: \(score)"

            imagekillview1.isHidden = true
            loopThroughImages()

            let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
            backgroundImageView.image = UIImage(named: "Background_Game-removebg-preview") // Replace "backgroundImage" with the name of your image file
            backgroundImageView.contentMode = .scaleAspectFill
            view.addSubview(backgroundImageView)
            view.sendSubviewToBack(backgroundImageView)

            let imageViews: [UIImageView] = [imageView, imageview2, imageview3]

            loadFlyImage()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.loopThroughImages()
            }

            for imageView in imageViews {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(tapGesture)
            }

            imageView.tag = 1
            imageview2.tag = 2
            imageview3.tag = 3

        startZigzagAnimation(imageView: imageView, direction: .right)
        startZigzagAnimation(imageView: imageview2, direction: .left)
        startZigzagAnimation(imageView: imageview3, direction: .right)

            translateImageView1(imageView: imageView)
            translateImageView2(imageView: imageview2)
            translateImageView3(imageView: imageview3)



            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

        }

    enum ZigzagDirection {
        case left
        case right
    }

    func startZigzagAnimation(imageView: UIImageView, direction: ZigzagDirection) {
        let screenWidth = view.bounds.width
        let finalY = view.bounds.height - imageView.bounds.height
        let amplitude: CGFloat = 50.0
        let duration: TimeInterval = 2.0

        var isMovingRight = (direction == .right)
        var currentX = imageView.center.x
        var currentY = imageView.center.y

        func animate() {
            UIView.animate(withDuration: duration, delay: 0, options: [.curveLinear], animations: {
                if isMovingRight {
                    currentX = min(screenWidth - imageView.bounds.width / 2, currentX + amplitude)
                } else {
                    currentX = max(imageView.bounds.width / 2, currentX - amplitude)
                }
                currentY += amplitude
                imageView.center = CGPoint(x: currentX, y: currentY)
            }) { [self] _ in
                isMovingRight.toggle()
                if currentY < finalY {
                    animate()
                } else {
                    imageView.center = CGPoint(x: currentX, y: 0)
                    self.startZigzagAnimation(imageView: imageView, direction: direction)
                }
            }
        }

    animate()
        

    }

func translateImageView1(imageView: UIImageView) {
    let finalY = view.frame.size.height

    animator1 = UIViewPropertyAnimator(duration: 10, curve: .linear) {
        let fY = finalY - imageView.frame.size.height
        imageView.transform = CGAffineTransform(translationX: 0, y: fY)
    }
//// ya wo code hy ja image nichy sy oper ja rahe hy os ka
//
//    // Set the initial position of the imageView to the bottom of the screen
//         imageView.frame.origin.y = view.frame.size.height - imageView.frame.size.height
//
//         animator1 = UIViewPropertyAnimator(duration: 10, curve: .linear) {
//             // Move the imageView to the top of the screen
//             imageView.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.size.height)
//         }
//
//         animator1?.startAnimation()

    animator1?.addCompletion({ (_) in
        if self.checklife1 {
            self.lifecount += 1
            self.lifeReducer(Count: self.lifecount)
        }
        self.checklife1 = true // Reset for the next cycle
    let randomY = 10
        imageView.transform = CGAffineTransform(translationX: 15, y: CGFloat(randomY))
        self.translateImageView1(imageView: imageView)
    })
    animator1?.startAnimation()
}

func translateImageView2(imageView: UIImageView) {
    let finalY = view.frame.size.height

    animator2 = UIViewPropertyAnimator(duration: 10, curve: .linear) {
        let fY = finalY - imageView.frame.size.height
        imageView.transform = CGAffineTransform(translationX: 0, y: fY)
    }

    animator2?.addCompletion({ (_) in
        if self.checklife2 {
            self.lifecount += 1
            self.lifeReducer(Count: self.lifecount)
        }
        self.checklife2 = true // Reset for the next cycle
        let randomY = 10
        imageView.transform = CGAffineTransform(translationX: 15, y: CGFloat(randomY))
        self.translateImageView2(imageView: imageView)
    })
    animator2?.startAnimation()
}

func translateImageView3(imageView: UIImageView) {
    let finalY = view.frame.size.height

    animator3 = UIViewPropertyAnimator(duration: 10, curve: .linear) {
        let fY = finalY - imageView.frame.size.height
        imageView.transform = CGAffineTransform(translationX: 0, y: fY)
    }

    animator3?.addCompletion({ (_) in
        if self.checklife3 {
            self.lifecount += 1
            self.lifeReducer(Count: self.lifecount)
        }
        self.checklife3 = true // Reset for the next cycle
        let randomY = 10
        imageView.transform = CGAffineTransform(translationX: 15, y: CGFloat(randomY))
        self.translateImageView3(imageView: imageView)
    })
    animator3?.startAnimation()
}
var countlife = 0


func lifeReducer(Count: Int) {
    print("Life count is: \(Count)")
    if Count == 1 {
        imagelife1.isHidden = true
    } else if Count == 2 {
        imagelife2.isHidden = true
    } else if Count == 3 {
        imagelife3.isHidden = true
pauseAnimations()
    gameOver() // Call gameOver only when all lives are lost
    }
}


func loadFlyImage() {
       // Load image based on fly_num
       let imageName = "fly\(fly1)"

       if let image = UIImage(named: imageName) {
           imageView.image = image
       } else {
           print("Error: Image \(imageName) not found.")
       }
   }
var ispauseanimation = true

@objc func loopThroughImages() {

     loadFlyImage()

       // Increment fly_num for next iteration
       fly1 += 1

       // Check if fly_num is within the desired range
       if fly1 <= 4 {
           // Add delay before next iteration
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               self.loopThroughImages()
               self.loadFlyImage()

           }
       }

   }
    // Add more IBOutlets as needed
@objc func imageViewTapped(_ gesture: UITapGestureRecognizer) {
        guard let imageView = gesture.view as? UIImageView else { return }


    print("Image Tapped")
    // Increment the score (or any other operation)
          score += 2
          // Update the text field with the new score
    self.scoretetfield.textColor = .white
    scoretetfield.text = "Score: \(score)"


    if imageView.tag == 1 {
        checklife1 = false
        imageView.transform = CGAffineTransform(translationX: 5, y: 0)
            animator1?.fractionComplete = 1
        if lifecount>3 {
            checklife1 = true
        }
        }
    else if imageView.tag == 2 {
        checklife2 = false
        imageView.transform = CGAffineTransform(translationX: 5, y: 0)
        animator2?.fractionComplete = 1}
    if lifecount>3 {
        checklife2 = true
    }
    else if imageView.tag == 3 {
        checklife3 = false
        imageView.transform = CGAffineTransform(translationX: 5, y: 0)
        animator3?.fractionComplete = 1

    }


    }

var imageIndex1 = 1
    var imageIndex2 = 2
    var imageIndex3 = 4
    let images = ["fly1", "fly2", "fly3","fly4","fly5"]
    let images2 = ["fly1", "fly2", "fly3","fly4","fly5"]
    let images3 = ["fly1", "fly2", "fly3","fly4","fly5"]
    // Names of your images

    @objc func changeImage() {
            // Set image
        imageView.image = UIImage(named: images[imageIndex1])
        imageview2.image = UIImage(named: images[imageIndex2])
        imageview3.image = UIImage(named: images[imageIndex3])

            // Update index for next image
            imageIndex1 = (imageIndex1 + 1) % images.count
        imageIndex2 = (imageIndex2 + 1) % images2.count
        imageIndex3 = (imageIndex3 + 1) % images3.count

        // Define a variable to keep track of the total score across levels
        var totalScore = 0

        // Check if score reaches 20
           if score >= 20 {
               totalScore += score
               // Display a message indicating level one is complete

               let alertController = UIAlertController(title: "Level One Complete", message: "Congratulations! You've completed level one.\nTotal Score: \(totalScore)", preferredStyle: .alert)



               // Add action for "Home" button
               let homeAction = UIAlertAction(title: "Home", style: .default) { _ in
                   // Add code to navigate back to the home screen or perform any other action needed
                   // For example, you can dismiss this view controller or navigate to the home screen
                   self.HomeScreem()
               }

            alertController.addAction(homeAction)

               // Add action for "Next" button
               let nextAction = UIAlertAction(title: "Next", style: .default) { _ in

                   // Add code to proceed to the next level or perform any action needed
                   // For example, you can call a function to start the next level
                   self.startNextLevel()
                   self.scoretetfield.text = "totascore\(self.totalScore)"
                   self.scoretetfield.textColor = .white

                   let alertController = UIAlertController(title: "Level two Complete", message: "Congratulations! You've completed level one.\nTotal Score: \(totalScore)", preferredStyle: .alert)
               }
               alertController.addAction(nextAction)

               // Present the alert controller
               present(alertController, animated: true, completion: nil)
           }


        }

    func startNextLevel() {
        // Add code to start the next level

        let Start = storyboard?.instantiateViewController(identifier: "nextViewController") as! nextViewController
         Start.modalPresentationStyle = .fullScreen
                present(Start, animated: true)

    }
    func HomeScreem() {
        // Add code to start the next level

        let Start = storyboard?.instantiateViewController(identifier: "FirstViewController") as! FirstViewController
         Start.modalPresentationStyle = .fullScreen
                present(Start, animated: true)

    }


    func startAnimation() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.floatFly(img: self.imageView, animator: &self.animator1)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.floatFly(img: self.imageview2, animator: &self.animator2)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.floatFly(img: self.imageview3, animator: &self.animator3)
            }
            floatFliesRandomly()

        }


    func floatFly(img: UIImageView, animator: inout UIViewPropertyAnimator?) {
           // Check if there's already an animator running and stop it if necessary
           if let existingAnimator = animator, existingAnimator.state == .active {
               existingAnimator.stopAnimation(true)
           }

           animator = UIViewPropertyAnimator(duration: 5.0, curve: .linear) {
               img.frame = CGRect(x: img.frame.origin.x, y: img.frame.origin.y - 100, width: img.frame.size.width, height: img.frame.size.height)
           }
           animator?.startAnimation()
       }
    var animators: [UIViewPropertyAnimator?] = [nil, nil, nil]

    // Define your function to float the flies
    func floatFliesRandomly() {
         // Define an array of image views
         let flyImageViews = [imageView, imageview2, imageview3]

         for (index, imgView) in flyImageViews.enumerated() {
             if let img = imgView {
                 callFloatFlyRandomly(img: img, index: index)
             }
         }
     }

    func callFloatFlyRandomly(img: UIImageView, index: Int) {
           // Generate a random time delay between 5 and 8 seconds
           let randomDelay = Double.random(in: 5.0...8.0)
           img.isHidden = false

           DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
               self.floatFly(img: img, index: index)
               self.callFloatFlyRandomly(img: img, index: index)
           }
       }
    func floatFly(img: UIImageView, index: Int) {
            // Create and start an animation
            let animator = UIViewPropertyAnimator(duration: 5.0, curve: .linear) {
                img.frame = CGRect(x: img.frame.origin.x, y: img.frame.origin.y - 100, width: img.frame.size.width, height: img.frame.size.height)
            }
            animators[index] = animator
            animator.startAnimation()
        }
          @objc func imageTapped1(_ sender: UITapGestureRecognizer) {
              print("Enter to 1 kill")
//              imageview2.isHidden = true
              imageview2.image = imagekillview1.image


              }



          @objc func imageTapped2(_ sender: UITapGestureRecognizer) {
              print("Enter to 2 kill")
              imageView.isHidden = true
              imageView.isHidden = true
                    imagekillview1.isHidden = false
                    dispatchWorkItem1?.cancel()

              }
          @objc func imageTapped3(_ sender: UITapGestureRecognizer) {
              print("Enter to 3 kill")
              //imageview3.image = UIImage(named: "stopgame")
              imageview3.isHidden = true
              }


    var pausetime  : CADisplayLink?
func gameOver() {
    print("Game Over called")
    let alertController = UIAlertController(title: "Game Over", message: "You lost all lives!", preferredStyle: .alert)

    // Restart game action


    // Go to home screen action
    let homeAction = UIAlertAction(title: "Home", style: .default) { _ in
        self.goToHomeScreen()
    }
    let restartAction = UIAlertAction(title: "Restart", style: .default) { _ in
        self.resetGame()
    }

    alertController.addAction(homeAction)
    alertController.addAction(restartAction)

    present(alertController, animated: true, completion: nil)
}
    func goToHomeScreen() {
        if let homeVC = storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController {
            homeVC.modalPresentationStyle = .fullScreen
            present(homeVC, animated: true, completion: nil)
        }
    }

    var gameStop = true
    @IBAction func btnstop(_ sender: Any) {



        if gameStop {
                print("====>stopping animations")
                pauseAnimations()
                gameStop = false
            } else {
                print("====>resuming animations")
                resumeAnimations()
                gameStop = true

            }
    }



    func pauseAnimations() {
        animator1?.pauseAnimation()
        animator2?.pauseAnimation()
        animator3?.pauseAnimation()

    }

    func resumeAnimations() {
        animator1?.startAnimation()
        animator2?.startAnimation()
        animator3?.startAnimation()
    }

    func resetGame() {
        // Reset the game state
        lifecount = 0
        score = 0
        checklife1 = true
        checklife2 = true
        checklife3 = true
        imagelife1.isHidden = false
        imagelife2.isHidden = false
        imagelife3.isHidden = false
        scoretetfield.text = "Score: \(score)"


        resumeAnimations()
    }
    @IBAction func killAllImages(_ sender: UIButton) {
        // Iterate through all UIImageViews containing the fly images and hide them
        imageView.isHidden = true
            imageview2.isHidden = true
            imageview3.isHidden = true


        // If the score is greater than 10, decrease it by 10
        if score > 10 {
            score -= 10
        } else if score >= 10 {
            // If the score is 10 or less, disable the button and stop further action
            sender.isEnabled = false
            return
        }

        // If the score is a multiple of 10, enable the button again
        if score % 10 == 0 {
            sender.isEnabled = true
        }

               // Update the button title
               updateButtonTitle()

    }



    var score: Int = 0 {
          didSet {
              // Update the button title whenever the score changes
              updateButtonTitle()
          }
      }
    func updateButtonTitle() {
          myButton.setTitle("Button Pressed \(buttonPressCount) times", for: .normal)
      }
      var buttonPressCount: Int = 0

    @IBAction func backhome(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "FirstViewController") as! FirstViewController
         Start.modalPresentationStyle = .fullScreen
                present(Start, animated: true)
    }


}






 
