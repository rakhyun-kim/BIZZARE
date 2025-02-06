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
    @Published var filteredProducts: [Product] = []
    
    init() {
        searchResults = products
        filteredProducts = products
    }
    
    func filterProducts(by category: String) {
        if category == "ALL" {
            filteredProducts = products
        } else {
            filteredProducts = products.filter { $0.category == category }
        }
    }
    
    func searchProducts(query: String) {
        if query.isEmpty {
            searchResults = filteredProducts
        } else {
            searchResults = filteredProducts.filter { product in
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