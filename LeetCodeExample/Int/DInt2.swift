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

     Example 1: Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]   Output: [[7,4,1],[8,5,2],[9,6,3]]
     */
    func i38_m48_rotate(_ matrix: inout [[Int]]) {
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
    /*
     Medium 53. Maximum Subarray
     Given an integer array nums, find the subarray with the largest sum, and return its sum.
     Example 1: Input: nums = [-2,1,-3,4,-1,2,1,-5,4]   Output: 6
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
     Example 1:

     Input: nums = [2,3,1,1,4]
     Output: true
     Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
     Example 2:

     Input: nums = [3,2,1,0,4]
     Output: false
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
     Example 1:

     Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
     Output: [[1,6],[8,10],[15,18]]
     Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
     Example 2:

     Input: intervals = [[1,4],[4,5]]
     Output: [[1,5]]
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
     Example 1:
     Input: m = 3, n = 7
     Output: 28
     */

    func i44_m62_uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
        for i in 1..<m { // Row
            for j in 1..<n { // Column
                dp[i][j] = dp[i][j+1] + dp[i+1][j]
                debugPrint(i,j)
                debugPrint(dp[i][j])
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
     Example 1:

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
}
