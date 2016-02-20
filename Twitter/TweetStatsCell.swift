//
//  TweetStatsCell.swift
//  Twitter
//
//  Created by Marc Anderson on 2/19/16.
//  Copyright © 2016 Marc Anderson. All rights reserved.
//

import UIKit

class TweetStatsCell: UITableViewCell {

    @IBOutlet weak var tweetStatsLabel: UILabel!

    var tweet: Tweet! {
        didSet {
            let tweetStatsText = NSMutableAttributedString()
            let regularAttributes = [
                NSFontAttributeName: UIFont.systemFontOfSize(12.0),
                NSForegroundColorAttributeName: UIColor.lightGrayColor()
            ]
            let boldAttributes = [
                NSFontAttributeName: UIFont.boldSystemFontOfSize(12.0),
                NSForegroundColorAttributeName: UIColor.blackColor()
            ]

            if let retweetCount = tweet.retweetCount where retweetCount > 0 {
                tweetStatsText.appendAttributedString(NSAttributedString(string: "\(retweetCount)", attributes: boldAttributes))
                let retweetText = retweetCount == 1 ? "RETWEET" : "RETWEETS"
                tweetStatsText.appendAttributedString(NSAttributedString(string: " \(retweetText)    ", attributes: regularAttributes))
            }
            if let favoriteCount = tweet.favoriteCount where favoriteCount > 0 {
                let favoriteText = favoriteCount == 1 ? "LIKE" : "LIKES"
                tweetStatsText.appendAttributedString(NSAttributedString(string: "\(favoriteCount)", attributes: boldAttributes))
                tweetStatsText.appendAttributedString(NSAttributedString(string: " \(favoriteText)    ", attributes: regularAttributes))
            }

            tweetStatsLabel.attributedText = tweetStatsText
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
}
