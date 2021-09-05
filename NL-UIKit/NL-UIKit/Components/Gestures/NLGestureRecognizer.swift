//
//  NLGestureRecognizer.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 05/09/2021.
//

import UIKit

class NLGestureRecognizer {
    
    // MARK: - Private properties
    
    private let target: (target: Any, action: Selector)
    
    // MARK: - Init
    
    init(target: Any, action: Selector) {
        self.target = (target, action)
    }
    
    // MARK: - Public methods
    
    func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIApplication.shared.sendAction(target.action, to: target.target, from: self, for: event)
    }
    
}
