//
//  TwitterClient.swift
//  Twitter
//
//  Created by Marc Anderson on 2/17/16.
//  Copyright © 2016 Marc Anderson. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterBaseURL = NSURL(string: "https://api.twitter.com")
let twitterConsumerKey = "Yim4xHpLx8LZmjGSv15YjcIdz"
let twitterConsumerSecret = "JDkcg1q7k8rLS4sMyAtFaIZeDYqax2dWNlWWO36wdqFP1vTfZi"

class TwitterClient: BDBOAuth1SessionManager {

    static let sharedInstance = TwitterClient(
        baseURL: twitterBaseURL,
        consumerKey: twitterConsumerKey,
        consumerSecret: twitterConsumerSecret
    )

    

}
