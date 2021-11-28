//
//  CountryService.swift
//  Countries
//
//  Created by Lou Allen Uy Sison on 11/27/21.
//

import Foundation

public final class CountryService: NSObject {
    
    private var completionHandler: ((Countries) -> Void)?
    
    public override init() {
        super.init()
    }
    
    public func loadCountriesData(_ completionHandler: @escaping((Countries) -> Void)) {
        self.completionHandler = completionHandler
        //make API request
        makeDataRequest()
    }
    
    private func makeDataRequest() {
        // create urlString
        guard let urlString =
                "https://restcountries.com/v2/all?fields=name,nativeName,alpha2Code,alpha3Code,topLevelDomain,callingCodes,capital,region,continent,population,borders,currencies,languages"
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        // convert urlString to url
        guard let url = URL(string: urlString) else { return }
        // call API
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                print("\(error?.localizedDescription ?? "ERROR")")
                return
            }

            do {
                let decoded = try JSONDecoder().decode([Country].self, from: data)
                self.completionHandler?(Countries(response: decoded))
            } catch {
                print("Unexpected error: \(error).")
            }
        }.resume()
    }
}
