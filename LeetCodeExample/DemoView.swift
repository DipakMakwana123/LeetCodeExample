//
//  DemoView.swift
//  LeetCodeExample
//
//  Created by Dipak Makwana on 01/01/26.
//

import SwiftUI
enum SectionType: String, CaseIterable, Identifiable {
    case overview, details, reviews
    var id: String { rawValue }
}
struct Item: Identifiable {
    let id: UUID
    var isOn: Bool
}



struct SyncedScrollView: View {
    @State private var selectedSection: SectionType? = .overview
    @State private var items = [Item]()
    var body: some View {
        VStack {
            ForEach($items) { $item in
                Toggle("Enabled", isOn: $item.isOn)
            }
        }
//        VStack(spacing: 0) {
//            // Segmented Control
//            Picker("Sections", selection: $selectedSection) {
//                ForEach(SectionType.allCases) { section in
//                    Text(section.rawValue.capitalized)
//                        .tag(section as SectionType?)
//                }
//            }
//            .pickerStyle(.segmented)
//            .padding()
//            // Scroll View
//            ScrollView {
//                LazyVStack(alignment: .leading, spacing: 32) {
//                    ForEach(SectionType.allCases) { section in
//                        sectionView(section)
//                            .id(section)
//                            .scrollTargetLayout()
//                    }
//                }
//                .padding()
//            }
//            .scrollPosition(id: $selectedSection, anchor: .top)
//        }
    }
    @ViewBuilder
    private func sectionView(_ section: SectionType) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(section.rawValue.capitalized)
                .font(.title.bold())
            ForEach(0..<10) { i in
                Text("\(section.rawValue) item \(i)")
                    .padding(.vertical, 4)
            }
        }
    }
}

#Preview {
    SyncedScrollView()
}

struct ListView: View {
    var body: some View {
        VStack {
            List {
                Section(content: {
                    Text("Header")
                })
                ForEach(0..<10) { index in
                    Text("\(index + 1 )")
                }
                Section(content: {
                    Text("Header1")
                })
                ForEach(0..<10) { index in
                    Text("\(index + 1 )")
                }
            }
            .listStyle(.insetGrouped)
        }
    }
}

struct FullscreenStickyView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                ScrollView {
                    LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                        Section(header: HeaderView()) {
                            ForEach(0..<40) { i in
                                Text("Row \(i)")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                            }
                        }
                    }
                }
                .ignoresSafeArea(edges: .top)
            }
            .navigationBarHidden(true)
        }
    }
}

struct HeaderView: View {
    var body: some View {
        Text("Sticky Header")
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
    }
}

struct ContentView1: View {
    @State private var isPinned = false
    let headerHeight: CGFloat = 56
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                Section(
                    header: HeaderView1(isPinned: $isPinned)
                )
                {
                    ForEach(0..<50) { index in
                        Text("Row \(index)")
                            .padding()
                          //  .background(.red)
                    }
                }
            }

        }
//        .safeAreaInset(edge: .top) {
//            HeaderView(isPinned: $isPinned)
      //  }

    }
}
struct HeaderView1: View {
    @Binding var isPinned: Bool

    var body: some View {
        VStack(spacing: 0) {
            Color.white.opacity(1).frame(height: 56)
            Text("Sticky Header")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .shadow(color: .black.opacity(isPinned ? 0.2 : 0),
                        radius: 6, y: 2) //
        }
        .padding(.top,-70)
    }
}
