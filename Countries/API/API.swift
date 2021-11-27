// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let aPI = try API(json)

import Foundation

// MARK: - Country
struct Country: Decodable, Identifiable {
    let currencies: [Currency]
    let languages: [Language]
    let name: String
    let topLevelDomain: [String]
    let alpha2Code: String
    let callingCodes: [String]
    let capital, region: String
    let population: Int
    let borders: [String]
    var id: String { alpha2Code }
}

// MARK: - Currency
struct Currency: Decodable {
    let code, name, symbol: String
}

// MARK: - Language
struct Language: Decodable {
    let name: String
    let nativeName: String?
}
