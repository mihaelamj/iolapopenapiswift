//
// iOLAP is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 iOLAP.
//

import Foundation

public struct Address: Codable {
    /// Example: "Palo Alto"
    public var city: String?
    /// Example: "CA"
    public var state: String?
    /// Example: "437 Lytton"
    public var street: String?
    /// Example: "94301"
    public var zip: String?

    public init(city: String? = nil, state: String? = nil, street: String? = nil, zip: String? = nil) {
        self.city = city
        self.state = state
        self.street = street
        self.zip = zip
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        city = try values.decodeIfPresent(String.self, forKey: "city")
        state = try values.decodeIfPresent(String.self, forKey: "state")
        street = try values.decodeIfPresent(String.self, forKey: "street")
        self.zip = try values.decodeIfPresent(String.self, forKey: "zip")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(city, forKey: "city")
        try values.encodeIfPresent(state, forKey: "state")
        try values.encodeIfPresent(street, forKey: "street")
        try values.encodeIfPresent(zip, forKey: "zip")
    }
}
