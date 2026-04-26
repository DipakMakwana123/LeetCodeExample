//
//  ContentView.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 05/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: LeetCodeViewModel
    
    init(leetCodeViewModel: LeetCodeViewModel) {
        _viewModel = StateObject(wrappedValue: LeetCodeViewModel())
    }
    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(viewModel.data, id: \.id) { item in
                    Text(item.title)
                }
            }
        }
        .onAppear {
            viewModel.minStops()
        }
        .padding()
    }

    func findGroupAnagram(_ s: [String])   {

        var map1 = [String: [String]]()
        for subStr in s {
            var map = [Character: Int]()
            for ch in subStr {
                map[ch,default: 0] += 1
            }
            var str = ""
            for ch in map.keys {
                if let cnt = map[ch] {
                    str += ("\(ch)\(cnt)")          }
            }
            map1[str, default: []].append(subStr)
            print(map1.values)
        }
    }
}

#Preview {
    ContentView(leetCodeViewModel: LeetCodeViewModel())
}

