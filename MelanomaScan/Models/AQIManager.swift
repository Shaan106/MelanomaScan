 //
 //  AQIManager.swift
 //  MelanomaScan
 //
 //  Created by Aasmaan Yadav on 09/12/21.
 //
 
 import Foundation
 
 struct AQI_Root_Layer0: Codable {
     var data: AQI_Result_Layer1
 }
 
 struct AQI_Result_Layer1: Codable {
     var aqi: Int
 }
 
 class AQIManager {
 
 //    let headers = [
 //        "x-access-token": "5dc7e2dde16e30b5ad087bc0fe9577cd"
 //    ]
 
     //function to do a test request from the openUV api
     func testRequest(callback: @escaping (Int) -> ()) {
         //defining what the request is
         let request = NSMutableURLRequest(url: NSURL(string: "http://api.waqi.info/feed/shanghai/?token=demo")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
 
         request.httpMethod = "GET"
         //request.allHTTPHeaderFields = headers
 
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
 
             var result: AQI_Root_Layer0?
             //decoding the JSON returned
             do {
                 let decoder = JSONDecoder()
                 decoder.dateDecodingStrategy = .iso8601
                 result = try decoder.decode(AQI_Root_Layer0.self, from: data)
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
                 callback(json.data.aqi)
             }
         })
         dataTask.resume()
     }
 
 }
 
