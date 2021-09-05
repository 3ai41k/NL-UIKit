//
//  ContactsView.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import UIKit

protocol ContactsViewDelegate: class {
    func didSelectInfo(for index: Int)
}

final class ContactsView: NLView {
    
    // MARK: - Public properties
    
    weak var delegate: ContactsViewDelegate?
    
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
        let containerFrame = CGRect(x: .zero, y: safeArea.top, width: screenBounds.width, height: screenBounds.width - safeArea.bottom)
        let containerView = NLView(frame: containerFrame)
        
        addSubview(containerView)
        
        models.enumerated().forEach({ (index, model) in
            let contentFrame = CGRect(x: .zero, y: CGFloat(index) * Constants.height, width: screenBounds.width, height: Constants.height)
            
            let contentView = NLView(frame: contentFrame)
            contentView.backgroundColor = UIColor.randomColor()
            
            let imageFrame = CGRect(x: 8.0, y: 16.0, width: 48.0, height: 48.0)
            let imageView = NLImageView(frame: imageFrame)
            imageView.image = UIImage(named: model.profileImageName)
            imageView.layer.cornerRadius = 48.0 / 2.0
            imageView.backgroundColor = .red

            contentView.addSubview(imageView)

            let userNamelabelFrame = CGRect(x: 64.0, y: 16.0, width: 64.0, height: contentFrame.height - 16.0)
            let userNamelabel = NLLabel(frame: userNamelabelFrame)
            userNamelabel.text = model.userName
            userNamelabel.textColor = .black
            userNamelabel.font = .systemFont(ofSize: 24.0)

            contentView.addSubview(userNamelabel)

            let telephoneNameFrame = CGRect(x: 64.0, y: 48.0, width: 64.0, height: contentFrame.height - 48.0)
            let telephoneNameLabel = NLLabel(frame: telephoneNameFrame)
            telephoneNameLabel.text = model.telephoneName
            telephoneNameLabel.textColor = .black
            telephoneNameLabel.font = .systemFont(ofSize: 17.0)

            contentView.addSubview(telephoneNameLabel)
            
            let infoFrame = CGRect(x: contentFrame.width - 80.0, y: 8.0, width: 64.0, height: 64.0)
            let infoButton = NLButton(frame: infoFrame)
            infoButton.tag = index
            infoButton.backgroundColor = .blue
            infoButton.addTarget(self, #selector(didInfo))

            contentView.addSubview(infoButton)
            
            containerView.addSubview(contentView)
        })
    }
    
    // MARK: - Actions
    
    @objc private func didInfo(_ sender: NLButton) {
        delegate?.didSelectInfo(for: sender.tag)
    }
    
}

// MARK: - Constants

extension ContactsView {
    
    private enum Constants {
        static let height: CGFloat = 80.0
    }
    
}
