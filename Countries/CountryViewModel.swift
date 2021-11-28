//
//  CountryViewModel.swift
//  Countries
//
//  Created by Lou Allen Uy Sison on 11/27/21.
//

import Foundation

public class CountryViewModel: ObservableObject {
    @Published var countries: Countries = Countries(response: [])
    
    public let countryService: CountryService
    
    public init(countryService: CountryService) {
        self.countryService = countryService
    }
    
    public func refresh() {
        countryService.loadCountriesData { countries in
            //use main async queue to avoid UI bottleneck
            DispatchQueue.main.async {
                self.countries = countries
            }
        }
    }
}
