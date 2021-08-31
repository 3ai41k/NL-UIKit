//
//  NLView.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

class NLView {
    
    // MARK: - Public properties
    
    var backgroundColor: UIColor? {
        get {
            guard let cgColor = layer.backgroundColor else { return  nil}
            
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.backgroundColor = newValue?.cgColor
        }
    }
    
    var frame: CGRect {
        get {
            layer.frame
        }
        set {
            layer.frame = newValue
        }
    }
    
    // MARK: - Public stored properties
    
    var layer: CALayer
    
    // MARK: - Init
    
    init(frame: CGRect = .zero) {
        self.layer = CALayer()
        
        self.frame = frame
    }
    
}
