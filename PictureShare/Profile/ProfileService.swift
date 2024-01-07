//
//  ProfileService.swift
//  PictureShare
//
//  Created by Alexandr on 03.01.2024.
//

import Foundation

final class ProfileService {
    // Singleton
    static let shared = ProfileService()
    
    private let urlSession = URLSession.shared
    
    private var task: URLSessionTask?
    private var lastToken: String?
    
    private(set) var profile: Profile?
    
    private init() { }
    
    func fetchProfile(_ token: String, completion: @escaping (Result<Profile, Error>) -> Void) {
        
        assert(Thread.isMainThread)
        
        if lastToken == token { return }
        task?.cancel()
        
        lastToken = token

        let request = selfProfileRequest(code: token)
        
        let task = object(for: request) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let profileResult):
                self.profile = self.convertProfileData(from: profileResult)
                
                if let username = self.profile?.username {
                    print(username)
                    print(token)
                    ProfileImageService.shared.fetchProfileImageURL(
                        username: username,
                        token: token
                    ) { _ in }
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
    
    private func convertProfileData(from profileResult: ProfileResult) -> Profile {
        let profile = Profile(
            username: profileResult.username,
            name: "\(profileResult.firstName) \(profileResult.lastName)",
            loginName: "@\(profileResult.lastName)",
            bio: profileResult.bio
        )
        return profile
    }
    
    private func selfProfileRequest(code: String) -> URLRequest {
        var request = URLRequest.makeHTTPRequest(
            path: "/me",
            httpMethod: "GET",
            baseURL: DefaultBaseURL
        )
        
        request.setValue("Bearer \(code)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}

struct Profile {
    let username: String
    let name: String
    let loginName: String
    let bio: String?
}

struct ProfileResult: Decodable {
    let username: String
    let firstName: String
    let lastName: String
    let bio: String?
    
    enum CodingKeys: String, CodingKey {
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case bio
    }
}

extension ProfileService {
    
    private func object(
        for request: URLRequest,
        completion: @escaping (Result<ProfileResult, Error>) -> Void
    ) -> URLSessionTask {
        
        let decoder = JSONDecoder()
        
        return urlSession.data(for: request) { (result: Result<Data, Error>) in
            let response = result.flatMap { data -> Result<ProfileResult, Error> in
                Result { try decoder.decode(ProfileResult.self, from: data) }
            }
            completion(response)
        }
    }
}
