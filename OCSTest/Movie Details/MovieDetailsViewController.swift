//
//  MovieDetailsViewController.swift
//  OCSTest
//
//  Created by Yasin AKINCI on 26/01/2022.
//

import UIKit
import AVKit
import AVFoundation
import Combine

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: CachedImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    
    @Published var movieCellModel: MovieCellModel?
    var viewModel: MovieDetailsViewModel?
    private var subscriptions: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        viewModelBinding()
    }
    
    private func viewModelBinding() {
        $movieCellModel
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] movieCellModel in
                guard let movieCellModel = movieCellModel else { return }
                self?.viewModel = MovieDetailsViewModel(movieCellModel: movieCellModel)
                self?.screenBindings()
                MovieDetailsServices.fetchDetails(detaillink: movieCellModel.detaillink, completion: {
                    result in
                    switch result {
                    case .success(let movieDetails):
                        if ((movieDetails.contents?.seasons?.isEmpty) != nil) {
                            self?.viewModel?.pitch = movieDetails.contents?.seasons?[0].pitch ?? ""
                        } else {
                            self?.viewModel?.pitch = movieDetails.contents?.pitch ?? ""
                        }
                    case .failure(let error):
                        print(error)
                    }
                })
            }).store(in: &subscriptions)
    }
    
    
    private func screenBindings() {
        viewModel?.$imageUrl
            .receive(on: RunLoop.main)
            .compactMap{ URL(string: URLs.imageForMovie(url: $0)) }
            .sink { [weak self] url in
                self?.movieImageView.loadImage(fromURL: url)
            }.store(in: &subscriptions)
        
        viewModel?.$title
            .receive(on: RunLoop.main)
            .compactMap { String($0) }
            .assign(to: \.text, on: titleLabel)
            .store(in: &subscriptions)
        
        viewModel?.$subtitle
            .receive(on: RunLoop.main)
            .compactMap { String($0) }
            .assign(to: \.text, on: subtitleLabel)
            .store(in: &subscriptions)
        
        viewModel?.$pitch
            .receive(on: RunLoop.main)
            .compactMap { String($0 ?? "") }
            .assign(to: \.text, on: pitchLabel)
            .store(in: &subscriptions)
    }
    
    
    //  MARK: IBAction methods
    
    @IBAction func playVideoAction() {
        guard let url = URL(string: URLs.getVideoUrl()) else {
            return
        }
        let player = AVPlayer(url: url)
        let avPlayerViewController = AVPlayerViewController()
        avPlayerViewController.player = player
        self.present(avPlayerViewController, animated: true) { avPlayerViewController.player?.play()
        }
    }
    
}
