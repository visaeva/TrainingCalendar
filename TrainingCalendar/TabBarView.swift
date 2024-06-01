import SwiftUI

struct TabBarView: View {
    @State private var selection: Tab = .contentView
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Home")
                .tag(Tab.home)
                .tabItem {
                    Image("home")
                    Text("Home")
                        .font(.system(size: 10))
                }
            ContentView()
                .tag(Tab.contentView)
                .tabItem {
                    Image("calendar")
                    Text("Plan")
                        .font(.system(size: 10))
                }
            Text("Coach")
                .tag(Tab.coach)
                .tabItem {
                    Image("coach")
                    Text("Coach")
                        .font(.system(size: 10))
                }
            Text("Profile")
                .tag(Tab.profile)
                .tabItem {
                    Image("profile")
                    Text("Profile")
                        .font(.system(size: 10))
                }
        }
        .background(Color.blackBack)
    }
    
    enum Tab {
        case home
        case contentView
        case coach
        case profile
    }
}

#Preview {
    TabBarView()
}
