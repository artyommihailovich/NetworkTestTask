//
//  NetworkDataFetcher.swift
//  Network
//
//  Created by Artyom Mihailovich on 1/25/21.
//

import Foundation

protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping(T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    private var networking: Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type, from: data)
            return objects
        } catch let errorJSON {
            print("DEBUGGER: - Failed to decode.", errorJSON)
            return nil
        }
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping(T?) -> Void) {
        networking .request(urlString: urlString) { (data, error) in
            if let error = error {
                print("DEBUGGER: - Error request data, \(error.localizedDescription)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
    }
}
