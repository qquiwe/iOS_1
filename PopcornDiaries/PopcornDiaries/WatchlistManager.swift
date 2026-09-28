import Foundation

// MARK: - WatchlistManager (class, керує колекцією)
class WatchlistManager {
    var entries: [WatchlistEntry] = []

    func add(_ entry: WatchlistEntry) {
        entries.append(entry)
    }

    func entries(with status: WatchStatus) -> [WatchlistEntry] {
        return entries.filter { $0.status == status }
    }

    func printAll() {
        for entry in entries {
            print(entry.summary())
        }
    }

    // Приклад безпечного розгортання optional через if let
    func averageRating() -> Double? {
        let ratedEntries = entries.compactMap { $0.personalRating }
        guard !ratedEntries.isEmpty else { return nil }
        let sum = ratedEntries.reduce(0, +)
        return Double(sum) / Double(ratedEntries.count)
    }
}
