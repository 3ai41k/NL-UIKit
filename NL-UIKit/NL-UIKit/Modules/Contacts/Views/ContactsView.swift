//
//  ContactsView.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

final class ContactsView: NLView {
    
    // MARK: - Private properties
    
    private let screenBounds = UIScreen.main.bounds
    
    // MARK: - Init
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = .orange
    }
    
    // MARK: - Public methods
    
    func update(with models: [String]) {
        let frame = CGRect(x: .zero, y: safeArea.top, width: screenBounds.width, height: screenBounds.width - safeArea.bottom)
        let containerView = NLView(frame: frame)
        
        addSubview(containerView)
        
        models.enumerated().forEach({ (index, value) in
            let frame = CGRect(x: .zero, y: CGFloat(index) * Constants.height, width: screenBounds.width, height: Constants.height)
            
            let view = NLView(frame: frame)
            view.backgroundColor = UIColor.randomColor()
            
            let label = NLLabel(frame: CGRect(x: 16.0, y: 16.0, width: frame.width, height: frame.height))
            label.text = value
            label.textColor = .black
            label.font = .systemFont(ofSize: 17.0)
            
            view.addSubview(label)
            
            containerView.addSubview(view)
        })
    }
    
}

// MARK: - Constants

extension ContactsView {
    
    private enum Constants {
        static let height: CGFloat = 80.0
    }
    
}
