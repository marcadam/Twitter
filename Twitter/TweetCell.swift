//
//  TweetCell.swift
//  Twitter
//
//  Created by Marc Anderson on 2/18/16.
//  Copyright © 2016 Marc Anderson. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteCountLabel: UILabel!

    var tweet: Tweet! {
        didSet {
            nameLabel.text = tweet.user?.name
            nameLabel.sizeToFit()
            if let screenName = tweet.user?.screenName {
                screenNameLabel.text = "@\(screenName)"
            }
            tweetTextLabel.text = tweet.text
            if let profileImageURL = tweet.user?.profileImageURL {
                profileImageView.setImageWithURL(NSURL(string: profileImageURL)!)
            }
            createdAtLabel.text = tweet.createdAtStringShort

            if User.currentUser?.userID == tweet.user?.userID {
                retweetButton.setImage(UIImage(named: "RetweetInactive"), forState: .Normal)
                retweetButton.enabled = false
            } else if tweet.retweeted! {
                retweetButton.setImage(UIImage(named: "RetweetOn"), forState: .Normal)
            }

            if tweet.favorited! {
                favoriteButton.setImage(UIImage(named: "FavoriteOn"), forState: .Normal)
            }

            if let retweetCount = tweet.retweetCount {
                retweetCountLabel.text = retweetCount > 0 ? "\(retweetCount)" : nil
            }

            if let favoriteCount = tweet.favoriteCount {
                favoriteCountLabel.text = favoriteCount > 0 ? "\(favoriteCount)" : nil
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 5
        profileImageView.clipsToBounds = true
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
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.favoriteButton.setImage(UIImage(named: "FavoriteOn"), forState: .Normal)
                })
            } else {
                print("Error favoriting tweet.")
            }
        }
    }
}
