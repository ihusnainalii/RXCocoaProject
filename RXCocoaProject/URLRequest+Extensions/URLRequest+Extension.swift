//
//  URLRequest+Extension.swift
//  RXCocoaProject
//
//  Created by Husnain Ali on 13/09/2022.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T> {
    let url: URL
}

extension URLRequest {
    static func load<T: Codable>(resource: Resource<T>) -> Observable<T> {
        return Observable.just(resource.url).flatMap{ url -> Observable<(response: HTTPURLResponse , data: Data)> in
            let request = URLRequest(url: url)
            return URLSession.shared.rx.response(request: request)
        }.map{ response, data -> T in
            print(response)
            if 200..<300 ~= response.statusCode {
                return try JSONDecoder().decode(T.self, from: data)
            }else{
                throw RxCocoaURLError.httpRequestFailed(response: response, data: data)
            }
        }.asObservable()
    }
}
