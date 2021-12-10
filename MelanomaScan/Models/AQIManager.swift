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
    var city: String
    var current: AQI_Result_Layer2
}

struct AQI_Result_Layer2: Codable {
    var pollution: AQI_Result_Layer3
}

struct AQI_Result_Layer3: Codable {
    var aqius: Int
}

class AQIManager {

    let accessKey = "990d95b6-cdee-43c6-b66f-73ceee50d2da"

    //function to do a test request from the openUV api
    func testRequest(callback: @escaping (String, Int) -> ()) {
        //defining what the request is
        let request = NSMutableURLRequest(url: NSURL(string: "http://api.airvisual.com/v2/nearest_city?lat=51.5072&lon=0.1276&key=\(accessKey)")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

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
                callback(json.data.city, json.data.current.pollution.aqius)
            }
        })
        dataTask.resume()
    }

}

