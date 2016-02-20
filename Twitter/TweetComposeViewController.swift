//
//  TweetComposeViewController.swift
//  Twitter
//
//  Created by Marc Anderson on 2/19/16.
//  Copyright © 2016 Marc Anderson. All rights reserved.
//

import UIKit

class TweetComposeViewController: UIViewController {

    @IBOutlet weak var tweetButton: UIButton!
    @IBOutlet weak var inReplyToLabel: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tweetTextView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTweet(sender: UIButton) {
        let params: NSDictionary = ["status": tweetTextView.text]
        TwitterClient.sharedInstance.updateStatusWithParams(params) { (tweet, error) -> Void in
            if tweet != nil {
                print("Looks like tweeting works.")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tweetTextView.resignFirstResponder()
                    self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
                })
            } else {
                print("Error tweeting.")
            }
        }
    }

    @IBAction func onCancel(sender: UIButton) {
        tweetTextView.resignFirstResponder()
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
