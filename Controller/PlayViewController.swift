//
//  PlayViewController.swift
//  FlyKillerGame
//
//  Created by Naeem Abbas on 09/01/2024.
//

import UIKit
 

import SwiftUI
class PlayViewController: UIViewController {
    
    
  
    var timer: Timer?

    struct ContentView: View {
        @State private var offsetY: CGFloat = 0
        let scrollSpeed: CGFloat = 1 // Adjust scrolling speed
        
        var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<20) { index in
                        Text("Item \(index)")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                    }
                }
                .padding()
                .offset(y: offsetY)
                .onAppear {
                    startAutoScroll()
                }
            }
        }
        
        func startAutoScroll() {
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                offsetY += scrollSpeed
            }
        }
    }
  /*  struct DraggableView:View{
        
        @State private var isDragging:Bool = false
        @State private var location:CGPoint
        
        private let fly:String
        
        init(location:CGPoint,fly:String){
            self.location = location
            self.fly = fly
        }
        
        var dragGesture: some Gesture{
            DragGesture()
                .onChanged { value in
                    self.location = value.location
                    self.isDragging = true
                }
            
                .onEnded { _ in
                    self.isDragging = false
                }
        }
        
        var body: some View{
            Image(systemName: fly)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .foregroundColor(isDragging ? .blue : .black)
                .position(location)
                .gesture(dragGesture)
        }
    }
    
    

   
    
    var fly1 : UIImageView!

     
    struct fly: View {
        @State private var offsetX: CGFloat = 0
        let screenSize = UIScreen.main.bounds.size
        
        var body: some View {
        Image("fly")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: offsetX)
                .onAppear {
                    fly()
                }
        }
        
        func fly() {
            withAnimation(Animation.linear(duration: 5.0).repeatForever()) {
                offsetX = screenSize.width - 100 // Adjust 100 to the width of your image
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            fly()
        }
    }
    */
   
    @IBOutlet weak var fly: UIImageView!
    @IBOutlet weak var flytopconstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
       
              // Call the moveImage function to start moving the image
              
          }
          
        // Do any additional setup after loading the view.
    
          
       

        // Do any additional setup after loading the view.
    
          
    @IBAction func backbtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
