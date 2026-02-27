//
//  ContentView.swift
//  MyApps-docs
//
//  Created by Josblais on 2026-02-27.
//

import SwiftUI

struct DocSection: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let color: Color
    let description: String
    let url: URL
}

struct ContentView: View {
    @Binding var document: MyApps_docsDocument
    @Environment(\.openURL) private var openURL
    
    let sections = [
        DocSection(
            name: "MyBusiness",
            imageName: "MyBusiness",
            color: .blue,
            description: "Gestion d'entreprise et facturation",
            url: URL(string: "https://josbine63.github.io/MyBusiness-docs/")!
        ),
        DocSection(
            name: "MyPhotos",
            imageName: "MyPhotos",
            color: .purple,
            description: "Organisation et édition de photos",
            url: URL(string: "https://josbine63.github.io/MyPhotos-docs/")!
        ),
        DocSection(
            name: "MyMoney",
            imageName: "MyMoney",
            color: .green,
            description: "Suivi des finances personnelles",
            url: URL(string: "https://josbine63.github.io/MyMoney-docs/")!
        ),
        DocSection(
            name: "MyDay",
            imageName: "MyDay",
            color: .orange,
            description: "Planification et tâches quotidiennes",
            url: URL(string: "https://josbine63.github.io/MyDay-docs/")!
        )
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Image("JBDeveloper")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    Text("MyApps Documentation")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Cliquez sur une carte pour ouvrir la documentation")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 40)
                
                // Grid of sections
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16) {
                    ForEach(sections) { section in
                        Button {
                            openURL(section.url)
                        } label: {
                            DocCardView(section: section)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 40)
        }
        .background(Color(nsColor: .windowBackgroundColor))
    }
}

struct DocCardView: View {
    let section: DocSection
    
    var body: some View {
        VStack(spacing: 16) {
            Image(section.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(spacing: 4) {
                Text("\(section.name)-docs")
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Text(section.description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(nsColor: .controlBackgroundColor))
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(section.color.opacity(0.3), lineWidth: 1)
        )
    }
}

#Preview {
    ContentView(document: .constant(MyApps_docsDocument()))
        .frame(width: 800, height: 600)
}
