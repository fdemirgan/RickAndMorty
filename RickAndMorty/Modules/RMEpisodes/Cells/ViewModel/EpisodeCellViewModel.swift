//
//  EpisodeCellViewModel.swift
//  RickAndMorty
//
//  Created by Ferhat on 10.02.2024.
//

import Foundation
final class EpisodeCellViewModel {
    
    private var episode: RMEpisode
    init(episode: RMEpisode) {
        self.episode = episode
    }
    public var name: String {
        return episode.name ?? ""
    }
    public var episodeCode: String{
        return episode.episode ?? ""
    }
}
