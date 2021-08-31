//
//  NLButton.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

class NLButton: NLView {
    
    // MARK: - Private properties
    
    private var targets: [(target: Any, action: Selector)] = []
    
    // MARK: - Public methods
    
    func addTarget(_ target: Any, _ action: Selector) {
        targets.append((target, action))
    }
    
    // MARK: - Override
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        targets.forEach({
            UIApplication.shared.sendAction($0.action, to: $0.target, from: self, for: event)
        })
    }
    
}
