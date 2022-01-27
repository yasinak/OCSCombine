//
//  MovieCollectionViewCell.swift
//  OCSTest
//
//  Created by Yasin AKINCI on 25/01/2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: CachedImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static let identifier = "MovieCollectionViewCell"
    
    var movieCellModel: MovieCellModel? {
        didSet {
            titleLabel.text = movieCellModel?.title
            subtitleLabel.text = movieCellModel?.subtitle
            if let imageUrl = movieCellModel?.imageUrl, let url = URL(string: URLs.imageForMovie(url: imageUrl)) {
                movieImageView.loadImage(fromURL: url)
            }
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
