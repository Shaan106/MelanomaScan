//
//  RiskFactorDetailTESTVIEW.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 12/11/21.
//

import SwiftUI

struct RiskFactorDetail: View {
    
    let riskFactor: RiskFactors
    @State var riskFactorName: String = ""
    let coreDM: CoreDataManager
    @Binding var needsRefresh:Bool
    
    var body: some View {
        VStack {
            
            Text(riskFactor.value ?? "")
            
            TextField(riskFactor.value ?? "", text: $riskFactorName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Update") {
                if !riskFactorName.isEmpty {
                    riskFactor.value = riskFactorName
                    coreDM.updateRiskFactor()
                    needsRefresh.toggle()
                }
            }.padding()
            
            Text("ADD MORE INFO ABOUT RISK FACTOR")
                .padding()
            
        }.navigationBarTitle(riskFactor.name ?? "")
    }
}

struct RiskFactorDetailTESTVIEW_Previews: PreviewProvider {
    static var previews: some View {
        let riskFactor = RiskFactors()
        RiskFactorDetail(riskFactor: riskFactor, coreDM: CoreDataManager(), needsRefresh: .constant(false))
    }
}
