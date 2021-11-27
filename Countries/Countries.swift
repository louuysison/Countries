//
//  Countries.swift
//  Countries
//
//  Created by Lou Allen Uy Sison on 11/27/21.
//

import Foundation

public struct Countries {
    let countries: [Country]
    
    init(response: [Country]) {
        countries = response
    }
}
