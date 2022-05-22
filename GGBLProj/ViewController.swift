//
//  ViewController.swift
//  GGBLProj
//
//  Created by Drew Scheffer on 5/21/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let navManager = NavManager()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = 10.0
        
        var begin_image = imageView.image!
        var end_image = drawOnImage(begin_image)
        print("Here")
        imageView.image = end_image
        navManager.loadVerticies()
        let path: [Int] = navManager.RunAStar()
        print(path)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    
    func drawOnImage(_ image: UIImage) -> UIImage? {
         
         // Create a context of the starting image size and set it as the current one
         UIGraphicsBeginImageContext(image.size)
         
         // Draw the starting image in the current context as background
         image.draw(at: CGPoint.zero)

         // Get the current context
         let context = UIGraphicsGetCurrentContext()!

         // Draw a red line
        context.setLineWidth(10.0)
         context.setStrokeColor(UIColor.red.cgColor)
         context.move(to: CGPoint(x: 1100, y: 1808))
         context.addLine(to: CGPoint(x: 1702, y: 1808))
         context.strokePath()
         
         // Draw a transparent green Circle
         context.setStrokeColor(UIColor.green.cgColor)
         context.setAlpha(1)
         context.setLineWidth(10.0)
         context.addEllipse(in: CGRect(x: 100, y: 100, width: 100, height: 100))
         context.drawPath(using: .stroke) // or .fillStroke if need filling
         
         // Save the context as a new UIImage
         let myImage = UIGraphicsGetImageFromCurrentImageContext()
         UIGraphicsEndImageContext()
         
         // Return modified image
         return myImage
    }
}

