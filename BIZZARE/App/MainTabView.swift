import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("HOME")
                }
                .tag(0)
            
            ShopView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("SHOP")
                }
                .tag(1)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("PROFILE")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainTabView()
} 