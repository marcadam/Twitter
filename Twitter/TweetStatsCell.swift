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
            var tweetStatsText = ""
            if let retweetCount = tweet.retweetCount {
                tweetStatsText += "\(retweetCount) RETWEETS    "
            }
            if let favoriteCount = tweet.favoriteCount {
                tweetStatsText += "\(favoriteCount) LIKES"
            }
            tweetStatsLabel.text = tweetStatsText
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
