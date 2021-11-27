//
//  ContentView.swift
//  Countries
//
//  Created by Lou Allen Uy Sison on 11/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: CountryViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                if(viewModel.countries.countries.count > 0) {
                    ForEach(viewModel.countries.countries) { country in
                        Text(country.name)
                    }
                } else {
                    ProgressView()
                }
            }.onAppear(perform: viewModel.refresh)
        }
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
            .edgesIgnoringSafeArea(.all)
    }
}
