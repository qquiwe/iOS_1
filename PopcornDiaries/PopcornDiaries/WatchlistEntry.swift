import Foundation

// MARK: - WatchlistEntry (class)
class WatchlistEntry: Describable {
    let movie: Movie
    var status: WatchStatus
    var personalRating: Int? // optional

    init(movie: Movie, status: WatchStatus = .planned, personalRating: Int? = nil) {
        self.movie = movie
        self.status = status
        self.personalRating = personalRating
    }

    func summary() -> String {
        var text = "\(movie.title) — status: \(status.rawValue)"
        if let personalRating = personalRating {
            text += ", my rating: \(personalRating)/10"
        }
        return text
    }

    func markAsWatched(rating: Int? = nil) {
        self.status = .watched
        if let rating = rating {
            self.personalRating = rating
        }
    }
}
