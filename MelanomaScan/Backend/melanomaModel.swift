//
//  melanomaModel.swift
//  MelanomaScan
//
//  Created by Yadav, Aasmaan (SPH) on 30/09/2021.
//

import Foundation

import Vision
import CoreML


let model = try VNCoreMLModel(for: melanomaModel1_91_().model)
let request = VNCoreMLRequest(model: model, completionHandler: myResultsMethod)
let handler = VNImageRequestHandler(url: URL(fileURLWithPath: "ISIC_1135213.jpg"))
handler.perform([request])

func myResultsMethod(request: VNRequest, error: Error?) {
    guard let results = request.results as? [VNClassificationObservation]
        else { fatalError("huh") }
    for classification in results {
        print(classification.identifier, // the scene label
              classification.confidence)
    }
}
