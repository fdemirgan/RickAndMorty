//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Ferhat on 4.02.2024.
//

import UIKit

class EpisodeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = EpisodeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchEpisodeList()
        registerCells()
    }
    private func registerCells() {
        let episodesCellName = String(describing: EpisodesCell.self)
        let episodesCellNib = UINib(nibName: episodesCellName, bundle: nil)
        tableView.register(episodesCellNib, forCellReuseIdentifier: episodesCellName)
    }
}
extension EpisodeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.episodes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = viewModel.episodes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodesCell.self)) as! EpisodesCell
        cell.prepareCell(with: EpisodeCellViewModel(episode: episode))
        return cell
    }
}
