//
//  DInt2.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 24/09/25.
//

import Foundation

extension DInt {
    /* Medium 48. Rotate Image
     You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
     You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
     Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]   Output: [[7,4,1],[8,5,2],[9,6,3]]
     */
    func i38_m48_rotate1(_ matrix: inout [[Int]]) {
        let n = matrix.count

        // Step 1: Transpose
        for i in 0..<n {
            for j in i..<n {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }

        // Step 2: Reverse each row
        for i in 0..<n {
            matrix[i].reverse()
        }
    }
    func i38_m48_rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        // Transpose
        for i in 0..<n {
            for j in i+1..<n {
                (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
            }
        }

        // Reverse each row
        for i in 0..<n {
            matrix[i].reverse()
        }
    }
    /*
     Medium 53. Maximum Subarray
     Given an integer array nums, find the subarray with the largest sum, and return its sum.
     Input: nums = [-2,1,-3,4,-1,2,1,-5,4]   Output: 6
     Explanation: The subarray [4,-1,2,1] has the largest sum 6.
     */
    // Medium: 53. Maximum Subarray
    func i39_m58_m53_maxSubArray(_ nums: [Int]) -> Int {
        var currSum = nums[0]
        var maxSum = nums[0]

        for i in 1..<nums.count {
            currSum = max(nums[i], currSum + nums[i])
            maxSum = max(maxSum, currSum)
        }
        return maxSum
    }
    /* Medium 54. Spiral Matrix
     Given an m x n matrix, return all elements of the matrix in spiral order.
     Input: matrix = [[1,2,3],[4,5,6],[7,8,9]   Output: [1,2,3,6,9,8,7,4,5]
     */
    func i40_m54_spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty else { return [] }
        var res = [Int]()
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1

        while top <= bottom && left <= right {
            // 1. left -> right
            for col in left...right {
                res.append(matrix[top][col])
            }
            top += 1

            // 2. top -> bottom
            if top <= bottom {
                for row in top...bottom {
                    res.append(matrix[row][right])
                }
                right -= 1
            }

            // 3. right -> left
            if left <= right && top <= bottom {
                for col in stride(from: right, through: left, by: -1) {
                    res.append(matrix[bottom][col])
                }
                bottom -= 1
            }

            // 4. bottom -> top
            if top <= bottom && left <= right {
                for row in stride(from: bottom, through: top, by: -1) {
                    res.append(matrix[row][left])
                }
                left += 1
            }
        }

        return res
    }
    /* Medium 55. Jump Game
     You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

     Return true if you can reach the last index, or false otherwise.

     Input: nums = [2,3,1,1,4]  Output: true
     Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
     Input: nums = [3,2,1,0,4]  Output: false
     Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
     */
    func i41_m55_canJump(_ nums: [Int]) -> Bool {
        var maxReach = 0
        for i in 0..<nums.count {
            if i > maxReach { return false }
            maxReach = max(maxReach, i + nums[i])
            if maxReach >= nums.count - 1 {
                return true
            }
        }

        return true
    }
    /* Medium 56. Merge Intervals
     Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
     Input: intervals = [[1,3],[2,6],[8,10],[15,18]]    Output: [[1,6],[8,10],[15,18]]
     Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].

     Input: intervals = [[1,4],[4,5]]       Output: [[1,5]]
     Explanation: Intervals [1,4] and [4,5] are considered overlapping.
     */
    func i42_m56_merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals }

        // Step 1: Sort by start time
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }

        var merged = [sortedIntervals[0]]

        // Step 2: Merge
        for i in 1..<sortedIntervals.count {
            var last = merged.removeLast()
            let current = sortedIntervals[i]

            if current[0] <= last[1] {
                // Overlap → merge
                last[1] = max(last[1], current[1])
                merged.append(last)
            } else {
                // No overlap
                merged.append(last)
                merged.append(current)
            }
        }
        return merged
    }
    /* Medium 59. Spiral Matrix II
     Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.
     Example 1:
     Input: n = 3
     Output: [[1,2,3],[8,9,4],[7,6,5]]
     */

    func i43_m59_generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = Array(
            repeating: Array(repeating: 0, count: n),
            count: n
        )
        fill(&matrix, top: 0, bottom: n - 1, left: 0, right: n - 1, start: 1)
        return matrix
    }

    private func fill(
        _ matrix: inout [[Int]],
        top: Int, bottom: Int,
        left: Int, right: Int,
        start: Int
    ) {
        // Base case
        if top > bottom || left > right { return }

        var num = start

        // 1. top row
        for col in left...right {
            matrix[top][col] = num
            num += 1
        }

        // 2. right column
        if top < bottom {
            for row in (top+1)...bottom {
                matrix[row][right] = num
                num += 1
            }
        }

        // 3. bottom row
        if top < bottom {
            for col in stride(from: right-1, through: left, by: -1) {
                matrix[bottom][col] = num
                num += 1
            }
        }

        // 4. left column
        if left < right {
            for row in stride(from: bottom-1, through: top+1, by: -1) {
                matrix[row][left] = num
                num += 1
            }
        }

        // Recurse into inner layer
        fill(&matrix, top: top+1, bottom: bottom-1, left: left+1, right: right-1, start: num)
    }
    /* Medium 62. Unique Paths
     There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.

     Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.

     The test cases are generated so that the answer will be less than or equal to 2 * 109.
     Input: m = 3, n = 7                    Output: 28
     */

    func i44_m62_uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
        for i in 1..<m { // Row
            for j in 1..<n { // Column
                debugPrint(i,j)
                debugPrint(dp[i][j])
                dp[i][j] = dp[i][j-1] + dp[i-1][j]

            }
        }
        return dp[m-1][n-1]
    }
    /* Medium 63. Unique Paths II
     You are given an m x n integer array grid. There is a robot initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.

     An obstacle and space are marked as 1 or 0 respectively in grid. A path that the robot takes cannot include any square that is an obstacle.

     Return the number of possible unique paths that the robot can take to reach the bottom-right corner.

     The testcases are generated so that the answer will be less than or equal to 2 * 109.
     */
    func i45_m63_uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)

        // Start cell
        dp[0][0] = obstacleGrid[0][0] == 0 ? 1 : 0

        for i in 0..<m {
            for j in 0..<n {
                if obstacleGrid[i][j] == 1 {
                    dp[i][j] = 0  // obstacle
                } else if !(i == 0 && j == 0) {
                    let up = i > 0 ? dp[i-1][j] : 0
                    let left = j > 0 ? dp[i][j-1] : 0
                    dp[i][j] = up + left
                }
            }
        }

        return dp[m-1][n-1]
    }
    /* Medium 64. Minimum Path Sum
     Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

     Note: You can only move either down or right at any point in time.
     Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
     Output: 7
     Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.
     */
    func i46_m64_minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count

        var dp = Array(repeating: 0, count: n)

        // Initialize first row
        dp[0] = grid[0][0]
        for j in 1..<n {
            dp[j] = dp[j-1] + grid[0][j]
        }

        // Process remaining rows
        for i in 1..<m {
            dp[0] += grid[i][0] // update first column
            for j in 1..<n {
                dp[j] = grid[i][j] + min(dp[j], dp[j-1])
            }
        }
        return dp[n-1]
    }
    /* Medium 81. Search in Rotated Sorted Array II
     There is an integer array nums sorted in non-decreasing order (not necessarily with distinct values).
     Before being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,4,4,5,6,6,7] might be rotated at pivot index 5 and become [4,5,6,6,7,0,1,2,4,4].
     Given the array nums after the rotation and an integer target, return true if target is in nums, or false if it is not in nums.

     You must decrease the overall operation steps as much as possible.
     Input: nums = [2,5,6,0,0,1,2], target = 0       Output: true
     Input: nums = [2,5,6,0,0,1,2], target = 3       Output: false
     */
    func i47_m81_search(_ nums: [Int], _ target: Int) -> Bool {
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = (left + right) / 2

            if nums[mid] == target {
                return true
            }

            // Handle duplicates
            if nums[left] == nums[mid], nums[mid] == nums[right] {
                left += 1
                right -= 1
            }
            // Left half is sorted
            else if nums[left] <= nums[mid] {
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            // Right half is sorted
            else {
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }

        return false
    }
    /*  Medium 162. Find Peak Element
     A peak element is an element that is strictly greater than its neighbors.
     Given a 0-indexed integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.
     You may imagine that nums[-1] = nums[n] = -∞. In other words, an element is always considered to be strictly greater than a neighbor that is outside the array.
     You must write an algorithm that runs in O(log n) time.
     Input: nums = [1,2,3,1]     Output: 2
     Explanation: 3 is a peak element and your function should return the index number 2.
     Input: nums = [1,2,1,3,5,6,4]  Output: 5
     Explanation: Your function can return either index number 1 where the peak element is 2, or index number 5 where the peak element is 6.
     */
    func i48_m162_findPeakElement(_ nums: [Int]) -> Int {
        var lo = 0
        var hi = nums.count - 1
        while lo < hi {
            let mid = (lo + hi) / 2
            if nums[mid] < nums[mid + 1] {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return lo
    }
    /*  Medium 164. Maximum Gap
     Given an integer array nums, return the maximum difference between two successive elements in its sorted form. If the array contains less than two elements, return 0.

     You must write an algorithm that runs in linear time and uses linear extra space.

     Input: nums = [3,6,9,1]    Output: 3
     Explanation: The sorted form of the array is [1,3,6,9], either (3,6) or (6,9) has the maximum difference 3.
     Input: nums = [10]      Output: 0
     Explanation: The array contains less than 2 elements, therefore return 0.
     */
    func i49_m164_maximumGap(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }

        let sorted = nums.sorted()
        var ans = sorted[1] - sorted[0]
        for i in 1..<sorted.count {
            if sorted[i] - sorted[i - 1] > ans {
                ans = sorted[i] - sorted[i - 1]
            }
        }
        return ans
    }

    /*  Medium 165. Compare Version Numbers
     Given two version strings, version1 and version2, compare them. A version string consists of revisions separated by dots '.'. The value of the revision is its integer conversion ignoring leading zeros.

     To compare version strings, compare their revision values in left-to-right order. If one of the version strings has fewer revisions, treat the missing revision values as 0.

     Return the following:
     If version1 < version2, return -1.
     If version1 > version2, return 1.
     Otherwise, return 0.

     Input: version1 = "1.2", version2 = "1.10" Output: -1

     Input: version1 = "1.01", version2 = "1.001"        Output: 0
     Explanation:   Ignoring leading zeroes, both "01" and "001" represent the same integer "1".

     Input: version1 = "1.0", version2 = "1.0.0.0"     Output: 0
     Explanation: version1 has less revisions, which means every missing revision are treated as "0".
     */
    func i50_m165_compareVersion(_ version1: String, _ version2: String) -> Int {
        let v1 = version1.split(separator: ".").map { Int($0)! }
        let v2 = version2.split(separator: ".").map { Int($0)! }
        let maxLength = max(v1.count, v2.count)

        for i in 0..<maxLength {
            let num1 = i < v1.count ? v1[i] : 0
            let num2 = i < v2.count ? v2[i] : 0

            if num1 > num2 { return 1 }
            else if num1 < num2 { return -1 }
        }

        return 0
    }
    /* Medium 134. Gas Station
     There are n gas stations along a circular route, where the amount of gas at the ith station is gas[i].

     You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from the ith station to its next (i + 1)th station. You begin the journey with an empty tank at one of the gas stations.

     Given two integer arrays gas and cost, return the starting gas station's index if you can travel around the circuit once in the clockwise direction, otherwise return -1. If there exists a solution, it is guaranteed to be unique.

     Input: gas = [1,2,3,4,5], cost = [3,4,5,1,2]   Output: 3
     Explanation:
     Start at station 3 (index 3) and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
     Travel to station 4. Your tank = 4 - 1 + 5 = 8
     Travel to station 0. Your tank = 8 - 2 + 1 = 7
     Travel to station 1. Your tank = 7 - 3 + 2 = 6
     Travel to station 2. Your tank = 6 - 4 + 3 = 5
     Travel to station 3. The cost is 5. Your gas is just enough to travel back to station 3.
     Therefore, return 3 as the starting index.

     Input: gas = [2,3,4], cost = [3,4,3]   Output: -1
     Explanation:
     You can't start at station 0 or 1, as there is not enough gas to travel to the next station.
     Let's start at station 2 and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
     Travel to station 0. Your tank = 4 - 3 + 2 = 3
     Travel to station 1. Your tank = 3 - 3 + 3 = 3
     You cannot travel back to station 2, as it requires 4 unit of gas but you only have 3.
     Therefore, you can't travel around the circuit once no matter where you start.
     */
    func i51_m134_canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var totalGas = 0
        var totalCost = 0
        var tank = 0
        var start = 0

        for i in 0..<gas.count {
            totalGas += gas[i]
            totalCost += cost[i]
            tank += gas[i] - cost[i]

            if tank < 0 {
                start = i + 1
                tank = 0
            }
        }
        return totalGas >= totalCost ? start : -1
    }
    /* Medium 137. Single Number II
     Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.

     You must implement a solution with a linear runtime complexity and use only constant extra space.
     Input: nums = [2,2,3,2]            Output: 3
     Input: nums = [0,1,0,1,0,1,99]     Output: 99
     */
    func i52_m137_singleNumber(_ nums: [Int]) -> Int {
        var ones = 0
        var twos = 0

        for num in nums {
            ones = (ones ^ num) & ~twos
            twos = (twos ^ num) & ~ones
        }
        return ones
    }
    /* Medium 120. Triangle
     Given a triangle array, return the minimum path sum from top to bottom.
     For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.

     Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
     Output: 11
     Explanation: The triangle looks like:
     2
     3 4
     6 5 7
     4 1 8 3
     The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).
     Example 2:

     Input: triangle = [[-10]]
     Output: -10
     */

    func i53_m120_minimumTotal(_ triangle: [[Int]]) -> Int {
        var dp = triangle.last! // start with bottom row

        for i in stride(from: triangle.count - 2, through: 0, by: -1) {
            for j in 0..<triangle[i].count {
                dp[j] = triangle[i][j] + min(dp[j], dp[j + 1])
            }
        }
        return dp[0] // top element now holds the min path sum
    }
    /* Medium 166. Fraction to Recurring Decimal
     Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
     If the fractional part is repeating, enclose the repeating part in parentheses
     If multiple answers are possible, return any of them.
     It is guaranteed that the length of the answer string is less than 104 for all the given inputs.
     Note that if the fraction can be represented as a finite length string, you must return it.
     Input: numerator = 1, denominator = 2      Output: "0.5"
     Input: numerator = 2, denominator = 1      Output: "2"
     Input: numerator = 4, denominator = 333    Output: "0.(012)"
     */

    func i54_m166_fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        if numerator == 0 { return "0" }

        var result = ""

        // Handle negative sign
        if (numerator < 0) != (denominator < 0) {
            result.append("-")
        }

        // Convert to positive longs to handle overflow
        let num = Int64(abs(numerator))
        let den = Int64(abs(denominator))

        // Integer part
        result.append(String(num / den))
        var remainder = num % den
        if remainder == 0 {
            return result
        }

        result.append(".")
        var remainderIndex: [Int64: Int] = [:]
        var fractionPart = ""

        while remainder != 0 {
            // If we've seen this remainder before → recurring
            if let index = remainderIndex[remainder] {
                let start = fractionPart.index(fractionPart.startIndex, offsetBy: index)
                let recurringPart = fractionPart[start...]
                let nonRecurringPart = fractionPart[..<start]
                return result + nonRecurringPart + "(" + recurringPart + ")"
            }

            remainderIndex[remainder] = fractionPart.count
            remainder *= 10
            fractionPart.append(String(remainder / den))
            remainder %= den
        }

        return result + fractionPart
    }
    /*   Medium 172. Factorial Trailing Zeroes
     Given an integer n, return the number of trailing zeroes in n!.
     Note that n! = n * (n - 1) * (n - 2) * ... * 3 * 2 * 1.

     Input: n = 3       Output: 0  Explanation: 3! = 6, no trailing zero.
     Input: n = 5       Output: 1   Explanation: 5! = 120, one trailing zero.
     Input: n = 0       Output: 0
     */
    func i55_m172_trailingZeroes(_ n: Int) -> Int {
        var count = 0
        var num = n
        while num > 0 {
            num /= 5
            count += num
        }
        return count
    }
    /*  Medium 187. Repeated DNA Sequences
     The DNA sequence is composed of a series of nucleotides abbreviated as 'A', 'C', 'G', and 'T'.

     For example, "ACGAATTCCG" is a DNA sequence.
     When studying DNA, it is useful to identify repeated sequences within the DNA.

     Given a string s that represents a DNA sequence, return all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule. You may return the answer in any order.

     Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"       Output: ["AAAAACCCCC","CCCCCAAAAA"]
     Input: s = "AAAAAAAAAAAAA"                            Output: ["AAAAAAAAAA"]
     */

    func i56_m187_findRepeatedDnaSequences(_ s: String) -> [String] {
        let length = 10
        guard s.count > length else { return [] }

        var seen = Set<String>()
        var repeated = Set<String>()
        let chars = Array(s)

        for i in 0...(chars.count - length) {
            let substring = String(chars[i..<i + length])
            if seen.contains(substring) {
                repeated.insert(substring)
            } else {
                seen.insert(substring)
            }
        }

        return Array(repeated)
    }
    /* Medium 189. Rotate Array
     Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.
     Input: nums = [1,2,3,4,5,6,7], k = 3   Output: [5,6,7,1,2,3,4]
     Explanation:
     rotate 1 steps to the right: [7,1,2,3,4,5,6]
     rotate 2 steps to the right: [6,7,1,2,3,4,5]
     rotate 3 steps to the right: [5,6,7,1,2,3,4]

     Input: nums = [-1,-100,3,99], k = 2         Output: [3,99,-1,-100]
     Explanation:
     rotate 1 steps to the right: [99,-1,-100,3]
     rotate 2 steps to the right: [3,99,-1,-100]
     */
    func i57_m189_rotate(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        let k = k % n // handle cases where k > n

        func reverse(_ start: Int, _ end: Int) {
            var i = start, j = end
            while i < j {
                nums.swapAt(i, j)
                i += 1
                j -= 1
            }
        }

        reverse(0, n - 1)       // Step 1: reverse entire array
        reverse(0, k - 1)       // Step 2: reverse first k elements
        reverse(k, n - 1)       // Step 3: reverse rest
    }
    func rotate1(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        let k = k % n
        nums = Array(nums[n - k..<n] + nums[0..<n - k])
    }
    /*  Medium 200. Number of Islands
     Given an m x n 2D binary grid, which represents a map of '1's (land) and '0's (water), return the number of islands.

     An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
     Input: grid = [
     ["1","1","1","1","0"],
     ["1","1","0","1","0"],
     ["1","1","0","0","0"],
     ["0","0","0","0","0"]
     ]                          Output: 1

     Input: grid = [
     ["1","1","0","0","0"],
     ["1","1","0","0","0"],
     ["0","0","1","0","0"],
     ["0","0","0","1","1"]
     ]                          Output: 3
     */

    func i58_m200_numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        guard !grid.isEmpty else { return 0 }
        let rows = grid.count
        let cols = grid[0].count
        var count = 0

        func dfs(_ r: Int, _ c: Int) {
            // Boundary check
            guard r >= 0, c >= 0, r < rows, c < cols, grid[r][c] == "1" else { return }
            grid[r][c] = "0" // mark visited
            // Explore 4 directions
            dfs(r + 1, c)
            dfs(r - 1, c)
            dfs(r, c + 1)
            dfs(r, c - 1)
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == "1" {
                    count += 1
                    dfs(r, c)
                }
            }
        }

        return count
    }
    /*  Medium 204. Count Primes
     Given an integer n, return the number of prime numbers that are strictly less than n.
     Input: n = 10  Output: 4
     Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
     Input: n = 0   Output: 0
     Input: n = 1   Output: 0
     */
    func i59_m204_countPrimes(_ n: Int) -> Int {
        if n <= 2 { return 0 }

        var isPrime = Array(repeating: true, count: n)
        isPrime[0] = false
        isPrime[1] = false

        var i = 2
        while i * i < n {
            if isPrime[i] {
                var j = i * i
                while j < n {
                    isPrime[j] = false
                    j += i
                }
            }
            i += 1
        }
        return isPrime.filter { $0 }.count
    }
    /*  Medium 207. Course Schedule
     There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

     For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
     Return true if you can finish all courses. Otherwise, return false.

     Input: numCourses = 2, prerequisites = [[1,0]]      Output: true
     Explanation: There are a total of 2 courses to take.
     To take course 1 you should have finished course 0. So it is possible.
     Example 2:

     Input: numCourses = 2, prerequisites = [[1,0],[0,1]]   Output: false
     Explanation: There are a total of 2 courses to take.
     To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
     */
    func i60_m207_canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = Array(repeating: [Int](), count: numCourses)
        var inDegree = Array(repeating: 0, count: numCourses)

        // Build graph and in-degree count
        for pre in prerequisites {
            let course = pre[0]
            let prereq = pre[1]
            graph[prereq].append(course)
            inDegree[course] += 1
        }

        // Start with courses having no prerequisites
        var queue = [Int]()
        for i in 0..<numCourses {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }

        var completed = 0

        // Process the queue
        while !queue.isEmpty {
            let course = queue.removeFirst()
            completed += 1

            for next in graph[course] {
                inDegree[next] -= 1
                if inDegree[next] == 0 {
                    queue.append(next)
                }
            }
        }

        return completed == numCourses
    }
    /* Medium 209. Minimum Size Subarray Sum
     Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

     Input: target = 7, nums = [2,3,1,2,4,3]    Output: 2
     Explanation: The subarray [4,3] has the minimal length under the problem constraint.
     Input: target = 4, nums = [1,4,4]       Output: 1
     Input: target = 11, nums = [1,1,1,1,1,1,1,1]   Output: 0
     */

    func i61_m209_minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0
        var sum = 0
        var minLength = Int.max

        for right in 0..<nums.count {
            sum += nums[right]

            while sum >= target {
                minLength = min(minLength, right - left + 1)
                sum -= nums[left]
                left += 1
            }
        }

        return minLength == Int.max ? 0 : minLength
    }
    /* Medium 210. Course Schedule II
     There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

     For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
     Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.

     Input: numCourses = 2, prerequisites = [[1,0]]     Output: [0,1]
     Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0. So the correct course order is [0,1].

     Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]   Output: [0,2,1,3]
     Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
     So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3].

     Input: numCourses = 1, prerequisites = []     Output: [0]
     */
    func i62_m210_findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph = Array(repeating: [Int](), count: numCourses)
        var inDegree = Array(repeating: 0, count: numCourses)

        // Build graph
        for pair in prerequisites {
            let course = pair[0]
            let prereq = pair[1]
            graph[prereq].append(course)
            inDegree[course] += 1
        }

        // Start with courses having no prerequisites
        var queue = [Int]()
        for i in 0..<numCourses {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }

        var order = [Int]()

        // BFS - Kahn’s Algorithm
        while !queue.isEmpty {
            let course = queue.removeFirst()
            order.append(course)

            for next in graph[course] {
                inDegree[next] -= 1
                if inDegree[next] == 0 {
                    queue.append(next)
                }
            }
        }

        return order.count == numCourses ? order : []
    }


}
