// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let kitty = try? newJSONDecoder().decode(Kitty.self, from: jsonData)

import Foundation

// MARK: - KittyElement
public struct KittyElement: Codable {
    public let breeds: [Breed]?
    public let id: String?
    public let url: String?
    public let width, height: Int?
}

// MARK: - Breed
public struct Breed: Codable {
    public let weight: Weight?
    public let id, name: String?
    public let cfaURL: String?
    public let vetstreetURL: String?
    public let vcahospitalsURL: String?
    public let temperament, origin, countryCodes, countryCode: String?
    public let breedDescription, lifeSpan: String?
    public let indoor, lap, adaptability, affectionLevel: Int?
    public let childFriendly, catFriendly, dogFriendly, energyLevel: Int?
    public let grooming, healthIssues, intelligence, sheddingLevel: Int?
    public let socialNeeds, strangerFriendly, vocalisation, bidability: Int?
    public let experimental, hairless, natural, rare: Int?
    public let rex, suppressedTail, shortLegs: Int?
    public let wikipediaURL: String?
    public let hypoallergenic: Int?
    public let referenceImageID: String?

    public enum CodingKeys: String, CodingKey {
        case weight, id, name
        case cfaURL = "cfa_url"
        case vetstreetURL = "vetstreet_url"
        case vcahospitalsURL = "vcahospitals_url"
        case temperament, origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case breedDescription = "description"
        case lifeSpan = "life_span"
        case indoor, lap, adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case catFriendly = "cat_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation, bidability, experimental, hairless, natural, rare, rex
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        case hypoallergenic
        case referenceImageID = "reference_image_id"
    }
}

// MARK: - Weight
public struct Weight: Codable {
    public let imperial, metric: String?
}

public typealias Kitty = [KittyElement]
