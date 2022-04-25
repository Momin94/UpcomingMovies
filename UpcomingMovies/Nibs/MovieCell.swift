//
//  MovieCell.swift
//  UpcomingMovies
//
//  Created by momin on 25/04/2022.
//

import UIKit

class MovieCell: UITableViewCell {
    // MARK: - Properties
        @IBOutlet var movieImage: UIImageView!
        @IBOutlet var movieTitle: UILabel!
        
        // MARK: - Methods
        override func awakeFromNib() {
            super.awakeFromNib()
            movieImage.self.layer.cornerRadius = 10
            layer.borderColor = UIColor.white.cgColor
            layer.borderWidth = 10
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

        }
        
    func configureCell(movieVM: MovieResults){
        movieTitle.text = movieVM.title
        let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/" + (movieVM.poster_path ?? ""))
        movieImage.sd_setImage(with: imageURL)
    }
    
}
