//
//  HttpUtility.swift
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 12/07/22.
//

import Foundation

struct HttpUtility {
    
    func getApiData<T:Decodable>(requestURL:URL, resultType:T.Type, completionHandler:@escaping(_ result:T?) -> Void) {
        
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = "get"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue(Constants.kAPIKey, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            if (error == nil && data != nil && data?.count != 0) {
                
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(T.self, from: data!)
                    _=completionHandler(result)
                } catch let error {
                    print(String(describing: error))
                    debugPrint("Error occured while decoding\(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    
    func postApiData<T:Decodable>(requestURL:URL, requestBody:Data, resultType:T.Type, completionHandler:@escaping(_ result:T?)-> Void) {
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { (data,urlResponse,error) in
            if (error == nil && data != nil && data?.count != 0) {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(result)
                } catch let error {
                    debugPrint("Error occurs while decoding \(error)")
                }
            }
        }.resume()
    }
}
