//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Ferhat on 31.01.2024.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet private weak var characterImage: UIImageView!
    @IBOutlet private weak var statusLbl: UILabel!
    @IBOutlet private weak var speciesLbl: UILabel!
    @IBOutlet private weak var genderLbl: UILabel!
    @IBOutlet private weak var lastKnowLocationLbl: UILabel!
    @IBOutlet private weak var FirstSeenInLbl: UILabel!
    
    var character: CharacterResult?
    private let viewModel = CharacterDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.titleColor]
        }
        if let character = character {
            
            navigationItem.title = character.name
            characterImage.kf.setImage(with: character.image)
            characterImage.layer.cornerRadius = characterImage.frame.height * 0.5
            statusLbl.textColor = character.statusColor
            statusLbl.text = character.status?.rawValue
            speciesLbl.text = character.species
            genderLbl.text = character.gender
            lastKnowLocationLbl.text = character.location?.name
            viewModel.fetchEpisode(with: character.episode?.first?.lastEndpoint ?? "")
        }
    }
}

extension DetailViewController: CharacterDetailViewModelDelegate {
    func notify(_ notify: NotifyCharacterDetailViewModel) {
        switch notify {
        case .didFetchEpisode:
            FirstSeenInLbl.text = viewModel.episode?.name ?? ""
        }
    }
}
