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
    
    private lazy var networkManager = NetworkManager()
    private var data: Model?
    
    private let url = URL(string: "https://suppliers-api.wildberries.ru/api/v2/stocks?skip=0&take=1000")
    
    private let APIKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NJRCI6ImQxNGJhYTMxLTNiMTAtNGRjNi1hNjA0LTY0OWI1NTBhNGUzMiJ9.t6hQvvWXzxGiSRRSnJN2nNBSXe6I_IbSj42aiza5r8w"
    
    private let headerName = "Authorization"
    
    func fetchData(completion: @escaping () -> Void) {
        guard let request = makeRequest() else {
            print("error request making")
            return
        }
        networkManager.fetchData(withRequest: request) { model in
            print("success")
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
        
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue(APIKey, forHTTPHeaderField: headerName)
        return request
    }
}
