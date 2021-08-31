//
//  NLImageView.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

class NLImageView: NLView {
    
    // MARK: - Public properties
    
    var image: UIImage? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        layer.delegate = self
        layer.masksToBounds = true
    }
    
}

extension NLImageView {
    
    func display(_ layer: CALayer) {
        layer.contents = image?.cgImage
    }
    
}
