//
//  NetworkManager.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 21.11.2022.
//

import Foundation

enum Error: Swift.Error {
    case requestError
}

class NetworkManager {
    
    func fetchData<T: Decodable>(withRequest request: URLRequest,
                   completion: @escaping (T?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }

            let jsonData = self?.decodeJSON(type: T.self, data: data)
            completion(jsonData)
        }
        task.resume()
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        
        guard let data = data else {
            print("data nil")
            return nil
        }
        
        do {
            let jsonData = try JSONDecoder().decode(type.self, from: data)
            return jsonData
        } catch {
            print("json decoding error")
            print(error.localizedDescription)
            return nil
        }
    }
}
