//
//  ViewController.swift
//  iOS-Spotify-Artists-Viewer
//
//  Created by Dennis Cherchenko on 9/23/16.
//  Copyright © 2016 Dennis Cherchenko. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let username = "bob"
        let password = "smith"
        

        let params = [
            "email": username,
            "password": password
        ]

//        Alamofire.request("https://httpbin.org/get").responseJSON { response in
//            print(response.request)  // original URL request
//            print(response.response) // HTTP URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//        }

        let artist = "Muse"

        Alamofire.request("https://api.spotify.com/v1/search?q=" + artist + "&type=artist").validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Validation Successful")
                //print(response.response) // HTTP URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization

                if let JSON = response.result.value {
                    print("got here")
                    print("JSON: \(JSON)")
                    print(JSON[1])
                }
            case .failure(let error):
                print(error)
            }
        }

    }
}
