//
//  NLWindow.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

class NLWindow: NLView {
    
    var rootViewController: NLViewController?
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        
        super.init(frame: CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    func makeKeyAndVisible() {
        guard let rootVC = rootViewController else { return }
        
        window.layer.addSublayer(rootVC.view.layer)
    }
    
}
