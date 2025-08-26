//
//  Stack.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 18/08/25.
//

import Foundation

struct DStack {
    func ST1_evalRPN(_ tokens: [String]) -> Int {
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
