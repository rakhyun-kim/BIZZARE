import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = ShopViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.cartItems) { item in
                    HStack {
                        // 상품 이미지
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 80, height: 80)
                        
                        // 상품 정보
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text("₩\(Int(item.price))")
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        // 삭제 버튼
                        Button(action: {
                            viewModel.removeFromCart(product: item)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("장바구니")
            .navigationBarItems(trailing: Button("닫기") {
                dismiss()
            })
            
            // 결제 버튼
            if !viewModel.cartItems.isEmpty {
                VStack {
                    Button(action: {
                        // 결제 로직 구현
                    }) {
                        Text("결제하기")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    CartView()
} 