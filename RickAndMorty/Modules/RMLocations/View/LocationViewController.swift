//
//  LocationViewController.swift
//  RickAndMorty
//
//  Created by Ferhat on 31.01.2024.
//

import UIKit
class LocationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = LocationViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchLocations()
        registerCells()
        viewModel.delegate = self
    }
    private func registerCells() {
        let locationsCellName = String(describing: LocationsCell.self)
        let locationsCellNib = UINib(nibName: locationsCellName, bundle: nil)
        tableView.register(locationsCellNib, forCellReuseIdentifier: locationsCellName)
    }
}
extension LocationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.locations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let location = viewModel.locations[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LocationsCell.self)) as! LocationsCell
        cell.prepareCell(with: LocationCellViewModel(location: location))
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastLocation = viewModel.locations.count - 1
        if indexPath.row == lastLocation {
            viewModel.fetchLocations()
        }
    }
}
extension LocationViewController: LocationTableViewModelDelegate {
    func notify(_ notify: notifyViiewModel) {
        switch notify {
        case .reloadTableView:
            tableView.reloadData()
        case .error(let rickAndMortyApiError):
            print(rickAndMortyApiError)
        }
    }
}
