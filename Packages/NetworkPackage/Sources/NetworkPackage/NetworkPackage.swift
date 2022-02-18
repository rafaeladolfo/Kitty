//
//  Created by Rafael Adolfo  on 17/02/22.
//

import Foundation

public enum FetchError: Error {
    case networkError
    case invalidResponse
}

open class APIProvider {
    weak var session: URLSession?

    public init(withSession session: URLSession) {
        self.session = session
    }

    open func fetch<T: Decodable>(_ representable: T.Type,
                                  request: URLRequest,
                                  completionHandler: @escaping (Result<T, FetchError>) -> Void) {

        session?.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil, let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.networkError))
                }
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.networkError))
                }
                return
            }

            do {
                let decoder = JSONDecoder()
                let responseValue = try decoder.decode(representable.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(responseValue))
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(.invalidResponse))
                }
            }
        }).resume()
    }
}
