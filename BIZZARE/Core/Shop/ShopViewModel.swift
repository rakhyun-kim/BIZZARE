import Foundation

class ShopViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(name: "Basic T-Shirt", price: 29.99, imageURL: "tshirt", category: "TOP"),
        Product(name: "Denim Jeans", price: 89.99, imageURL: "jeans", category: "BOTTOM"),
        Product(name: "Sneakers", price: 119.99, imageURL: "sneakers", category: "SHOES"),
        Product(name: "Watch", price: 299.99, imageURL: "watch", category: "ACCESSORIES")
    ]
    @Published var cartItems: [Product] = []
    @Published var searchResults: [Product] = []
    
    init() {
        // 초기 검색 결과를 전체 상품으로 설정
        searchResults = products
    }
    
    func searchProducts(query: String) {
        if query.isEmpty {
            searchResults = products
        } else {
            searchResults = products.filter { product in
                product.name.lowercased().contains(query.lowercased()) ||
                product.category.lowercased().contains(query.lowercased())
            }
        }
    }
    
    func addToCart(product: Product) {
        cartItems.append(product)
    }
    
    func removeFromCart(product: Product) {
        cartItems.removeAll { $0.id == product.id }
    }
} 