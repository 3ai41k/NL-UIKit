//
//  ContactsViewController.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

final class ContactsViewController: NLViewController {
    
    // MARK: - Public properties
    
    var mainView: ContactsView? {
        view as? ContactsView
    }
    
    // MARK: - Override
    
    override func loadView() {
        view = ContactsView()
        view.frame = CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    override func viewDidLoad() {
        mainView?.update(with: [
            Contact(userName: "Bob", telephoneName: "Home"),
            Contact(userName: "Tom", telephoneName: "Home"),
            Contact(userName: "Dick", telephoneName: "Home"),
            Contact(userName: "Nick", telephoneName: "Home")
        ])
    }
    
}
