//
//  NLView.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

class NLView: UIResponder {
    
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
    
    var safeArea: UIEdgeInsets {
        UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
    }
    
    // MARK: - Public stored properties
    
    var layer: CALayer = CALayer()
    
    weak var superview: NLView?
    
    var subviews: [NLView] = []
    
    // MARK: - Init
    
    init(frame: CGRect = .zero) {
        super.init()
        
        self.frame = frame
        
        layer.delegate = self
        
        setNeedsDisplay()
    }
    
    // MARK: - Override
    
    override var next: UIResponder? {
        return superview
    }
    
    // MARK: - Public methods
    
    func draw(_ bounds: CGRect) {
        // Needs for subviews
    }
    
    func setNeedsDisplay() {
        layer.setNeedsDisplay()
    }
    
    func addSubview(_ view: NLView) {
        subviews.append(view)
        
        view.superview = self
        
        layer.addSublayer(view.layer)
    }
    
    func hitTest(_ point: CGPoint, with event: UIEvent?) -> NLView {
        for subview in subviews {
            if subview.frame.contains(point) {
                let nextPoint = subview.layer.convert(point, to: layer)
                return subview.hitTest(nextPoint, with: event)
            }
        }
        return self
    }
    
}

// MARK: - CALayerDelegate

extension NLView: CALayerDelegate {
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        let bounds = ctx.boundingBoxOfClipPath
        
        UIGraphicsPushContext(ctx)
        draw(bounds)
        UIGraphicsPopContext()
    }
    
}
