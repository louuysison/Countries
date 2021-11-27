//
//  ContentView.swift
//  Countries
//
//  Created by Lou Allen Uy Sison on 11/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: CountryViewModel
    
    @State private var selectedCountry = ""
    
    var body: some View {

        VStack {
            if(viewModel.countries.countries.count > 0) {
                NavigationView {
                    VStack {
                        Form {
                            Section {
                                Picker("Country", selection: $selectedCountry) {
                                    ForEach(viewModel.countries.countries) { country in
                                        Text(country.name)
                                    }
                                }
                            }
                            
                            if(selectedCountry.count != 0) {
                                let selected = viewModel.countries.countries.first(where: { $0.alpha2Code == selectedCountry })!
                                
                                CountryDetailSection(selected: selected)
                                
                                LanguageSection(languages: selected.languages)
                                
                                CurrencySection(currencies: selected.currencies)
                            }
                            
                        }
                        .navigationTitle("Select a country")
                    }
                }
            } else {
                ProgressView()
            }
        }.onAppear(perform: viewModel.refresh)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CountryViewModel(countryService: CountryService()))
    }
}

struct BackgroundView: View {
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.gray, .white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct CountryDetailSection: View {
    
    var selected: Country
    
    var body: some View {
        Section(header: Text("Country details")) {
            HStack {
                Text("Native Name")
                Spacer()
                Text(selected.nativeName)
            }
            HStack {
                Text("Alpha 2 Code")
                Spacer()
                Text(selected.alpha2Code)
            }
            HStack {
                Text("Calling Code")
                Spacer()
                Text(selected.callingCodes.first!)
            }
            HStack {
                Text("Capital")
                Spacer()
                Text(selected.capital)
            }
            HStack {
                Text("Region")
                Spacer()
                Text(selected.region)
            }
            HStack {
                Text("Population")
                Spacer()
                Text("\(selected.population)")
            }
            HStack {
                Text("Top Level Domain")
                Spacer()
                Text(selected.topLevelDomain.first!)
            }
        }
    }
}

struct LanguageSection: View {
    
    var languages: [Language]
    
    var body: some View {
        Section(header: Text("Languages")) {
            ForEach(languages) { language in
                HStack {
                    Text(language.name)
                    Spacer()
                    Text(language.nativeName!)
                        .foregroundColor(.gray)
                }
                
            }
        }
    }
}

struct CurrencySection: View {
    
    var currencies: [Currency]
    
    var body: some View {
        Section(header: Text("Currencies")) {
            ForEach(currencies) { currency in
                HStack {
                    Text(currency.name)
                    Spacer()
                    Text(currency.symbol)
                }
                
            }
        }
    }
}
