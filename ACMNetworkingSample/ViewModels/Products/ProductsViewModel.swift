//
//  ProductsViewModel.swift
//

import ACMNetworking

typealias ProductCallback = ((ProductResponse) -> Void)?
typealias AddProductCallback = ((AddProductResponse) -> Void)?
typealias ErrorCallback = ((Error) -> Void)?

class ProductsViewModel: BaseViewModel {
    func getProduct(id: String, completion: ProductCallback, failure: ErrorCallback) {
        let endpoint = ACMEndpoint()
            .set(method: .get)
            .set(path: ACMPathModel(path: "products", value: id))
            .add(header: ACMHeaderModel(field: "fieldOne", value: "valueOne"))
            .add(header: ACMHeaderModel(field: "fieldTwo", value: "valueTwo"))
            .add(queryItem: ACMQueryModel(name: "nameOne", value: "valueOne"))
            .add(queryItem: ACMQueryModel(name: "nameTwo", value: "valueTwo"))
            .build()

        network.request(to: endpoint) { (r: ACMBaseResult<ProductResponse?, Error>) in
            switch r {
            case let .success(r):
                guard let response = r else {
                    return
                }
                completion?(response)
            case let .failure(error):
                failure?(error)
            }
        }
    }

    func addProduct(completion: AddProductCallback, failure: ErrorCallback) {
        let endpoint = ACMEndpoint()
            .set(method: .post)
            .set(path: "products/add")
            .add(header: ACMHeaderModel(field: "fieldOne", value: "valueOne"))
            .add(header: ACMHeaderModel(field: "fieldTwo", value: "valueTwo"))
            .add(param: ACMBodyModel(key: "title", value: "valueOne"))
            .add(param: ACMBodyModel(key: "description", value: "valueTwo"))
            .add(param: ACMBodyModel(key: "price", value: 100))
            .build()

        network.request(to: endpoint) { (r: ACMBaseResult<AddProductResponse?, Error>) in
            switch r {
            case let .success(r):
                guard let response = r else {
                    return
                }
                completion?(response)
            case let .failure(error):
                failure?(error)
            }
        }
    }
}
