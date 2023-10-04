//
// iOLAP is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 iOLAP.
//

import Foundation

public struct Order: Codable, Identifiable {
    public var isComplete: Bool?
    /// Example: 10
    public var id: Int?
    /// Example: 198772
    public var petID: Int?
    public var quantity: Int?
    public var shipDate: Date?
    /// Order Status
    ///
    /// Example: "approved"
    public var status: Status?

    /// Order Status
    ///
    /// Example: "approved"
    public enum Status: String, Codable, CaseIterable {
        case placed
        case approved
        case delivered
    }

    public init(isComplete: Bool? = nil, id: Int? = nil, petID: Int? = nil, quantity: Int? = nil, shipDate: Date? = nil, status: Status? = nil) {
        self.isComplete = isComplete
        self.id = id
        self.petID = petID
        self.quantity = quantity
        self.shipDate = shipDate
        self.status = status
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        isComplete = try values.decodeIfPresent(Bool.self, forKey: "complete")
        id = try values.decodeIfPresent(Int.self, forKey: "id")
        petID = try values.decodeIfPresent(Int.self, forKey: "petId")
        quantity = try values.decodeIfPresent(Int.self, forKey: "quantity")
        shipDate = try values.decodeIfPresent(Date.self, forKey: "shipDate")
        status = try values.decodeIfPresent(Status.self, forKey: "status")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isComplete, forKey: "complete")
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(petID, forKey: "petId")
        try values.encodeIfPresent(quantity, forKey: "quantity")
        try values.encodeIfPresent(shipDate, forKey: "shipDate")
        try values.encodeIfPresent(status, forKey: "status")
    }
}
