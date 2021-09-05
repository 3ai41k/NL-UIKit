//
//  ContactsViewController.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

struct ContactsDependencies {
    let httpRequestExecutor: HTTPRequestExecutorProtocol
}

final class ContactsViewController: NLViewController {
    
    // MARK: - Public properties
    
    var dependencies: ContactsDependencies?
    
    // MARK: - Private properties
    
    // Data
    private var contacts: [Contact] = []
    
    // Views
    private var mainView: ContactsView? {
        view as? ContactsView
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        let view = ContactsView()
        view.delegate = self
        view.frame = CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        fetchData()
    }
    
    // MARK: - Private methods
    
    private func fetchData() {
        let request = GetContactsRequest { (contacts) in
            self.contacts = contacts
            
            self.mainView?.update(with: contacts)
        }
        dependencies?.httpRequestExecutor.perform(request)
    }
    
}

// MARK: - ContactsViewDelegate

extension ContactsViewController: ContactsViewDelegate {
    
    func didSelectInfo(for index: Int) {
        // TO DO: - Navigate somewhere
        
        print(contacts[index])
    }
    
}
