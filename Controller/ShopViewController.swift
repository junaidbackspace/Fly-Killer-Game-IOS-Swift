//
//  ShopViewController.swift
//  FlyKillerGame
//
//  Created by Naeem Abbas on 11/01/2024.
//

import UIKit

class ShopViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // controller ka background color change
        // Create gradient layer
//        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
//          backgroundImageView.image = UIImage(named: "Background_Game-removebg-preview") // Replace "backgroundImage" with the name of your image file
//          backgroundImageView.contentMode = .scaleAspectFill
//          view.addSubview(backgroundImageView)
//          view.sendSubviewToBack(backgroundImageView)
//        // Do any additional setup after loading the view.
//
//        let imageView4 = UIImageView()
//
//               // Set image
//               imageView4.image = UIImage(named: "honey bee-1")
//
//               // Set frame or constraints for the image view
//               imageView4.frame = CGRect(x: 5, y: 200, width: 150, height: 150)
//
//               // Add UIImageView to the view hierarchy
//               self.view.addSubview(imageView4)
//
//        //image first dropdown ky samny mosquito
//        let imageView3 = UIImageView()
//
//               // Set image
//               imageView3.image = UIImage(named: "mosquito")
//
//               // Set frame or constraints for the image view
//               imageView3.frame = CGRect(x: 5, y: 350, width: 150, height: 150)
//
//               // Add UIImageView to the view hierarchy
//               self.view.addSubview(imageView3)
//        let imageView2 = UIImageView()
//
//               // Set image
//               imageView2.image = UIImage(named: "image")
//
//               // Set frame or constraints for the image view
//               imageView2.frame = CGRect(x: 5, y: 500, width: 150, height: 150)
//
//               // Add UIImageView to the view hierarchy
//               self.view.addSubview(imageView2)
//        //image first dropdown ky samny
//        let imageView = UIImageView()
//
//               // Set image
//               imageView.image = UIImage(named: "Dragonimage")
//
//               // Set frame or constraints for the image view
//               imageView.frame = CGRect(x: 5, y: 640, width: 150, height: 150)
//
//               // Add UIImageView to the view hierarchy
//               self.view.addSubview(imageView)
//
//
//        // Set button title and frame
//        home.setTitle("", for: .normal)
//        home.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
//        // Set button background color
//        home.backgroundColor = UIColor.systemYellow
//            // Set button title color
//        home.setTitleColor(UIColor.white, for: .normal)
//            // Set button corner radius
//        home.layer.cornerRadius = 10
//            // Set button border
//        home.layer.borderWidth = 3
//        home.layer.borderColor = UIColor.white.cgColor
//            // Set button font
//        home.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//            // Add action to button
//        home.addTarget(self, action: #selector(HomeButtonTapped), for: .touchUpInside)
//            // Add button to view
//            self.view.addSubview(home)
//        let image = UIImage(named: "home") // Yaha "home_image" aapki image ka naam hona chahiye
//             home.setBackgroundImage(image, for: .normal)
//           // db.createTable(query: "create table if not exists fly (id text, name text, score text, price text")
//            let homeWidth: CGFloat = 50
//                  let homeHeight: CGFloat = 50
//                  let screenWidth = UIScreen.main.bounds.width
//                  let screenHeight = UIScreen.main.bounds.height
//        home.frame = CGRect(x: (screenWidth - homeWidth) / 12.80,
//                               y: (screenHeight - homeHeight) / 1,
//                                          width: homeWidth,
//                                          height: homeHeight)
//
//        // Set button title and frame
//        back.setTitle("", for: .normal)
//        back.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
//        // Set button background color
//        back.backgroundColor = UIColor.systemYellow
//            // Set button title color
//        back.setTitleColor(UIColor.white, for: .normal)
//            // Set button corner radius
//        back.layer.cornerRadius = 10
//            // Set button border
//        back.layer.borderWidth = 3
//        back.layer.borderColor = UIColor.white.cgColor
//            // Set button font
//        back.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//            // Add action to button
//        back.addTarget(self, action: #selector(BackButtonTapped), for: .touchUpInside)
//            // Add button to view
//            self.view.addSubview(back)
//        let image2 = UIImage(named: "back") // Yaha "home_image" aapki image ka naam hona chahiye
//        back.setBackgroundImage(image2, for: .normal)
//           // db.createTable(query: "create table if not exists fly (id text, name text, score text, price text")
//            let backWidth: CGFloat = 50
//                  let backHeight: CGFloat = 50
//                  let backscreenWidth = UIScreen.main.bounds.width
//                  let backscreenHeight = UIScreen.main.bounds.height
//        back.frame = CGRect(x: (screenWidth - homeWidth) / 1.05,
//                               y: (screenHeight - homeHeight) / 1,
//                                          width: homeWidth,
//                                          height: homeHeight)
//        //1 Text field ka frame set karein
//            let textField = UITextField(frame: CGRect(x: 300, y: 255, width: 100, height: 40))
//
//            // Placeholder text set karein
//            textField.placeholder = " "
//        textField.keyboardType = .default
//
//            // Text field ka border style set karein (optional)
//            textField.borderStyle = .roundedRect
//
//            // Text field ke keyboard type set karein (optional)
//            textField.keyboardType = .default
//        // Keyboard type ko number pad mein set karein
//              textField.keyboardType = .numberPad
//
//            // Text field ko view mein add karein
//            self.view.addSubview(textField)
//
//        // 2Text field ka frame set karein
//            let textField2 = UITextField(frame: CGRect(x: 300, y: 390, width: 100, height: 40))
//
//            // Placeholder text set karein
//            textField2.placeholder = " "
//        textField2.keyboardType = .default
//
//            // Text field ka border style set karein (optional)
//            textField2.borderStyle = .roundedRect
//
//            // Text field ke keyboard type set karein (optional)
//            textField2.keyboardType = .default
//        // Keyboard type ko number pad mein set karein
//              textField2.keyboardType = .numberPad
//
//            // Text field ko view mein add karein
//            self.view.addSubview(textField2)
//
//        //3 Text field ka frame set karein
//            let textField3 = UITextField(frame: CGRect(x: 300, y: 510, width: 100, height: 40))
//
//            // Placeholder text set karein
//            textField3.placeholder = " "
//        textField3.keyboardType = .default
//
//            // Text field ka border style set karein (optional)
//            textField3.borderStyle = .roundedRect
//
//            // Text field ke keyboard type set karein (optional)
//            textField3.keyboardType = .default
//        // Keyboard type ko number pad mein set karein
//              textField3.keyboardType = .numberPad
//
//            // Text field ko view mein add karein
//            self.view.addSubview(textField3)
//
//        //4 Text field ka frame set karein
//            let textField4 = UITextField(frame: CGRect(x: 300, y: 650, width: 100, height: 40))
//
//            // Placeholder text set karein
//            textField4.placeholder = " "
//        textField4.keyboardType = .default
//
//            // Text field ka border style set karein (optional)
//            textField4.borderStyle = .roundedRect
//
//            // Text field ke keyboard type set karein (optional)
//            textField4.keyboardType = .default
//        // Keyboard type ko number pad mein set karein
//              textField4.keyboardType = .numberPad
//
//            // Text field ko view mein add karein
//            self.view.addSubview(textField4)
        
    }
    @objc func HomeButtonTapped() {
        print("")
        let Start = storyboard?.instantiateViewController(identifier: "FirstViewController") as!  FirstViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
    }
//    @objc func BackButtonTapped() {
//        print("")
//        let Start = storyboard?.instantiateViewController(identifier: "CustomizeViewController") as!  CustomizeViewController
//        Start.modalPresentationStyle = .fullScreen
//               present(Start, animated: true)
//    }
    @IBAction func btnhome(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "FirstViewController") as! FirstViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
    }
    
    @IBAction func btncustomize(_ sender: Any) {
        let Start = storyboard?.instantiateViewController(identifier: "CustomizeViewController") as! CustomizeViewController
        Start.modalPresentationStyle = .fullScreen
               present(Start, animated: true)
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
