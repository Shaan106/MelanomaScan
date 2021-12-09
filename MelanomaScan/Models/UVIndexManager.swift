//
//  UVIndexManager.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 04/12/21.
//

import Foundation


struct Root_Layer0: Codable {
    var result: Result_Layer1
}

struct Result_Layer1: Codable {
    var uv: Double
    var uv_max: Double
    var ozone: Double
}
// May also add sunrise and sunset times soon

class UVIndexManager {
    
    //using the openUV api, provinding an access token
    let headers = [
        "x-access-token": "5dc7e2dde16e30b5ad087bc0fe9577cd"
    ]
    
    //function to do a test request from the openUV api
    func testRequest(callback: @escaping (Double, Double, Double) -> ()) {
        //defining what the request is
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.openuv.io/api/v1/uv?lat=-33.34&lng=115.342&dt=2018-01-24T10%3A50%3A52.283Z")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            //checking if response actually contains data
            guard let data = data, error == nil else {
                if let printError = error {
                    print(printError)
                } else {
                    print("error in printError")
                }
                return
            }
            
            var result: Root_Layer0?
            //decoding the JSON returned
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                result = try decoder.decode(Root_Layer0.self, from: data)
            }
            catch {
                print("-----ERROR-----")
                print(error)
                print("-----ERROR-----")
            }
            guard let json = result else{
                return
            }
            //returning the decoded values stored in structs.
            DispatchQueue.main.async {
                callback(json.result.uv, json.result.uv_max, json.result.ozone)
            }
        })
        dataTask.resume()
    }
    
    //requests UV info for given location and current time. Works Async.
    func requestUVInfoForLocation(inputLatitude: Double, inputLongitude: Double, callback: @escaping (Double, Double, Double) -> ()) {
        
        //URL for request
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.openuv.io/api/v1/uv?lat=" + String(inputLatitude) + "&lng=" + String(inputLongitude))! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            //checking if response actually contains data
            guard let data = data, error == nil else {
                if let printError = error {
                    print(printError)
                } else {
                    print("error in printError")
                }
                return
            }
            
            var result: Root_Layer0?
            //decoding the JSON returned
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                result = try decoder.decode(Root_Layer0.self, from: data)
            }
            catch {
                print("-----ERROR-----")
                print(error)
                print("-----ERROR-----")
            }
            guard let json = result else{
                return
            }
            //returning the decoded values stored in structs, works async.
            DispatchQueue.main.async {
                callback(json.result.uv, json.result.uv_max, json.result.ozone)
            }
            
        })
        
        dataTask.resume()
    }
    
}
