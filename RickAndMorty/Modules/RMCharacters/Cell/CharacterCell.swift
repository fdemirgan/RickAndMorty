//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import UIKit

final class CharacterCell: UITableViewCell {

    @IBOutlet private weak var characterImage: UIImageView!
    @IBOutlet private weak var characterNameLbl: UILabel!
    @IBOutlet private weak var lifeLbl: UILabel!
    @IBOutlet private weak var statusView: UIView!
    @IBOutlet private weak var speciesLbl: UILabel!
    
    public func prepareCell(with model: CharacterCellViewModel) {
        characterNameLbl.text = model.name
        lifeLbl.text = model.lifeAndSpecies
        statusView.backgroundColor = model.statusColor
        characterImage.kf.setImage(with: model.characterImage)
        speciesLbl.text = model.species
    }
}
