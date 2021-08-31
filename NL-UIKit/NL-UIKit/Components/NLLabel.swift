//
//  NLLabel.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

class NLLabel: NLView {
    
    // MARK: - Public properties
    
    var text: String? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var textColor: UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var font: UIFont? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Override
    
    override func draw(_ bounds: CGRect) {
        (text as NSString?)?.draw(in: bounds, withAttributes: [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: textColor
        ])
    }
    
}
