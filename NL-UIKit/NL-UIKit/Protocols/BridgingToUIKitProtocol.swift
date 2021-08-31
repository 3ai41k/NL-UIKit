//
//  BridgingToUIKitProtocol.swift
//  NL-UIKit
//
//  Created by Nikita Lizogubov on 31/08/2021.
//

import Foundation

protocol BridgingToUIKitProtocol {
    associatedtype ConvertType
    
    func convert() -> ConvertType
}
