//
//  ContactsViewController.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

final class ContactsViewController: NLViewController {
    
    // MARK: - Override
    
    override func loadView() {
        view = ContactsView()
        view.frame = CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    override func viewDidLoad() {
        
    }
    
    // MARK: - Private methods
    
    
    
}
