//
//  RiskFactorDetailTESTVIEW.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 12/11/21.
//

import SwiftUI

struct RiskFactorDetailTESTVIEW: View {
    
    let riskFactor: RiskFactors
    @State var riskFactorName: String = ""
    let coreDM: CoreDataManager
    
    var body: some View {
        VStack {
            TextField(riskFactor.name ?? "", text: $riskFactorName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Update") {
                if !riskFactorName.isEmpty {
                    riskFactor.name = riskFactorName
                    coreDM.updateRiskFactor()
                }
            }.padding()
            
            Text("ADD MORE INFO ABOUT RISK FACTOR")
                .padding()
            
        }
    }
}

struct RiskFactorDetailTESTVIEW_Previews: PreviewProvider {
    static var previews: some View {
        let riskFactor = RiskFactors()
        RiskFactorDetailTESTVIEW(riskFactor: riskFactor, coreDM: CoreDataManager())
    }
}
