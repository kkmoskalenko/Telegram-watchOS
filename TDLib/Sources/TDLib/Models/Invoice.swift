//
//  Invoice.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Product invoice
public struct Invoice: Codable {

    /// ISO 4217 currency code
    public var currency: String

    /// True, if the total price depends on the shipping method
    public var isFlexible: Bool

    /// True, if the payment is a test payment
    public var isTest: Bool

    /// True, if the user's email address is needed for payment
    public var needEmailAddress: Bool

    /// True, if the user's name is needed for payment
    public var needName: Bool

    /// True, if the user's phone number is needed for payment
    public var needPhoneNumber: Bool

    /// True, if the user's shipping address is needed for payment
    public var needShippingAddress: Bool

    /// A list of objects used to calculate the total price of the product
    public var priceParts: [LabeledPricePart]

    /// True, if the user's email address will be sent to the provider
    public var sendEmailAddressToProvider: Bool

    /// True, if the user's phone number will be sent to the provider
    public var sendPhoneNumberToProvider: Bool


    public init (
        currency: String,
        isFlexible: Bool,
        isTest: Bool,
        needEmailAddress: Bool,
        needName: Bool,
        needPhoneNumber: Bool,
        needShippingAddress: Bool,
        priceParts: [LabeledPricePart],
        sendEmailAddressToProvider: Bool,
        sendPhoneNumberToProvider: Bool) {

        self.currency = currency
        self.isFlexible = isFlexible
        self.isTest = isTest
        self.needEmailAddress = needEmailAddress
        self.needName = needName
        self.needPhoneNumber = needPhoneNumber
        self.needShippingAddress = needShippingAddress
        self.priceParts = priceParts
        self.sendEmailAddressToProvider = sendEmailAddressToProvider
        self.sendPhoneNumberToProvider = sendPhoneNumberToProvider
    }
}

