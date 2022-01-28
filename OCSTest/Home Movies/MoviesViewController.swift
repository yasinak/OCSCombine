//
//  ViewController.swift
//  OCSTest
//
//  Created by Yasin AKINCI on 25/01/2022.
//

import UIKit
import Combine

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var noResultLabel: UILabel!
    
    let searchController = UISearchController()
    
    //  margin width is 8, only 2 columns by row
    private let cellWidth = (UIScreen.main.bounds.width - 26) / 2
    
    @Published private(set) var searchQuery = ""
    private var subscriptions = Set<AnyCancellable>()
    private var viewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configureSearchController()
        configureCollectionView()
        
        searchQueryBinding()
        updateResultBinding()
    }
    
    //  MARK: bindings
    //  launch a search, when $searchQuery is updated in the searchBar
    private func searchQueryBinding() {
        $searchQuery
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] value in
                self?.viewModel.searchQuery = value
            }.store(in: &subscriptions)
    }
    
    //  get and manage the result of a search
    private func updateResultBinding() {
        viewModel.updateResult
            .receive(on: RunLoop.main)
            .sink { completion in
            switch completion {
            case .finished:
                print("finished")
            case .failure(let error):
                print("Erreur reçue: \(error.localizedDescription)")
            }
        } receiveValue: { [weak self] _ in
            self?.displayMovies()
        }.store(in: &subscriptions)
    }
    
    private func displayMovies() {
        noResultLabel.isHidden = (self.viewModel.moviesModel?.count ?? 0) > 0
        moviesCollectionView.reloadData()
    }
    
    private func displayNoResult() {
        //  TODO: add a behavior when we have 0 result for a search
    }

    
    //  MARK: screen configuration
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth*1.5)
        moviesCollectionView.collectionViewLayout = layout
        moviesCollectionView.register(UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier,
           scene == "gotoMovieDetailViewController",
           let destinationViewController = segue.destination as? MovieDetailsViewController,
           let indexPath = sender as? IndexPath
        {
            destinationViewController.movieCellModel = viewModel.moviesModel?.movieCellModels[indexPath.item]
        }
    }
    
}

//  MARK: UISearchResultsUpdating Extension

extension MoviesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        self.searchQuery = searchText
    }
}

//  MARK: UICollectionView Extension

extension MoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell {
            let movieCellModel = viewModel.moviesModel?.movieCellModels[indexPath.item]
            cell.movieCellModel = movieCellModel
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.moviesModel?.count ?? 0
    }
}

extension MoviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "gotoMovieDetailViewController", sender: indexPath)
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellWidth*1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}

