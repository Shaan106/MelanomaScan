//
//  InformationPage.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

//, needsRefresh: .constant(false) | , needsRefresh: $needsRefresh | @Binding var needsRefresh:Bool

import SwiftUI

struct InformationPageTESTVIEW: View {
    
    let coreDM: CoreDataManager
    @State private var riskFactorName: String = "" //convert to Int16 later
    //use a viewmodel for the variable below again.
    //state is used to make sure user interface is in sync with the data.
    @State private var riskFactorNames: [RiskFactors] = [RiskFactors]()
    
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
                coreDM.saveRiskFactorName(name: riskFactorName)
                populateNames()
            }
            
            //displays names in a way that they can be deleted
            List {
                ForEach(riskFactorNames, id: \.self) { name in
                    //NavigationLink(destination: RiskFactorDetailTESTVIEW(riskFactor: name, coreDM: coreDM), label: Text(name.name ?? ""))
                    
                    NavigationLink(destination: RiskFactorDetailTESTVIEW(riskFactor: name, coreDM: coreDM), label: {
                        Text(name.name ?? "")
                    })
                    
                }.onDelete(perform: {indexSet in
                    indexSet.forEach{ index in
                        let name = riskFactorNames[index]
                        //delete the name using core data manager
                        coreDM.deleteName(riskFactor: name)
                        populateNames()
                    }
                })
            }
            
            
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
