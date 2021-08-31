//
//  ContactsView.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

final class ContactsView: NLView {
    
    // MARK: - Init
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = .orange
    }
    
}
