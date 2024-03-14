//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//

import Foundation

protocol LocationTableViewModelDelegate {
    func notify(_ notify: notifyViiewModel)
}
final class LocationViewModel {
    var dataProvider = LocationDataProvider(serviceManager: URLSessionServiceManager())
    private var page: String = ""
    var delegate: LocationTableViewModelDelegate?
    public var locations: [RMLocation] = []
    
    func fetchLocations(){
        dataProvider.fetchLocationList(endpoint: .location, parameters: page.isEmpty ? nil : [.page(page)]) { result in
            switch result {
            case .success(let success):
                self.prepareNextPage(with: success.info?.next ?? "")
                if let rmlocation = success.rmLocation{
                    self.locations.append(contentsOf: rmlocation)
                }
                if success.info?.next != nil {
                    self.notify(with: .reloadTableView)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    func prepareNextPage(with string: String) {
        if let url = URL(string: string) {
            if let pageParameter = url.pageParameter {
                page = pageParameter.value
                print("Page: \(page)")
            }
        }
    }
    private func notify(with notify: notifyViiewModel){
        DispatchQueue.main.async {
            self.delegate?.notify(notify)
        }
    }
}
enum notifyViiewModel{
    case reloadTableView
    case error(RickAndMortyApiError)
}
