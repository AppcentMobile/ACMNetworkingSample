//
//  BaseViewModel.swift
//

import ACMNetworking

class BaseViewModel {
    var network: ACMNetworking!

    init() {
        network = ACMNetworking()
    }
}
