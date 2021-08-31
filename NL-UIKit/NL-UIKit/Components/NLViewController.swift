//
//  NLViewController.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

class NLViewController {
    
    var view: NLView! {
        didSet {
            viewDidLoad()
        }
    }
    
    init() {
        loadView()
    }
    
    func loadView() {
        view = NLView(frame: CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    func viewDidLoad() {
        
    }
    
}
