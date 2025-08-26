// MARK: - Twitter

final class Twitter {

    // Tweet record
    private struct Tweet {
        let id: Int
        let time: Int
    }

    // Heap node for k-way merge (points to a user's tweet at index)
    private struct Node: Comparable {
        let time: Int
        let tweetId: Int
        let userId: Int
        let index: Int  // index in that user's tweet array (0...n-1)

        // Max-heap on time
        static func < (lhs: Node, rhs: Node) -> Bool { lhs.time < rhs.time }
    }

    // Max-heap (priority queue)
    private struct MaxHeap<T: Comparable> {
        private var a: [T] = []
        var isEmpty: Bool { a.isEmpty }
        var count: Int { a.count }

        mutating func push(_ x: T) {
            a.append(x); siftUp(a.count - 1)
        }

        mutating func pop() -> T? {
            guard !a.isEmpty else { return nil }
            if a.count == 1 { return a.removeLast() }
            let top = a[0]
            a[0] = a.removeLast()
            siftDown(0)
            return top
        }

        private mutating func siftUp(_ i0: Int) {
            var i = i0
            while i > 0 {
                let p = (i - 1) / 2
                if a[p] < a[i] { a.swapAt(p, i); i = p } else { break }
            }
        }
        private mutating func siftDown(_ i0: Int) {
            var i = i0
            while true {
                let l = 2 * i + 1, r = l + 1
                var m = i
                if l < a.count, a[m] < a[l] { m = l }
                if r < a.count, a[m] < a[r] { m = r }
                if m == i { break }
                a.swapAt(i, m); i = m
            }
        }
    }

    // --- State ---
    private var time = 0                                   // global increasing clock
    private var tweets: [Int: [Tweet]] = [:]               // userId -> tweets (ascending by time)
    private var followees: [Int: Set<Int>] = [:]           // userId -> set of followees

    // MARK: API

    init() {}
}

extension Twitter {
    func postTweet(_ userId: Int, _ tweetId: Int) {
        time += 1
        tweets[userId, default: []].append(Tweet(id: tweetId, time: time))
    }
    func getNewsFeed(_ userId: Int) -> [Int] {
        // Build the set of sources (self + followees)
        var src = followees[userId] ?? []
        src.insert(userId)

        // Seed heap with the newest tweet from each source
        var heap = MaxHeap<Node>()
        for u in src {
            if let arr = tweets[u], !arr.isEmpty {
                let idx = arr.count - 1
                let t = arr[idx]
                heap.push(Node(time: t.time, tweetId: t.id, userId: u, index: idx))
            }
        }

        // K-way merge, collect up to 10 tweets
        var feed: [Int] = []
        while feed.count < 10, let top = heap.pop() {
            feed.append(top.tweetId)
            // push next older tweet from the same user (index - 1)
            if let arr = tweets[top.userId], top.index > 0 {
                let ni = top.index - 1
                let t = arr[ni]
                heap.push(Node(time: t.time, tweetId: t.id, userId: top.userId, index: ni))
            }
        }
        return feed
    }
    func follow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else { return }
        followees[followerId, default: []].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followees[followerId]?.remove(followeeId)
    }
}
