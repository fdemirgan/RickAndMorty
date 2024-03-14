//
//  EpisodesCell.swift
//  RickAndMorty
//
//  Created by Ferhat on 10.02.2024.
//

import UIKit

class EpisodesCell: UITableViewCell {
    
    @IBOutlet private weak var episodeCodeLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    func prepareCell(with model: EpisodeCellViewModel){
        episodeCodeLbl.text = model.episodeCode
        nameLbl.text = model.name
    }
}
