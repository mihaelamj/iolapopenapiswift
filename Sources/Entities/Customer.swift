//
// iOLAP is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 iOLAP.
//

import Foundation

public struct Customer: Codable, Identifiable {
    public var address: [Address]?
    /// Example: 100000
    public var id: Int?
    /// Example: "fehguy"
    public var username: String?

    public init(address: [Address]? = nil, id: Int? = nil, username: String? = nil) {
        self.address = address
        self.id = id
        self.username = username
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        address = try values.decodeIfPresent([Address].self, forKey: "address")
        id = try values.decodeIfPresent(Int.self, forKey: "id")
        username = try values.decodeIfPresent(String.self, forKey: "username")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(address, forKey: "address")
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(username, forKey: "username")
    }
}
