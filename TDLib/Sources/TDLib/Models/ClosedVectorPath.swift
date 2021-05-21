//
//  ClosedVectorPath.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Represents a closed vector path. The path begins at the end point of the last command
public struct ClosedVectorPath: Codable {

    /// List of vector path commands
    public var commands: [VectorPathCommand]


    public init (commands: [VectorPathCommand]) {
        self.commands = commands
    }
}

