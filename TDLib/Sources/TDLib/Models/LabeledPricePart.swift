//
//  LabeledPricePart.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Portion of the price of a product (e.g., "delivery cost", "tax amount")
public struct LabeledPricePart: Codable {

    /// Currency amount in minimal quantity of the currency
    public var amount: Int64

    /// Label for this portion of the product price
    public var label: String


    public init (
        amount: Int64,
        label: String) {

        self.amount = amount
        self.label = label
    }
}

