//
//  Stack.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 18/08/25.
//

import Foundation

struct DStack {
    /* Medium 150. Evaluate Reverse Polish Notation
     You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.

     Evaluate the expression. Return an integer that represents the value of the expression.

     Note that:

     The valid operators are '+', '-', '*', and '/'.
     Each operand may be an integer or another expression.
     The division between two integers always truncates toward zero.
     There will not be any division by zero.
     The input represents a valid arithmetic expression in a reverse polish notation.
     The answer and all the intermediate calculations can be represented in a 32-bit integer.

     Input: tokens = ["2","1","+","3","*"]       Output: 9
     Explanation: ((2 + 1) * 3) = 9
     Input: tokens = ["4","13","5","/","+"]     Output: 6
     Explanation: (4 + (13 / 5)) = 6

     Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]  Output: 22
     Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
     = ((10 * (6 / (12 * -11))) + 17) + 5
     = ((10 * (6 / -132)) + 17) + 5
     = ((10 * 0) + 17) + 5
     = (0 + 17) + 5
     = 17 + 5
     = 22
     */
    func ST1_m_150_evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []
        
        for token in tokens {
            if let num = Int(token) {
                stack.append(num)
            } else {
                let b = stack.removeLast()
                let a = stack.removeLast()
                var res = 0
                switch token {
                case "+": res = a + b
                case "-": res = a - b
                case "*": res = a * b
                case "/": res = a / b  // Swift integer division truncates toward 0
                default: break
                }
                stack.append(res)
            }
        }
        return stack.last!
    }
    /* Medium 853. Car Fleet
     There are n cars at given miles away from the starting mile 0, traveling to reach the mile target.
     You are given two integer arrays position and speed, both of length n, where position[i] is the starting mile of the ith car and speed[i] is the speed of the ith car in miles per hour.
     A car cannot pass another car, but it can catch up and then travel next to it at the speed of the slower car.
     A car fleet is a single car or a group of cars driving next to each other. The speed of the car fleet is the minimum speed of any car in the fleet.
     If a car catches up to a car fleet at the mile target, it will still be considered as part of the car fleet.
     Return the number of car fleets that will arrive at the destination.
     Input: target = 12, position = [10,8,0,5,3], speed = [2,4,1,1,3]   Output: 3

     Explanation:
     The cars starting at 10 (speed 2) and 8 (speed 4) become a fleet, meeting each other at 12. The fleet forms at target.
     The car starting at 0 (speed 1) does not catch up to any other car, so it is a fleet by itself.
     The cars starting at 5 (speed 1) and 3 (speed 3) become a fleet, meeting each other at 6. The fleet moves at speed 1 until it reaches target.

     Input: target = 10, position = [3], speed = [3]     Output: 1
     Explanation:
     There is only one car, hence there is only one fleet.

     Input: target = 100, position = [0,2,4], speed = [4,2,1]   Output: 1
     Explanation:
     The cars starting at 0 (speed 4) and 2 (speed 2) become a fleet, meeting each other at 4. The car starting at 4 (speed 1) travels to 5.
     Then, the fleet at 4 (speed 2) and the car at position 5 (speed 1) become one fleet, meeting each other at 6. The fleet moves at speed 1 until it reaches target.

     */
    func ST2_853_carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var stack: [Double] = []
        let cars = zip(position, speed).sorted(by: { $0.0 > $1.0 })
        for (p, s) in cars {
            let time = (Double(target) - Double(p)) / Double(s)
            if stack.isEmpty || stack.last ?? 0.0 < time {
                stack.append(time)
            }
        }
        return stack.count
    }
    func ST3_1249_minRemoveToMakeValid(_ s: String) -> String {
        var stackArr = [Int]()
        var ansStr: String = ""
        let strArray = Array(s)
        
        for i in 0..<strArray.count {
            if strArray[i] == "(" {
                //print("bracket")
                stackArr.append(i+1);
            } else if strArray[i] == ")" {
                //print("closing bracket -- \(strArray.count)")
                if stackArr.count > 0, stackArr.last ?? 0 > 0 {
                    let _ = stackArr.popLast();
                } else {
                    //print("bracket ex")
                    stackArr.append(-(i+1))
                }
            }
            //print("here = i \(i) --\(stackArr)")
        }
        var j = 0
        
        for i in 0..<strArray.count {
            if j < stackArr.count, abs(stackArr[j]) == i + 1 {
                j+=1;
                continue
            }
            //print("uuu")
            ansStr.append(strArray[i]);
            //print(ansStr )
            
        }
        return ansStr
        
    }
    func ST4_20__validParenthese(_ s: String) -> Bool {
        // A quick check for odd length strings - they can never be valid
        if s.count % 2 != 0 {
            return false
        }
        
        var stack: [Character] = [] // Using a Swift Array as a stack
        
        // A dictionary to quickly check for matching pairs
        let matchingBrackets: [Character: Character] = [
            ")": "(",
            "}": "{",
            "]": "["
        ]
        
        for char in s {
            switch char {
            case "(", "{", "[":
                // It's an opening bracket, push it onto the stack
                stack.append(char)
            case ")", "}", "]":
                // It's a closing bracket
                
                guard let lastOpenBracket = stack.popLast(), // Try to pop the last opened bracket
                      lastOpenBracket == matchingBrackets[char] else { // Check if it matches
                    // Stack was empty or the popped bracket doesn't match
                    return false
                }
                // debugPrint(lastOpenBracket,matchingBrackets[char] ?? ??)
            default:
                // If the string contains any other characters (not specified in problem, but good practice)
                return false
            }
        }
        
        // After iterating through the string, the stack should be empty if all brackets matched
        return stack.isEmpty
    }
    func S5_84_largestRectangleArea(_ heights: [Int]) -> Int {
        let heights = heights + [0]
        var stack = [(i: Int, h: Int)](), result = 0
        for i in 0..<heights.count {
            var start = i
            while !stack.isEmpty && stack.last!.h >= heights[i] {
                let last = stack.removeLast()
                result = max(result, (i - last.i) * last.h)
                start = last.i
            }
            stack.append((start, heights[i]))
        }
        return result
    }
    
    func S6_32_longestValidParentheses_1(_ s: String) -> Int {
        // let a = Array(s)
        // var left = 0, right = 0, ans = 0
        
        // // left -> right
        // for ch in a {
        //     if ch == "(" { left += 1 } else { right += 1 }
        //     if left == right { ans = max(ans, 2 * right) }
        //     else if right > left { left = 0; right = 0 }
        // }
        
        // // right -> left
        // left = 0; right = 0
        // for ch in a.reversed() {
        //     if ch == "(" { left += 1 } else { right += 1 }
        //     if left == right { ans = max(ans, 2 * left) }
        //     else if left > right { left = 0; right = 0 }
        // }
        // return ans
        
        let a = Array(s)
        var left = 0, right = 0, ans = 0
        
        for c in a {
            if c == "(" {
                left += 1
            } else {
                right += 1
            }
            
            if left == right {
                ans = max(ans, left * 2)
            } else if right > left {
                left = 0
                right = 0
            }
        }
        
        left = 0
        right = 0
        for c in a.reversed() {
            if c == "(" {
                left += 1
            } else {
                right += 1
            }
            
            if left == right {
                ans = max(ans, left * 2)
            } else if left > right {
                left = 0
                right = 0
            }
        }
        
        return ans
    }
    func S6_32_longestValidParentheses_2(_ s: String) -> Int {
        var stack: [Int] = [-1]  // base index
        var maxLen = 0
        let chars = Array(s)
        
        for i in 0..<chars.count {
            if chars[i] == "(" {
                stack.append(i)
            } else {
                stack.removeLast()
                if stack.isEmpty {
                    stack.append(i)  // reset base
                } else {
                    maxLen = max(maxLen, i - stack.last!)
                }
            }
        }
        
        return maxLen
    }
    
    
    
}
