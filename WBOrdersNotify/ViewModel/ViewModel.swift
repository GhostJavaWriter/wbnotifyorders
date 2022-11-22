//
//  ViewModel.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 21.11.2022.
//

import Foundation

enum HTTPMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

class ViewModel {
    
    // MARK: - Properties
    
    private lazy var networkManager = NetworkManager()
    private var data: Model?
    
    private let url = URL(string: "https://suppliers-api.wildberries.ru/api/v2/stocks?")
    
    private let APIKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NJRCI6ImQxNGJhYTMxLTNiMTAtNGRjNi1hNjA0LTY0OWI1NTBhNGUzMiJ9.t6hQvvWXzxGiSRRSnJN2nNBSXe6I_IbSj42aiza5r8w"
    
    private let headerName = "Authorization"
    
    // MARK: - Public methods
    
    func fetchData(completion: @escaping () -> Void) {
        guard let request = makeRequest() else {
            print("error request making")
            return
        }
        networkManager.fetchData(withRequest: request) { model in
            
            self.data = model
            completion()
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return data?.stocks.count ?? 0
    }
    
    func getCellConfiguration(forIndexPath indexPath: IndexPath) -> String {
        guard let item = data?.stocks[indexPath.row] else { return "error" }
        return "\(item.name): \(item.stock)"
    }
    
    func getTitle() -> String {
        return data?.stocks[0].brand ?? "Default title"
    }
    
    // MARK: - Support functions
    
    private func makeRequest()-> URLRequest? {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "suppliers-api.wildberries.ru"
        components.path = "/api/v2/stocks"

        components.queryItems = [
            URLQueryItem(name: "take", value: "1000"),
            URLQueryItem(name: "skip", value: "0")
        ]
        
        guard let string = components.string,
              let url = URL(string: string) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue(APIKey, forHTTPHeaderField: headerName)
        
        return request
    }
}
