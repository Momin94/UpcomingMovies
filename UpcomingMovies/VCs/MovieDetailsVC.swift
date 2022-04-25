//
//  MovieDetailsVC.swift
//  UpcomingMovies
//
//  Created by momin on 25/04/2022.
//

import Foundation
import UIKit
import SDWebImage

class MovieDetailsVC: UIViewController{
// MARK: - Properties
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieOverview: UILabel!
    @IBOutlet var movieDate: UILabel!
    
    @IBOutlet weak var movieSynopsis: UITextView!
    @IBOutlet weak var watchTrailerButton: UIButton!
    @IBOutlet weak var getTicketsButton: UIButton!
    
    @IBOutlet weak var fourthGenre: UILabel!
    @IBOutlet weak var thirdGenre: UILabel!
    @IBOutlet weak var secondGenre: UILabel!
    @IBOutlet weak var firstGenre: UILabel!
    var movieOverviewText: String?
    var movieDateText: String?
    var movieImageText: String?
    var genreArray:[Int]?

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDate?.text = movieDateText
        movieSynopsis?.text = movieOverviewText
        getTicketsButton.backgroundColor = UIColor.systemBlue
        getTicketsButton.layer.cornerRadius = 10
        watchTrailerButton.layer.cornerRadius = 10
        watchTrailerButton.layer.borderWidth = 2
        watchTrailerButton.layer.borderColor = UIColor.systemBlue.cgColor
        firstGenre.layer.cornerRadius = 16
        secondGenre.layer.cornerRadius = 16
        thirdGenre.layer.cornerRadius = 16
        fourthGenre.layer.cornerRadius = 16
        firstGenre.backgroundColor = UIColor(red: 0.08,  green: 0.82, blue: 0.74, alpha: 1)
        secondGenre.backgroundColor = UIColor(red: 0.89,  green: 0.42, blue: 0.65, alpha: 1)
        thirdGenre.backgroundColor = UIColor(red: 0.34,  green: 0.03, blue: 0.64, alpha: 1)
        fourthGenre.backgroundColor = UIColor(red: 0.08,  green: 0.62, blue: 0.06, alpha: 1)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let imageURL = URL(string: movieImageText!)

        movieImage.sd_setImage(with: imageURL) { image, error, _, _ in
            if error != nil {
                // Failed to load image
                self.movieImage.image = UIImage(named: "TestImage.jpg")
            } else {
                // Successful in loading image
                self.movieImage.image = image
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
    }
    
}
