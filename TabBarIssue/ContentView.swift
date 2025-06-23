//
//  ContentView.swift
//  TabBarIssue
//
//  Created by James Valaitis on 20/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview("Triple Layer - Level 1 - Working") {
    NavigationStack {
        NavigationView {
            TabView {
                NavigationView {
                    ContentView()
                        .fullBackground(.pink)
                }
                .tabItem1()
                
                NavigationView {
                    ContentView()
                        .fullBackground(.green)
                }
                .tabItem2()
            }
        }
        .homeToolbar()
    }
}

#Preview("Triple Layer - Level 2 - Working") {
    NavigationStack {
        NavigationView {
            TabView {
                NavigationView {
                    ContentView()
                        .fullBackground(.pink)
                }
                .tabItem1()
                
                NavigationView {
                    ContentView()
                        .fullBackground(.green)
                }
                .tabItem2()
            }
            .homeToolbar()
        }
    }
}

#Preview("Triple Layer Broken - Level 3 - Broken") {
    NavigationStack {
        NavigationView {
            TabView {
                NavigationView {
                    ContentView()
                        .fullBackground(.pink)
                }
                .tabItem1()
                .homeToolbar()
                
                NavigationView {
                    ContentView()
                        .fullBackground(.green)
                }
                .tabItem2()
                .homeToolbar()
            }
        }
    }
}

#Preview("Triple Layer Broken - Level 4 - Broken (Extra Space)") {
    NavigationStack {
        NavigationView {
            TabView {
                NavigationView {
                    ContentView()
                        .fullBackground(.pink)
                        .homeToolbar()
                }
                .tabItem1()
                
                NavigationView {
                    ContentView()
                        .fullBackground(.green)
                        .homeToolbar()
                }
                .tabItem2()
            }
        }
    }
}

#Preview("Double Layer - Level 1 - Working") {
    NavigationView {
        TabView {
            NavigationView {
                ContentView()
                    .fullBackground(.pink)
            }
            .tabItem1()
            
            NavigationView {
                ContentView()
                    .fullBackground(.green)
            }
            .tabItem2()
        }
        .homeToolbar()
    }
}

#Preview("Double Layer - Level 2 - Broken (Multiplies Items)") {
    NavigationView {
        TabView {
            NavigationView {
                ContentView()
                    .fullBackground(.pink)
            }
            .tabItem1()
            .homeToolbar()
            
            NavigationView {
                ContentView()
                    .fullBackground(.green)
            }
            .tabItem2()
            .homeToolbar()
        }
    }
}

#Preview("Double Layer - Level 3 - Working") {
    NavigationView {
        TabView {
            NavigationView {
                ContentView()
                    .fullBackground(.pink)
                    .homeToolbar()
            }
            .tabItem1()
            
            NavigationView {
                ContentView()
                    .fullBackground(.green)
                    .homeToolbar()
            }
            .tabItem2()
        }
    }
}

extension View {
    func homeToolbar() -> some View {
        toolbar {
            ToolbarItem(placement: .navigation) {
                Button("", systemImage: "square.and.pencil") {
                    
                }
            }
            ToolbarItem(placement: .navigation) {
                Button("", systemImage: "square.and.arrow.down") {
                    
                }
            }
        }
    }
    
    func tabItem1() -> some View {
        tabItem {
            Label { Text("Test 1") } icon: {
                Image(systemName: "figure.climbing")
            }
        }
    }
    
    func tabItem2() -> some View {
        tabItem {
            Label {
                Text("Test 2")
            } icon: {
                Image(systemName: "figure.run")
            }
        }
    }
    
    func fullBackground(_ color: Color) -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color.opacity(0.2))
    }
    
}
