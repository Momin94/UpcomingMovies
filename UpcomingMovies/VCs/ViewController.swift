//
//  ViewController.swift
//  UpcomingMovies
//
//  Created by momin on 25/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var movieTableView: UITableView!
       var movieViewModel = MovieViewModel()

       override func viewDidLoad() {
           super.viewDidLoad()
           
           movieTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
           movieViewModel.movieViewController = self
           movieViewModel.getAllMoviesAF()
           movieTableView.dataSource = self
           movieTableView.delegate = self
           
       }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         movieViewModel.movieArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
        let modelMovie = movieViewModel.movieArray[indexPath.row]
        cell?.configureCell(movieVM: modelMovie)
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetailsVC(nibName: "MovieDetailsVC", bundle: nil)
        
        let modelMovie = movieViewModel.movieArray[indexPath.row]
        
        vc.movieDateText = modelMovie.release_date
        vc.movieOverviewText = modelMovie.overview
        let imageURL = "https://image.tmdb.org/t/p/w500/" + (modelMovie.poster_path ?? "")
        vc.movieImageText = imageURL
        vc.genreArray = modelMovie.genre_ids
//        vc.firstGenre.backgroundColor = UIColor(red: 0.08,  green: 0.82, blue: 0.74, alpha: 1)
//        vc.secondGenre.backgroundColor = UIColor(red: 0.89,  green: 0.42, blue: 0.65, alpha: 1)
//        vc.thirdGenre.backgroundColor = UIColor(red: 0.34,  green: 0.03, blue: 0.64, alpha: 1)
//        vc.fourthGenre.backgroundColor = UIColor(red: 0.08,  green: 0.62, blue: 0.06, alpha: 1)
        self.present(vc, animated: true)
        
    }
    
    
}

