//
//  ViewController.swift
//  GGBLProj
//
//  Created by Drew Scheffer on 5/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    let navManager = NavManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navManager.loadVerticies()
        let path: [Int] = navManager.RunAStar()
        print(path)
    }
    
    
    
    


}

