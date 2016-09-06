//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Pasha Bahadori on 9/5/16.
//  Copyright © 2016 Pelican. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    // WKWebView is the new version of WebView that came out but webView isn't deprecated yet so we'll still use it
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var titleLbl: UILabel!
    // This view needs a specific partyRock object
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock {
        get {
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLbl.text =  partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func backToMainPage(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: {})
    }

    /*
  
     in Segueways we initialize the data in the prepare for segueway, and then in viewDidLoad it will load it
    */

}
