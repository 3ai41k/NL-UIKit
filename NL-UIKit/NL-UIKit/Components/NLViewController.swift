//
//  NLViewController.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

class NLViewController {
    
    // MARK: - Public properties
    
    var view: NLView! {
        didSet {
            isViewLoaded = true
        }
    }
    
    var isViewLoaded: Bool = false
    
    // MARK: - Init
    
    init() {
        loadView()
    }
    
    // MARK: - Public methods
    
    func loadView() {
        view = NLView(frame: CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    func viewDidAppear() {
        
    }
    
}
