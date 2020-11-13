//
//  BaseAPI.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation
import Alamofire


class BaseAPI<T: TargetType>: NSObject {
    
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion:@escaping (Result<M?, NSError>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.task)
        printRequest(target: target)
        AF.request(target.baseURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: headers).responseJSON { (response) in
            guard let statusCode = response.response?.statusCode else {
                // ADD Custom Error
                completion(.failure(NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: "No status code something went wrong"])))
                return
            }
            if statusCode == 200 {
                // Successful request
                guard let jsonResponse = try? response.result.get() else {
                    // ADD Custom Error
                    completion(.failure(NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey: "No response"])))
                    return
                }
                
                guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse,options: []) else { return }
                guard let responseObj = try? JSONDecoder().decode(responseClass, from: theJSONData) else {
                    completion(.failure(NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey: "failed to decode object"])))
                    return
                }
                completion(.success(responseObj))
                
            } else {
                // ADD custom error base on status code 404 / 401 /
                completion(.failure(NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericErrorMessage])))
            }
        }
    }
    
    private func parseError(errors: [String]) -> String {
        var message = ErrorMessage.genericErrorMessage
        if !errors.isEmpty {
            message = ""
            let count = errors.count
            errors.forEach({message.append(count > 1 ? "-\($0)\n" : "\($0)\n")})
            message.removeLast(1)
        }
        return message
    }
    
    
    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
    
    private func printRequest(target: T) {
        print("###")
        print("request called: \(target.baseURL)\(target.path)")
        print("http method: \(target.method)")
        if let headers = target.headers {
            print("headers: \(headers)")
        }
        print("parameters: \(target.task)")
        print("###")
    }
}

