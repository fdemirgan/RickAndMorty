//
//  Endpointable.swift
//  RickAndMorty
//
//  Created by Ferhat on 27.01.2024.
//

import Foundation
protocol Endpointable {
    var baseUrl: String { get }
    var rawValue: String { get }
    var fullpath: String { get }
}
