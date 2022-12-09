//
//  RequestManager.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 29.11.2022.
//

import Foundation

enum HTTPMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum APIMethod: String {
    
    case stocks = "/api/v2/stocks" //список товаров с отстатками
    case orders = "/api/v2/orders" //список заказов
}

enum RequestParams: String {
    
    case take, skip, date_start, date_end, id, search
}

class RequestManager {
    
    // MARK: - Properties
    
    private lazy var networkManager = NetworkManager()
    
    private let APIKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NJRCI6ImQxNGJhYTMxLTNiMTAtNGRjNi1hNjA0LTY0OWI1NTBhNGUzMiJ9.t6hQvvWXzxGiSRRSnJN2nNBSXe6I_IbSj42aiza5r8w"
    
    private let headerName = "Authorization"
    
    // MARK: - Fetching data
    
    func fetchOrdersData<T: Decodable>(startDate: String, endDate: String, completion: @escaping (T?) -> Void) {
        
        let queryItems = [
            URLQueryItem(name: RequestParams.date_start.rawValue,
                         value: startDate),
            URLQueryItem(name: RequestParams.date_end.rawValue,
                         value: endDate),
            URLQueryItem(name: RequestParams.take.rawValue,
                         value: String(1000)),
            URLQueryItem(name: RequestParams.skip.rawValue,
                         value: String(0))
        ]
        
        guard let request = makeRequest(withAPIMethod: .orders, queryItems: queryItems)
        else {
            print("error request making")
            return
        }
        networkManager.fetchData(withRequest: request) { result in
            
            completion(result)
        }
    }
    
    func fetchStocksData<T: Decodable>(completion: @escaping (T?) -> Void) {
        
        let queryItems = [
            URLQueryItem(name: RequestParams.take.rawValue,
                         value: "1000"),
            URLQueryItem(name: RequestParams.skip.rawValue,
                         value: "0")
        ]
        
        guard let request = makeRequest(withAPIMethod: .stocks, queryItems: queryItems)
        else {
            print("error request making")
            return
        }
        networkManager.fetchData(withRequest: request) { result in
            
            completion(result)
        }
    }

    // MARK: - Support functions
    
    private func makeRequest(withAPIMethod apiMethod: APIMethod, queryItems: [URLQueryItem]) -> URLRequest? {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "suppliers-api.wildberries.ru"
        components.path = apiMethod.rawValue
        components.queryItems = queryItems
        
        guard let string = components.string,
              let url = URL(string: string) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue(APIKey, forHTTPHeaderField: headerName)
        
        return request
    }
}
