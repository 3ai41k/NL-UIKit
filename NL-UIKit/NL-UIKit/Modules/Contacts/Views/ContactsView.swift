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
    
    func update(with models: [Contact]) {
        let frame = CGRect(x: .zero, y: safeArea.top, width: screenBounds.width, height: screenBounds.width - safeArea.bottom)
        let containerView = NLView(frame: frame)
        
        addSubview(containerView)
        
        models.enumerated().forEach({ (index, model) in
            let frame = CGRect(x: .zero, y: CGFloat(index) * Constants.height, width: screenBounds.width, height: Constants.height)
            
            let view = NLView(frame: frame)
            view.backgroundColor = UIColor.randomColor()
            
            let imageFrame = CGRect(x: 8.0, y: 16.0, width: 48.0, height: 48.0)
            let imageView = NLImageView(frame: imageFrame)
            imageView.image = UIImage(systemName: "person")
            imageView.layer.cornerRadius = 48.0 / 2.0
            imageView.backgroundColor = .red
            
            view.addSubview(imageView)
            
            let userNamelabelFrame = CGRect(x: 64.0, y: 16.0, width: frame.width - 64.0, height: frame.height - 16.0)
            let userNamelabel = NLLabel(frame: userNamelabelFrame)
            userNamelabel.text = model.userName
            userNamelabel.textColor = .black
            userNamelabel.font = .systemFont(ofSize: 24.0)
            
            view.addSubview(userNamelabel)
            
            let telephoneNameFrame = CGRect(x: 64.0, y: 48.0, width: frame.width - 64.0, height: frame.height - 48.0)
            let telephoneNameLabel = NLLabel(frame: telephoneNameFrame)
            telephoneNameLabel.text = model.telephoneName
            telephoneNameLabel.textColor = .black
            telephoneNameLabel.font = .systemFont(ofSize: 17.0)
            
            view.addSubview(telephoneNameLabel)
            
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
