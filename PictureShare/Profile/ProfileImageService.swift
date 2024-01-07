//
//  ProfileImageService.swift
//  PictureShare
//
//  Created by Alexandr on 06.01.2024.
//

import Foundation

final class ProfileImageService {
    // Singleton
    static let shared = ProfileImageService()
    static let DidChangeNotification = Notification.Name(rawValue: "ProfileImageProviderDidChange")
    
    private (set) var avatarURL: String?
    private var task: URLSessionTask?
    private var lastToken: String?
    
    private let urlSession = URLSession.shared
    
    private init() { }
    
    func fetchProfileImageURL(
        username: String,
        token: String,
        _ completion: @escaping (Result<String, Error>) -> Void
    ) {
        assert(Thread.isMainThread)
        
        if lastToken == token { return }
        task?.cancel()
        
        lastToken = token

        let request = selfProfileImageRequest(
            code: token,
            username: username
        )
        print(request)
        
        let task = object(for: request) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let profileResult):
                if let image = profileResult.profileImage {
                    let profileImageURL = image.small
                    completion(.success(profileImageURL))
                    NotificationCenter.default.post(
                            name: ProfileImageService.DidChangeNotification,
                            object: self,
                            userInfo: ["URL": profileImageURL])
                }
                self.task = nil
            case .failure(let error):
                completion(.failure(error))
                
                self.lastToken = nil
            }
        }
        self.task = task
        task.resume()
    }
    
    private func selfProfileImageRequest(code: String, username: String) -> URLRequest {
        var request = URLRequest.makeHTTPRequest(
            path: "/users/\(username)",
            httpMethod: "GET",
            baseURL: DefaultBaseURL
        )
        
        request.setValue("Bearer \(code)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}

struct ProfileImage: Decodable {
    let small: String
    let medium: String
    let large: String
}

struct UserResult: Decodable {
    let profileImage: ProfileImage?
    
    enum CodingKeys: String, CodingKey {
        case profileImage = "profile_image"
    }
}

extension ProfileImageService {
    
    private func object(
        for request: URLRequest,
        completion: @escaping (Result<UserResult, Error>) -> Void
    ) -> URLSessionTask {
        
        let decoder = JSONDecoder()
        
        return urlSession.data(for: request) { (result: Result<Data, Error>) in
            let response = result.flatMap { data -> Result<UserResult, Error> in
                Result { try decoder.decode(UserResult.self, from: data) }
            }
            completion(response)
        }
    }
}

// Add Notification
extension ProfileImageService {
    
}
