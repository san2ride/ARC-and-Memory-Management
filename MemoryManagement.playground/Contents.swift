//: Playground - noun: a place where people can play

import UIKit

// The lifetime of a Swift object consists of five stages:
//// 1 Allocation (memory taken from stack or heap)
//// 2 Initialization (init code runs)
//// 3 Usage (the objects is used)
//// 4 Deinitialization (deinit code runs)
//// 5 Deallocation (memory returned to stack or heap)

class User {
    var name: String
    
    init(name: String) {
        self.name = name
        print("User \(name) is initialized")
    }
    
    private(set) var phones:[Phone] = []
    func add(phone: Phone) {
        phones.append(phone)
        phone.owner = self
    }
    deinit {
        print("User \(name) is being deallocated")
    }
}

class Phone {
    let model: String
    weak var owner: User?
    
    init(model: String) {
        self.model = model
        print("Phone \(model) is initialized")
    }
    
    deinit {
        print("Phone \(model) is being deallocated")
    }
}

do {
  let user1 = User(name: "John")
  let iPhone = Phone(model: "iPhone 6s Plus")
  user1.add(phone: iPhone)
}
