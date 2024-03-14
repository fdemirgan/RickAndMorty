//
//  ViewModel.swift
//  RickAndMorty
//
//  Created by Ferhat on 1.02.2024.
//

import Foundation
final class LocationCellViewModel {
    private var location: RMLocation
    init(location: RMLocation) {
        self.location = location
    }
    public var name: String {
        return location.name ?? ""
    }
}
