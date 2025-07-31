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
        _viewModel = StateObject(wrappedValue: LeetCodeViewModel(leetCode: LeetCode()))
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
            viewModel.minWindow()
            
        }
        .padding()
    }
    
    
}

#Preview {
    ContentView(leetCodeViewModel: LeetCodeViewModel(leetCode: LeetCode()))
}
