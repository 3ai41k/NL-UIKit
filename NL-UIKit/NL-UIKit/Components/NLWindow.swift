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
        guard
            let touches = event.allTouches,
            let touch = touches.first,
            let responder = nlHitTest(touch.location(in: self), with: event)
        else {
            return
        }
        
        switch touch.phase {
        case .began:
            responder.touchesBegan(touches, with: event)
        case .moved:
            responder.touchesMoved(touches, with: event)
        case .ended:
            if responder.gestures.isEmpty {
                responder.touchesEnded(touches, with: event)
            } else {
                responder.gestures.forEach({
                    $0.touchesEnded(touches, with: event)
                })
            }
        case .cancelled:
            responder.touchesCancelled(touches, with: event)
        default:
            return
        }
    }
    
    // MARK: - Private methods
    
    private func nlHitTest(_ point: CGPoint, with event: UIEvent?) -> NLView? {
        guard let subviews = vc?.view.subviews else { return nil }
        
        for subview in subviews {
            if subview.frame.contains(point) {
                let nextPoint = subview.layer.convert(point, from: layer)
                return subview.hitTest(nextPoint, with: event)
            }
        }
        return nil
    }
    
    // MARK: - Public methods
    
    func setNLViewController(_ vc: NLViewController) {
        self.vc = vc
        
        layer.addSublayer(vc.view.layer)
        
        vc.viewDidLoad()
    }
    
    override func becomeKey() {
        super.becomeKey()
        
        vc?.viewWillAppear()
    }
    
    override func makeKeyAndVisible() {
        super.makeKeyAndVisible()
        
        vc?.viewDidAppear()
    }
    
}
