//
//  ContentView.swift
//  ncx-Alfieri
//
//  Created by luca d'angelo on 23/03/22.
//

import SwiftUI
struct ContentView: View {
    @State var countries = [Country]()
    @State var isPresenting : Bool = false
    @State var isDownloading: Bool = false
    
    var body: some View {
        NavigationView {
            if (isDownloading == false) {
                VStack {
                    Text("Tap to download!").font(.system(size: 30))
                        .fontWeight(.bold)
                    ZStack {
                        NonModalButton(isPresenting: $isPresenting, isDownloading: $isDownloading).frame(width: 150, height: 150, alignment: .center)
                    }
                }.onAppear {
                    Task {
                        await getcountriesData()
                    }
                }
                .navigationTitle("Welcome")
            } else {
                List(countries, id:\.self) {
                    country in
                    
                    HStack(spacing: 10) {
                        Text(country.name).bold()
                        
                        Spacer()
                        
                        Text("\(country.population)")
                            .bold()
                    }
                    
                }
                .navigationTitle("Countries")
            }
        }
        
    }
}


struct tryView : View {
    @State var circle = circles(diameter: 150, isAnimated: false)
    var body: some View {
        
        ZStack {
            animationView(circle: $circle)
        }.onAppear{
            withAnimation(Animation.linear(duration: 3.0).repeatForever(autoreverses: true)){
                circle.isAnimated = true
                circle.diameter = 270
            }
        }
    }
}


struct downloadingView : View {
    @State private var downloadAmount = 0.0
    @State var x : CGFloat = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    
    let lightPurple = Color(red: 156/255, green: 16/255, blue: 179/255)
    let darkPurple = Color(red: 11/255, green: 13/255, blue: 50/255)
    let lightTeal = Color(red: 6/256, green: 243/256, blue: 232/256)
    
    var body: some View {
        
        VStack {
            ZStack {
                ProgressView("", value:downloadAmount, total: 100)
                    .accentColor(darkPurple)
                    .scaleEffect(x: 1, y: 4, anchor: .center)
                .padding()           }
            .onReceive(timer) { _ in
                
                if downloadAmount < 100 {
                    downloadAmount += 10
                    ViewModel.shared.downloadAmount = downloadAmount
                }else {
                    ViewModel.shared.isDownloaded = true
                }
            }
        }
    }
    
    
    func stamp () {
        print("\(ViewModel.shared.downloadAmount)")
    }
    
}

struct circles {
    
    var diameter : CGFloat
    var isAnimated : Bool
}


struct animationView : View {
    
    @Binding var circle : circles
    
    
    var body : some View {
        
        if #available(iOS 15.0, *) {
            Circle()
                .foregroundColor(.red)
                .frame(width: circle.diameter, height: circle.diameter, alignment: .center)
        } else {
            // Fallback on earlier versions
        }
    }
}

extension ContentView {
    func getcountriesData () async {
        Task {
            let countries = try? await Network().getCountries1()
            DispatchQueue.main.async {
                self.countries = countries ?? [Country] ()
            }
        }
    }
    
}


