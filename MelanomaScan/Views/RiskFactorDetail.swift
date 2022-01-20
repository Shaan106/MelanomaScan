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
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                //Text( (riskFactor.value ?? "") + " | Dev Value: " + String(riskFactor.numericalRiskValue))
                Text( riskFactor.value ?? "")
                
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
                }.buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                .padding()
                
                //link to risk factors in cancer research uk website.
                Link("More Info", destination: URL(string: riskFactorsModel.returnMoreInfoURL(name: riskFactor.name ?? "https://www.cancerresearchuk.org/health-professional/cancer-statistics/statistics-by-cancer-type/melanoma-skin-cancer/risk-factors"))!).buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                    .padding()
            }.navigationBarTitle(riskFactor.name ?? "")
            
        }
    }
}

struct RiskFactorDetailTESTVIEW_Previews: PreviewProvider {
    static var previews: some View {
        let riskFactor = RiskFactors()
        RiskFactorDetail(riskFactor: riskFactor, coreDM: CoreDataManager(), needsRefresh: .constant(false), whichPickerToShow: "Skin Type", tempPickerList: ["hi", "bye", "bycycle", "bicycle", "bike"])
    }
}
