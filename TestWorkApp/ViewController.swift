//
//  ViewController.swift
//  TestWorkApp
//
//  Created by Oleksiy Pavlyuk on 29/09/2023.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {


        let size: CGFloat = 50
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))

        override func viewDidLoad() {
            super.viewDidLoad()

            // Set the background color of myView to system teal
            myView.backgroundColor = UIColor.systemTeal

            // Create a UIImage with your desired image
            let image = UIImage(named: "image3")
            // Set the myView's background image
            let imageView = UIImageView(image: image)
            imageView.frame = myView.bounds
            imageView.contentMode = .scaleAspectFit
            myView.addSubview(imageView)

            // Add myView to your view hierarchy
            view.addSubview(myView)

            // Define the circular path
            let radius: CGFloat = 160.0  // Adjust the radius as needed
            let centerPoint = CGPoint(x: view.bounds.midX, y: view.bounds.midY)

            var movementPoints: [CGPoint] = []

            let numPoints = 360  // You can adjust the number of points for smoother or faster motion

            for angle in 0..<numPoints {
                let radians = CGFloat(angle) * .pi / 180.0
                let x = centerPoint.x + radius * cos(radians)
                let y = centerPoint.y + radius * sin(radians)
                movementPoints.append(CGPoint(x: x, y: y))
            }

            // Define the animation
            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.duration = 10.0  // Adjust the duration for slower or faster rotation
            animation.autoreverses = false
            animation.repeatCount = .infinity

            // Set the animation path for the circular movement
            animation.values = movementPoints.map { NSValue(cgPoint: $0) }

            // Add the animation to myView's layer
            myView.layer.add(animation, forKey: "movementAnimation")
            
            
    }
}





