//
//  TweetControlsCell.swift
//  Twitter
//
//  Created by Marc Anderson on 2/19/16.
//  Copyright © 2016 Marc Anderson. All rights reserved.
//

import UIKit

class TweetControlsCell: UITableViewCell {

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
    }

    @IBAction func onRetweet(sender: UIButton) {
        print("onRetweet")
    }

    @IBAction func onFavorite(sender: UIButton) {
        print("onFavorite")
    }

}
