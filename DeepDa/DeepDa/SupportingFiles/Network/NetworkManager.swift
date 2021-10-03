//
//  NetworkManager.swift
//  DeepDa
//
//  Created by WANKI KIM on 2021/10/03.
//
import Foundation

extension URLSession: Sessionable { }

protocol Sessionable {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
    func dataTask(with url: URL,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

protocol Responsable: Decodable { }
protocol Requestable: Encodable { }

class NetworkManager {
    static let baseURL = "http://13.209.132.192:8000/rest-auth"
    
    private let session: Sessionable
    
    init(_ session: Sessionable) {
        self.session = session
    }
    
    /// Response를 처리하는 Method
    /// - Parameters:
    ///   - request: URLRequest
    ///   - completionHandler: 응답에 대한 처리
    func handleResponse(for request: URLRequest,
                        completionHandler: @escaping ((Result<Responsable, Error>) -> Void)) {
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let unwrappedResponse = response as? HTTPURLResponse else {
                    completionHandler(.failure(NetworkingError.InvalidResponse))
                    return
                }
                
                switch unwrappedResponse.statusCode {
                case 200..<300:
                    print("success")
                default:
                    print("failure")
                }
                
                if let unwrappedError = error {
                    completionHandler(.failure(unwrappedError))
                }
                
                if let unwrappedData = data {
                    do {
                        if let model = try? JSONDecoder().decode(Diary.self, from: unwrappedData) {
                            completionHandler(.success(model))
                            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from:unwrappedData)
                            completionHandler(.failure(errorResponse))
                        }
                    } catch  {
                        completionHandler(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
    
    /// [String: Any] 타입의 Parameter를 입력 받아 Request를 보내는 Method ( Form Data )
    /// - Parameters:
    ///   - endpoint: url endpoint
    ///   - parameters: adopt decodable
    ///   - completionHandler: completionHandler
    func request(endpoint: String,
                 parameters: [String: Any],
                 completionHandler: @escaping (Result<Responsable, Error>) -> Void) {
        guard let url = URL(string: Self.baseURL + endpoint) else {
            completionHandler(.failure(NetworkingError.InvalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        var components = URLComponents()
        var queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: String(describing: value))
            queryItems.append(queryItem)
        }
        
        components.queryItems = queryItems
        let queryItemData = components.query?.data(using: .utf8)
        
        request.httpBody = queryItemData
        request.httpMethod = String(describing: HttpMethod.post)
        request.addValue(String(describing: ContentType.json),
                         forHTTPHeaderField: ContentType.fieldID)
        
        handleResponse(for: request,
                       completionHandler: completionHandler)
    }
    
    /// Encoding 가능한 모델의 형태로 서버에 request를 보내는 함수
    /// - Parameters:
    ///   - endpoint: url endpoint
    ///   - object: adopt encodable
    ///   - completionHandler: completionHandler
    func request<T: Requestable>(endpoint: String,
                                object: T,
                                completionHandler: @escaping (Result<Responsable, Error>) -> Void) {
        guard let url = URL(string: Self.baseURL + endpoint) else {
            completionHandler(.failure(NetworkingError.InvalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        
        do {
            let data = try JSONEncoder().encode(object)
            request.httpBody = data
        } catch {
            completionHandler(.failure(NetworkingError.badEncoding))
        }
        
        request.httpMethod = String(describing: HttpMethod.post)
        request.addValue(String(describing: ContentType.json), forHTTPHeaderField: ContentType.fieldID)
        
        handleResponse(for: request, completionHandler: completionHandler)
    }
}
