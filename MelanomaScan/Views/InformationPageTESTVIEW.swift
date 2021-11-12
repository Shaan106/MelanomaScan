//
//  InformationPage.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

import SwiftUI

struct InformationPageTESTVIEW: View {
    
    let coreDM: CoreDataManager
    @State private var riskFactorName: String = "" //convert to Int16 later
    //use a viewmodel for the variable below again.
    //state is used to make sure user interface is in sync with the data.
    @State private var riskFactorNames: [RiskFactors] = [RiskFactors]()
    @State private var needsRefresh: Bool = false
    
    //again into a VM model
    private func populateNames() {
        riskFactorNames = coreDM.getAllNames()
    }
    
    var body: some View {
        VStack {
            //input risk factors and save using the save button
            TextField("Enter name", text: $riskFactorName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save") {
                //create a view model layer, and call this from that class -NOT THE UI
                coreDM.saveRiskFactorValue(stringValue: riskFactorName)
                populateNames()
            }
            
            //displays names in a way that they can be deleted
            List {
                ForEach(riskFactorNames, id: \.self) { name in
                    NavigationLink(destination: RiskFactorDetail(riskFactor: name, coreDM: coreDM, needsRefresh: $needsRefresh), label: {
                        Text(name.value ?? "")
                    })
                    
                }.onDelete(perform: {indexSet in
                    indexSet.forEach{ index in
                        let name = riskFactorNames[index]
                        //delete the name using core data manager
                        coreDM.deleteRiskFactor(riskFactor: name)
                        populateNames()
                    }
                })
                
            //This is just to make sure that everything stays up to date.
            }.listStyle(PlainListStyle())
            .accentColor(needsRefresh ? .black: .white)
            
            
        }.padding()
        .navigationBarTitle("Information Page")
        
        .onAppear(perform: {
            populateNames()
        })
        
    }
}

struct InformationPageTESTVIEW_Previews: PreviewProvider {
    static var previews: some View {
        InformationPageTESTVIEW(coreDM: CoreDataManager())
    }
}
