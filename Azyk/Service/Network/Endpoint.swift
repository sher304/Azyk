//
//  File.swift
//  
//
//  Created by Шермат Эшеров on 12/8/25.
//

import Foundation

public protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }

}

extension EndpointProtocol {
    public var baseUrl: String {
        return "https://rickandmortyapi.com/api/"
    }
}
