//
//  Contact.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import Foundation

struct Contact {
    let userName: String
    let telephoneName: String
    let profileImageName: String
}

extension Contact {
    
    static var mock: [Contact] {
        [
            Contact(userName: "Bob", telephoneName: "Home", profileImageName: "Bob"),
            Contact(userName: "Tom", telephoneName: "Home", profileImageName: "Tom"),
            Contact(userName: "Dick", telephoneName: "Home", profileImageName: "Empty"),
            Contact(userName: "Nick", telephoneName: "Home", profileImageName: "Empty")
        ]
    }
    
}
