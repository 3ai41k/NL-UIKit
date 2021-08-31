//
//  NLWindow.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

class NLWindow: NLView {
    
    // MARK: - Public properties
    
    var rootViewController: NLViewController?
    
    // MARK: - Private properties
    
    private let window: UIWindow
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
        
        super.init(frame: CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    // MARK: - Public methods
    
    func makeKeyAndVisible() {
        guard let rootVC = rootViewController else { return }
        
        window.layer.addSublayer(rootVC.view.layer)
    }
    
}
