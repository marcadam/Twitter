//
//  TweetControlsCell.swift
//  Twitter
//
//  Created by Marc Anderson on 2/19/16.
//  Copyright © 2016 Marc Anderson. All rights reserved.
//

import UIKit

class TweetControlsCell: UITableViewCell {

    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!

    var tweet: Tweet! {
        didSet {
            print("tweet ID: \(tweet.tweetID)")
            print("favorited: \(tweet.favorited)")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onReply(sender: UIButton) {
        print("onReply")
        let params: NSDictionary = ["status": "@Xbox Nice!", "in_reply_to_status_id": tweet.tweetID!]
        TwitterClient.sharedInstance.updateStatusWithParams(params) { (tweet, error) -> Void in
            if tweet != nil {
                print("Looks like reply works.")
            } else {
                print("Error replying.")
            }
        }
    }

    @IBAction func onRetweet(sender: UIButton) {
        print("onRetweet")
        let params: NSDictionary = ["id": tweet.tweetID!]
        TwitterClient.sharedInstance.retweetStatusWithParams(params) { (tweet, error) -> Void in
            if tweet != nil {
                print("Retweet successful.")
            } else {
                print("Retweet failed.")
            }
        }
    }

    @IBAction func onFavorite(sender: UIButton) {
        print("onFavorite")
        let params: NSDictionary = ["id": tweet.tweetID!]
        TwitterClient.sharedInstance.favoritesCreateWithParams(params) { (tweet, error) -> Void in
            if tweet != nil {
                print("Tweet favorited!")
            } else {
                print("Error favoriting tweet.")
            }
        }
    }

}
