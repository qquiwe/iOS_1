import SwiftUI

struct ContentView: View {
    let manager = WatchlistManager()

    var body: some View {
        VStack {
            Text("Popcorn Diaries")
                .font(.largeTitle)
        }
        .padding()
        .onAppear {
            runScenario()
        }
    }

    func runScenario() {
        let movie1 = Movie(title: "Inception", year: 2010, genre: "Sci-Fi", rating: 8.8)
        let movie2 = Movie(title: "La La Land", year: 2016, genre: "Musical", rating: nil)

        let entry1 = WatchlistEntry(movie: movie1, status: .planned)
        let entry2 = WatchlistEntry(movie: movie2, status: .watching)

        manager.add(entry1)
        manager.add(entry2)

        entry1.markAsWatched(rating: 9)

        print("=== All entries ===")
        manager.printAll()

        print("=== Watched movies ===")
        for entry in manager.entries(with: .watched) {
            print(entry.summary())
        }

        if let avg = manager.averageRating() {
            print("Average personal rating: \(avg)")
        } else {
            print("No rated movies yet")
        }
    }
}
