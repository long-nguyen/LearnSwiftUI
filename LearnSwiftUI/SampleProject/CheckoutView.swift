//
//  CheckoutView.swift
//  LearnSwiftUI
//
//  Created by Nguyen Tien Long on 7/19/20.
//  Copyright © 2020 Nguyen Tien Long. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    let paymentTypes = ["Cash", "Credit card", "Point"]
    let tipAmmounts = [0, 10, 20, 30]
    
    //biến state là biến trạng thái của view. View dựa vào nó để tự thay đổi trạng thái của mình
    //State thì chỉ dành cho 1 loại view, nên chỉ được phép private thôi, tránh public ra ngoài
    //CÒn ObservedObject thfi cũng giống sate nhưng dùng global, xuyên suốt các view khác nhau. Sẽ cần 1 cái là @published trong nó để biết data nào thay đổi
    //EnvironmentObject cũng giống 2 loại trên nhưng ở tầm global cho cả app, lấy ở đâu cũng dc. Có thể là biến user chẳng hạn
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAm = 0
    @State private var showingPaymentAlert = false
    
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tip = total * Double(tipAmmounts[tipAm]) / 100
        return total + tip
    }
    
    var body: some View {
        Form {
            Section {
                //Biến $paymentType để nó biết mà update
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(0..<paymentTypes.count) {
                        Text(self.paymentTypes[$0])
                    }
                }
                Toggle(isOn : $addLoyaltyDetails) {
                    Text("Add loyalty number")
                }
                if addLoyaltyDetails {
                    //Khi toggle thay đổi bên trong thì cái text này đổi
                    TextField("Enter your loyalty number", text: $loyaltyNumber)
                }
                
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage ", selection:$tipAm) {
                    ForEach(0..<self.tipAmmounts.count) {
                        Text("\(self.tipAmmounts[$0]) %")
                    }
                }
            }
            
            Section(header: Text("Total $\(totalPrice, specifier: "%.2f")").font(.headline).foregroundColor(.primary)) {
                Button("Confirm order") {
                    self.showingPaymentAlert = true
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("total $\(totalPrice, specifier: "%.2f")"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
