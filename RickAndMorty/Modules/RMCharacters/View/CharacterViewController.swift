//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Ferhat on 27.01.2024.
//

import UIKit
class CharacterViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let viewModel = CharacterViewModel()
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCharacterList()
        setupSearchController()
        registerCells()
        viewModel.delegate = self
        if let tabBarController = tabBarController {
                    tabBarController.delegate = self
                }
    }
    private func registerCells() {
        let characterTableViewCellName = String(describing: CharacterCell.self)
        let characterTableViewCellNib = UINib(nibName: characterTableViewCellName, bundle: nil)
        tableView.register(characterTableViewCellNib, forCellReuseIdentifier: characterTableViewCellName)
    }
    private func setupSearchController(){
        //        NavigationItem a searchController ekler.
        navigationItem.searchController = searchController
        //        Searchcontroller ı arama sonuçlarına göre update eder.
        searchController.searchResultsUpdater = self
        //        Arama sırasında arama yapılacak içerik listesinin gizlenip gizlenmeyeceğini gösterir.
        searchController.obscuresBackgroundDuringPresentation = false
        //        Arama sırasında navigation bar ın gizlenip gizlenmeyeceğini belirtir.
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Character Search"
        //       TableView u scroll ederken searchBar ın kapanıp kapanmayacağını gösterir.
        navigationItem.hidesSearchBarWhenScrolling = true
    }
}
extension CharacterViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.setInSearchMode(searchController)
        viewModel.updateSourceController(searchBarText: searchController.searchBar.text)
    }
}
extension CharacterViewController: CharacterTableViewModelDelegate {
    func notify(_ notify: notifyViewModel) {
        switch notify {
        case .reloadTableView:
            tableView.reloadData()
        case .error(let rickAndMortyApiError):
            print(rickAndMortyApiError)
        }
    }
}
extension CharacterViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterCell.self)) as! CharacterCell
        let character = viewModel.characters[indexPath.row]
        cell.prepareCell(with: CharacterCellViewModel(character: character))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let character = viewModel.characters[indexPath.row]
        performSegue(withIdentifier: "CharacterDetailVC", sender: character)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "CharacterDetailVC" else { return }
        if let character = sender as? CharacterResult {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.character = character
        }
    }
  // Yeni bir liste için görüntülenecek cell'i liste ekranı görüntülenmeden oluşturur.
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastCharacter = viewModel.characters.count - 1
        if indexPath.row == lastCharacter {
            viewModel.fetchCharacterList()
        }
    }
    // TableView un başına gitmek için...
    @objc func scrollToTop(){
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
extension CharacterViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Seçilen tab değiştiğinde bu metod çağrılır
        if let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController), selectedIndex == 0 { // selectedIndex == 0 sayfanın başa alınma işlemini uygulayacak barItem ın indexi.
            scrollToTop()
        }
    }
}

