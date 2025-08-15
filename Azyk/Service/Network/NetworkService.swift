//
//  File.swift
//  
//
//  Created by Шермат Эшеров on 12/8/25.
//

import Foundation

public final class NetworkService<Endpoint: EndpointProtocol> {
    
    // MARK: - Request
    public func request<Response>(endpoint: Endpoint, completion: @escaping (NetworkResult<Response>) -> Void) where Response: Decodable {
        
        let url = URLComponents(string: endpoint.baseUrl + endpoint.path)
        guard let resultURL = url?.url else { return }
        let request = URLRequest(url: resultURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            let result: NetworkResult<Response>
            
            guard response != nil else {
                result = NetworkResult.failure(error?.localizedDescription ?? "nil")
                return
            }
            
            guard let data = data else {
                return
            }
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            do {
                let object = try JSONDecoder().decode(Response.self, from: data)
                result = NetworkResult.success(object)
            } catch let error {
                NSLog("CheckError \(error)")
                result = NetworkResult.failure(error.localizedDescription)
            }
        }
        .resume()
    }
    
}
