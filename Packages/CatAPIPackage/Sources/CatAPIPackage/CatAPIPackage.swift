import Foundation
import NetworkPackage

public class CatAPI: APIProvider, CatProvider {
    private lazy var components: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.thecatapi.com"
        return components
    }()

    private func catRequest(withUrl url: URL?) -> URLRequest {
        let request = URLRequest(url: url!)
        return request
    }

    public init(session: URLSession) {
        super.init(withSession: session)
    }

    public func fetchCats(withBreed breed: String, page: Int, completion: @escaping (Kitty?) -> Void) {
        components.path = "/v1/images/search"
        components.queryItems = [
                    URLQueryItem(name: "limit", value: "5"),
                    URLQueryItem(name: "page", value: String(page)),
                    URLQueryItem(name: "order", value: "Desc"),
                    URLQueryItem(name: "breed_ids", value: breed)
                ]

        var request = catRequest(withUrl: components.url)
//        request.setValue("24be637f-e596-4847-b47a-1791feeea1bd", forHTTPHeaderField: "x-api-key")
        request.httpMethod = "GET"

        fetch(Kitty.self, request: request, completionHandler: { result in
            switch result {
            case .success(let response):
                completion(response)
            case .failure:
                completion(nil)
            }
        })
    }
}
