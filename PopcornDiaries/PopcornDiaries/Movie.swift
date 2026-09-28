import Foundation

// MARK: - Protocol
protocol Describable {
    func summary() -> String
}

// MARK: - Enum
enum WatchStatus: String, CaseIterable {
    case planned = "Planned"
    case watching = "Watching"
    case watched = "Watched"
}

// MARK: - Movie (struct)
struct Movie: Describable {
    let title: String
    let year: Int
    let genre: String
    var rating: Double? // optional, бо рейтинг можуть ще не поставити

    func summary() -> String {
        if let rating = rating {
            return "\(title) (\(year)) — \(genre), rating: \(rating)"
        } else {
            return "\(title) (\(year)) — \(genre), no rating yet"
        }
    }
}
