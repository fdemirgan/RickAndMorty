//
//  LocationsCell.swift
//  RickAndMorty
//
//  Created by Ferhat on 1.02.2024.
//

import UIKit

class LocationsCell: UITableViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    
    func prepareCell(with model: LocationCellViewModel){
        nameLbl.text = model.name
    }
}
