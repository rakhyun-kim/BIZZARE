import SwiftUI

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            // 상품 이미지
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Text("Image")
                        .foregroundColor(.gray)
                )
            
            // 상품 정보
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.subheadline)
                    .lineLimit(2)
                
                Text("₩\(Int(product.price))")
                    .font(.headline)
                    .bold()
            }
            .padding(.vertical, 8)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

#Preview {
    ProductCard(product: Product(
        name: "Sample Product",
        price: 99.99,
        imageURL: "sample_image",
        category: "ALL"
    ))
    .frame(width: 200)
    .padding()
} 