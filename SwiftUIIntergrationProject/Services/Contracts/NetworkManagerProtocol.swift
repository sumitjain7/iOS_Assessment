//
//  NetworkManagerProtocol.swift
//  SwiftUIIntergrationProject
//
//  Created by Sumit Jain  on 19/07/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func executeRequest<T: Decodable>(url: URL) async throws -> T
}
