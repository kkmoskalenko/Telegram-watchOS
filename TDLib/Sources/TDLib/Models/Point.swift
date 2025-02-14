//
//  Point.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// A point on a Cartesian plane
public struct Point: Codable {

    /// The point's first coordinate
    public var x: Double

    /// The point's second coordinate
    public var y: Double


    public init (
        x: Double,
        y: Double) {

        self.x = x
        self.y = y
    }
}

