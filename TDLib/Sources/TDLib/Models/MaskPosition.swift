//
//  MaskPosition.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Position on a photo where a mask should be placed
public struct MaskPosition: Codable {

    /// Part of the face, relative to which the mask should be placed
    public var point: MaskPoint

    /// Mask scaling coefficient. (For example, 2.0 means a doubled size)
    public var scale: Double

    /// Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position)
    public var xShift: Double

    /// Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position)
    public var yShift: Double


    public init (
        point: MaskPoint,
        scale: Double,
        xShift: Double,
        yShift: Double) {

        self.point = point
        self.scale = scale
        self.xShift = xShift
        self.yShift = yShift
    }
}

