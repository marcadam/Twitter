//
//  TweetControlsCell.swift
//  Twitter
//
//  Created by Marc Anderson on 2/19/16.
//  Copyright © 2016 Marc Anderson. All rights reserved.
//

import UIKit

protocol TweetControlsCellDelegate: class {
    func didUpdateTweet(tweet: Tweet)
}

class TweetControlsCell: UITableViewCell {

    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!

    var tweet: Tweet! {
        didSet {
            if User.currentUser?.userID == tweet.user?.userID {
                retweetButton.setImage(UIImage(named: "RetweetInactive"), forState: .Normal)
                retweetButton.enabled = false
            } else if tweet.retweeted! {
                retweetButton.setImage(UIImage(named: "RetweetOn"), forState: .Normal)
            }

            if tweet.favorited! {
                favoriteButton.setImage(UIImage(named: "FavoriteOn"), forState: .Normal)
            }
        }
    }

    weak var delegate: TweetControlsCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onRetweet(sender: UIButton) {
        print("onRetweet")
        let params: NSDictionary = ["id": tweet.tweetID!]
        TwitterClient.sharedInstance.retweetStatusWithParams(params) { (tweet, error) -> Void in
            if tweet != nil {
                print("Retweet successful.")
                self.tweet.retweeted = true
                self.tweet.retweetCount = self.tweet.retweetCount! + 1
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.didUpdateTweet(self.tweet)
                })
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
                self.tweet.favorited = true
                self.tweet.favoriteCount = self.tweet.favoriteCount! + 1
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.didUpdateTweet(self.tweet)
                })
            } else {
                print("Error favoriting tweet.")
            }
        }
    }
}
