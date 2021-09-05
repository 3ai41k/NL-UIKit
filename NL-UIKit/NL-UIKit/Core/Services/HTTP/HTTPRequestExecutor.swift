//
//  HTTPRequestExecutor.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 05/09/2021.
//

import Foundation

protocol HTTPRequestProtocol {
    func onSuccess(_ response: [String: Any])
    func onFailure(_ response: [String: Any])
}

protocol HTTPRequestExecutorProtocol {
    func perform(_ request: HTTPRequestProtocol)
}

final class HTTPRequestExecutor: HTTPRequestExecutorProtocol {
    
    func perform(_ request: HTTPRequestProtocol) {
        request.onSuccess([:])
    }
    
}
