//
//  RedditAuthenticationSession.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import Foundation
import AuthenticationServices

class RedditAuthenticationStore: NSObject, ObservableObject, ASWebAuthenticationPresentationContextProviding {
    
    enum State {
        case signedOut
        case signedIn(token: String)
    }
    
    enum Error: Swift.Error {
        case invalidAuthURL
        case missingTokenRetrievalCode
    }
    
    // MARK: - Properties
    
    static let shared = RedditAuthenticationStore()
    let api = RedditAPI.shared
    private let clientId = "1K7mNP-6aCN4oTZFkwl6Cg"
    @Published var state = State.signedOut
    @Published var signedInUser: User?
    
    // MARK: - Instance Methods
    
    private func makeAuthURL() throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.reddit.com"
        components.path = "/api/v1/authorize.compact"
        components.queryItems = [
            .init(name: "client_id", value: clientId),
            .init(name: "response_type", value: "code"),
            .init(name: "state", value: UUID().uuidString),
            .init(name: "redirect_uri", value: "swiftuireddit://auth"),
            .init(name: "duration", value: "temporary"),
            .init(name: "scope", value: "identity,vote,read,mysubreddits")
        ]
        
        guard let url = components.url else {
            throw Error.invalidAuthURL
        }
        
        return url
    }
    
    @MainActor
    func signIn() async throws {
        let url = try makeAuthURL()
        let code = try await getTokenRetrievalCode(from: url)
        let endpoint = AccessToken(code: code, clientId: clientId)
        let container = try await api.request(endpoint)
        state = .signedIn(token: container.accessToken)
        refreshUser()
    }
    
    func getTokenRetrievalCode(from url: URL) async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            let session = ASWebAuthenticationSession(url: url,
                                                     callbackURLScheme: "swiftuireddit") { url, error in
                let components = url.flatMap({ URLComponents.init(url:$0, resolvingAgainstBaseURL: false) })
                let code = components?.queryItems?.first(where: { $0.name == "code" })?.value
                
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let code = code {
                    continuation.resume(returning: code)
                } else {
                    continuation.resume(throwing: Error.missingTokenRetrievalCode)
                }
            }
            
            session.presentationContextProvider = self
            session.start()
        }
    }
    
    @MainActor
    func refreshUser() {
        guard case .signedIn = state else {
            return
        }
        
        Task {
            let endpoint = Me()
            let user = try await api.request(endpoint)
            self.signedInUser = user
        }
    }
    
    // MARK: - ASWebAuthenticationPresentationContextProviding Methods
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
    
}
