//
//  URLs.swift
//  OCSTest
//
//  Created by Yasin AKINCI on 26/01/2022.
//

import Foundation

/*
 Url of webservice for OCS
 Exemple:
 https://api.ocs.fr/apps/v2/contents?search=title=Games%20of
 https://api.ocs.fr/apps/v2/details/serie/PSGAMEOFTHRW0058624
 http://statics.ocs.fr/data_plateforme/program/43787/origin_onceuponatiw0156629_09bjd.jpg?size=medium
 */

struct URLs {

    private static let HOST_API = "https://api.ocs.fr"
    private static let HOST_IMAGE = "https://statics.ocs.fr"
    private static let MOVIES_LIST_SERVICE = "/apps/v2/contents?search=title="
    
    static func moviesUrl(for search: String) -> String?{
        return (HOST_API+MOVIES_LIST_SERVICE+search).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
    static func detailsUrl(with detaillink: String) -> String {
        return HOST_API+detaillink
    }
    
    static func imageForMovie(url: String) -> String {
        return HOST_IMAGE+url
    }
    
    static func getVideoUrl() -> String {
        return "https://bitmovin-a.akamaihd.net/content/bbb/stream.m3u8"
    }
    
}
