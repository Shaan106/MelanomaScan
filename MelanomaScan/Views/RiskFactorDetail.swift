//
//  RiskFactorDetailTESTVIEW.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 12/11/21.
//

import SwiftUI

struct RiskFactorDetail: View {
    
    let riskFactor: RiskFactors
    let coreDM: CoreDataManager
    let riskFactorsModel = RiskFactorsModel()
    @Binding var needsRefresh: Bool
    @State var whichPickerToShow: String
    //@State var riskFactorName: String = ""
    //let tempPickerList = ["hi", "bye", "bycycle", "bicycle", "bike"]
    let tempPickerList: [String]
    @State var selectedValue = ""
    
    var body: some View {
        VStack {
            
            Text( (riskFactor.value ?? "") + " | Dev Value: " + String(riskFactor.numericalRiskValue))
            
//            TextField(riskFactor.value ?? "", text: $riskFactorName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()

            Picker("Please choose a color", selection: $selectedValue) {
                            ForEach(tempPickerList, id: \.self) {
                                Text($0)
                            }
                }.padding()
            
            Text("You selected: \(selectedValue)")
                .padding()
            
            
            Button("Update") {
                if !selectedValue.isEmpty {
                    riskFactor.value = selectedValue
                    riskFactor.numericalRiskValue = riskFactorsModel.returnNumericalRiskValue(pickerName: whichPickerToShow, pickerChoice: selectedValue)
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
        RiskFactorDetail(riskFactor: riskFactor, coreDM: CoreDataManager(), needsRefresh: .constant(false), whichPickerToShow: "Skin Type", tempPickerList: ["hi", "bye", "bycycle", "bicycle", "bike"])
    }
}
