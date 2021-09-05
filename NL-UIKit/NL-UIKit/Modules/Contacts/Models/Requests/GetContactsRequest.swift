//
//  GetContactsRequest.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 05/09/2021.
//

import Foundation

struct GetContactsRequest: HTTPRequestProtocol {
    
    let completionHandler: ([Contact]) -> Void
    
    func onSuccess(_ response: [String: Any]) {
        completionHandler(Contact.mock)
    }
    
    func onFailure(_ response: [String: Any]) {
        
    }
    
}
