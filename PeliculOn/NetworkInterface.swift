//
//  NetworkInterface.swift
//  PeliculOn
//
//  Created by Pedro  on 21/3/23.
//

import Foundation

let urlBase = URL(string: "https://api.themoviedb.org/")!   // La url base para realizar la llamada
let urlImageBase = URL(string: "https://image.tmdb.org/t/p/w500")! // La url base para realizar la llamada de las imágenes

extension URLQueryItem {   // Creamos el item
    static let language = URLQueryItem(name: "language", value: "es-ES")
}

extension URL {
    static let urlMoviesPopular:URL = {
        guard var urlC = URLComponents(url: urlBase, resolvingAgainstBaseURL: false) else {
            return urlBase
        }
        urlC.path = "/3/movie/popular"
        urlC.queryItems = [.language]
        return urlC.url ?? urlBase
    }()
    static let urlMoviesGenre:URL = {
        guard var urlC = URLComponents(url: urlBase, resolvingAgainstBaseURL: false) else {
            return urlBase
        }
        urlC.path = "/3/genre/movie/lis"
        urlC.queryItems = [.language]
        return urlC.url ?? urlBase
    }()

    static func getImageURL(path:String) -> URL {   // añade el resto de la petición de la imagen
        urlImageBase.appendingPathComponent(path)
    }
}


extension URLRequest {
    static func request(url:URL) -> URLRequest  {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
        request.addValue("aplication/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ94.eyJhdWQiOiJhMmU1ZWZmOTFhNWU3ZmUyODYxYzVhNDgyM2IxNzY3OCIsInN1YiI64IjY0MTk3NGY2MGQ1ZDg1MDBmMmQ4MWFhYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vQNm1XsqIZT7omEaTMOfcm6YQ83OJ77tjDfVisduWtA", forHTTPHeaderField: "Authorization")
        return request
    }
}


