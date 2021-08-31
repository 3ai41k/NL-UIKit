//
//  NLWindow.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

class NLWindow: UIWindow {
    
    // MARK: - Private properties
    
    private var vc: NLViewController?
    
    // MARK: - Override
    
    override func sendEvent(_ event: UIEvent) {
        guard let touches = event.allTouches, let touch = touches.first else { return }
        
        let responder = nlHitTest(touch.location(in: self), with: event) ?? self
        
        switch touch.phase {
        case .began:
            responder.touchesBegan(touches, with: event)
        case .moved:
            responder.touchesMoved(touches, with: event)
        case .ended:
            responder.touchesEnded(touches, with: event)
        case .cancelled:
            responder.touchesCancelled(touches, with: event)
        default:
            return
        }
    }
    
    // MARK: - Private methods
    
    private func nlHitTest(_ point: CGPoint, with event: UIEvent?) -> NLView? {
        for subview in vc?.view.subviews ?? [] {
            if subview.frame.contains(point) {
                let nextPoint = subview.layer.convert(point, to: layer)
                return subview.hitTest(nextPoint, with: event)
            }
        }
        return nil
    }
    
    // MARK: - Public methods
    
    func setNLViewController(_ vc: NLViewController) {
        self.vc = vc
        
        layer.addSublayer(vc.view.layer)
    }
    
}
