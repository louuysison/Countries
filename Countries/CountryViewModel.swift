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
        print("IN REFRESH")
        countryService.loadCountriesData { countries in
            DispatchQueue.main.async {
                print("IN ASYNC")
                self.countries = countries
            }
        }
    }
}
