//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Ferhat on 28.01.2024.
//


import UIKit

protocol CharacterTableViewModelDelegate {
    func notify(_ notify: notifyViewModel)
}
final class CharacterViewModel {
    private var inSearchMode: Bool = false
    private var allCharacters: [CharacterResult] = []
    private var filteredCharacters: [CharacterResult] = []
    private var page: String = ""
    public var characters: [CharacterResult] {
        return inSearchMode ? filteredCharacters : allCharacters
    }
    let dataprovider = CharacterDataProvider(serviceManager: AlamofireServiceManager())
    var delegate: CharacterTableViewModelDelegate?
    
    func fetchCharacterList(){
        dataprovider.fetchCharacterList(endpoint: .character, parameters: page.isEmpty ? nil : [.page(page)]) { result in
            switch result {
            case .success(let success):
                self.prepareNextPage(with: success.info?.next ?? "")
                if let characters = success.characters{
                    self.allCharacters.append(contentsOf: characters)
                } else {
                    print(RickAndMortyApiError.noData)
                }
                if success.info?.next != nil {
                    self.notify(with: .reloadTableView)
                }
            case .failure(let failure):
                self.notify(with: .error(failure))
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
    private func notify(with notify: notifyViewModel){
        DispatchQueue.main.async {
            self.delegate?.notify(notify)
        }
    }
}
extension CharacterViewModel {
    public func setInSearchMode(_ searchController: UISearchController) {
//        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        inSearchMode = !searchText.isEmpty
        if !inSearchMode {
            notify(with: .reloadTableView)
        }
    }
    public func updateSourceController(searchBarText: String?) {
        self.filteredCharacters = allCharacters
        if let searchText = searchBarText?.lowercased(){
            guard !searchText.isEmpty else { return }
            self.filteredCharacters = self.filteredCharacters.filter({
                $0.name!.lowercased().contains(searchText)})
        }
        notify(with: .reloadTableView)
    }
}
enum notifyViewModel{
    case reloadTableView
    case error(RickAndMortyApiError)
}
