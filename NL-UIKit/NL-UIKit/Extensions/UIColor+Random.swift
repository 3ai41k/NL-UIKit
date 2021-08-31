//
//  UIColor+Random.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

extension UIColor {
    
    static func randomColor() -> UIColor {
        let random = { CGFloat(arc4random_uniform(255)) / 255.0 }
        
        return UIColor(red: random(), green: random(), blue: random(), alpha: 1)
    }
    
}
 
