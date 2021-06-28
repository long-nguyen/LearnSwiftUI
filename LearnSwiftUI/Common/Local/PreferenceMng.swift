//
//  LocalDataMng.swift
//  Template
//
//  Created by Nguyen Tien LONG on 5/28/19.
//  Copyright © 2019 Active User Co.,LTD. All rights reserved.
//

import Foundation
import Combine

fileprivate let KEY_ORDERS = "KEY_ORDER_DATA"
fileprivate let KEY_TOKEN = "KEY_ACCESS_TOKEN"

class PreferenceMng: ObservableObject {
    static let instance = PreferenceMng()
    
    private init() {
        //Load every variables here
        self.loadOrder()
    }
    
    @Published var order: Order = Order() {
        didSet {
            setOrder(od: order)
        }
    }
    //Simple variable can be like this
    @Published var token: String? = UserDefaults.standard.string(forKey: KEY_TOKEN) {
        didSet {
            UserDefaults.standard.set(self.token, forKey: KEY_TOKEN)
        }
    }

    func reset() {
        token = nil
        order = Order()
    }
    
    private func loadOrder() {
        let decoder = JSONDecoder()
        if let ords = UserDefaults.standard.data(forKey: KEY_ORDERS), let parsedOr = try? decoder.decode(Order.self, from: ords) {
            order = parsedOr
        } else {
            order = Order()
        }
    }
    
    private func setOrder(od: Order) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(od) {
            UserDefaults.standard.set(encoded, forKey: KEY_ORDERS)
        }
    }
}
