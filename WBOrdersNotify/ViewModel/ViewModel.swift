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
    
    func fetchBalance(completion: @escaping () -> Void) {
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
    
    func getGoodsBalance() -> Int {
        print("get goods")
        guard let result = data else {
            print("return 0")
            return 0
        }
        return result.stocks[0].stock
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
