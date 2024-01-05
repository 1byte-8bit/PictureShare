//
//  URLRequest+Extensions.swift
//  PictureShare
//
//  Created by Alexandr on 05.01.2024.
//

import Foundation

// MARK: - HTTP Request extension

extension URLRequest {
    
    static func makeHTTPRequest(
        path: String,
        httpMethod: String,
        baseURL: URL = DefaultBaseURL
    ) -> URLRequest {
        var request = URLRequest(url: URL(string: path, relativeTo: baseURL)!)
        request.httpMethod = httpMethod
        
        return request
    }
}
