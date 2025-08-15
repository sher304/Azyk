//
//  File.swift
//  
//
//  Created by Шермат Эшеров on 12/8/25.
//

import Foundation

public enum CharactersEndpoint: EndpointProtocol {
    case getCharacter(id: String)
    case getCharacters(page: String?)

    public var path: String {
        switch self {
        case .getCharacters(let page):
            return API.characters + (page ?? "1")
            
        case .getCharacter(let id):
            return API.characterId + id
        }
    }
}
