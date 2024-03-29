//
//  InformationPage.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 12/11/21.
//

import SwiftUI

struct InformationPage: View {
    
    let coreDataManager: CoreDataManager
    @State private var riskFactorValue: String = "" //convert to other data types later
    @State private var needsRefresh: Bool = false
    @State private var riskFactorsList: [RiskFactors] = [RiskFactors]()
    @State private var showingResetRiskFactorsAlert = false
    
    let riskFactorsModel = RiskFactorsModel()
    let informationPageViewModel = InformationPageViewModel()
    let stringListOfRiskFactors = ["Age", "Gender", "Skin Type", "Eye Colour", "Hair Colour", "Number of Moles", "Freckles", "Family History", "Diseases and Conditions", "Body Mass Index"]
    
    //again into a VM model
    private func populateRiskFactors() {
        riskFactorsList = coreDataManager.getAllNames()
    }
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                //displays names in a way that they can be deleted
                List {
                    ForEach(riskFactorsList, id: \.self) { riskFactor in
                        NavigationLink(destination: RiskFactorDetail(riskFactor: riskFactor, coreDM: coreDataManager, needsRefresh: $needsRefresh, whichPickerToShow: riskFactor.name ?? "", tempPickerList: riskFactorsModel.returnStringListOfRiskFactors(name: (riskFactor.name ?? "") )), label: {
                            HStack {
                                Text(riskFactor.name ?? "")
                                Spacer()
                                Text(riskFactor.value ?? "")
                            }
                        })
                    }.listRowBackground(Color("Background").ignoresSafeArea())
                    //This is just to make sure that everything stays up to date.
                }
                //.background(Color("Background"))
                .listStyle(PlainListStyle())
                .accentColor(needsRefresh ? .black: .white)
                
                Button("Reset All") {
                    showingResetRiskFactorsAlert = true
                }.buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                    .padding()
                    .alert(isPresented: $showingResetRiskFactorsAlert) {
                        Alert(
                            title: Text("Are you sure you want to reset everything?"),
                            message: Text(""),
                            primaryButton: .destructive(Text("Reset")) {
                                riskFactorsModel.resetRiskFactors(coreDataManager: coreDataManager, listOfRiskFactors: stringListOfRiskFactors)
                                populateRiskFactors()
                            },
                            secondaryButton: .cancel()
                        )
                    }
                
                //text showing numerical risk factor value
                //Text( riskFactorsModel.calculateFinalRiskFactor(riskFactorsList: riskFactorsList) ).padding()
                informationPageViewModel.getRiskFactorColourCodedRectangles(riskFactorVal: Double(riskFactorsModel.calculateFinalRiskFactor(riskFactorsList: riskFactorsList)) ?? -1 )
                
                
                
            }.navigationBarTitle("Information Page")
                .background(Color("Background"))
                .onAppear(perform: {
                    populateRiskFactors()
                    UITableView.appearance().backgroundColor = .clear
                })
        }
    }
    
}

struct InformationPage_Previews: PreviewProvider {
    static var previews: some View {
        InformationPage(coreDataManager: CoreDataManager())
    }
}
