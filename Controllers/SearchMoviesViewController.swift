//
//  SearchMoviesViewController.swift
//  Cinematic
//
//  Created by Gurpreet Kaur on 2022-12-15.
//

import UIKit

class SearchMoviesViewController: UIViewController {

    override func viewDidLoad() {
       
       
    }
    
    init(sender: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel.sender = sender
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func fetchMovies(search: String, nextPage: Bool = false) {
        viewModel.fetchMovies(search: search, nextPage: nextPage) { (movieViewModel) in
            DispatchQueue.main.async {
                self.moviesView.movies = movieViewModel.movies ?? []
                self.moviesView.collectionView.reloadData()
            }
        }
    }

    func displayMovieDetail(movie: Movie) {
        let controller = ShowMovieViewController(with: movie)
        guard let navigation = viewModel.sender.navigationController else { return }
        navigation.pushViewController(controller, animated: true)
    }

    func updateSearchResults(for searchController: UISearchController) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        perform(#selector(search(text:)), with: (searchController.searchBar.text ?? ""), afterDelay: 1)
    }

    @objc func search(text: String) {
        if !text.isEmpty {
            fetchMovies(search: text)
        }
    }
    
    func didSelect(movie: Movie) {
        DispatchQueue.main.async {
            self.displayMovieDetail(movie: movie)
        }
    }

    func loadMoreData() {
        DispatchQueue.main.async {
            guard let search = self.viewModel.movieViewModel.search else { return }
            self.fetchMovies(search: search, nextPage: true)
        }
    }

    func refreshContent() {
        moviesView.collectionView.refreshControl?.endRefreshing()
    }
}
