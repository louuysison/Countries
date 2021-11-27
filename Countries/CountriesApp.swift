//
//  CountriesApp.swift
//  Countries
//
//  Created by Lou Allen Uy Sison on 11/27/21.
//

import SwiftUI

@main
struct CountriesApp: App {
    var body: some Scene {
        WindowGroup {
            let countryService = CountryService()
            let viewModel = CountryViewModel(countryService: countryService)
            ContentView(viewModel: viewModel)
        }
    }
}
