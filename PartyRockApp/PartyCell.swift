//
//  PartyCellTableViewCell.swift
//  PartyRockApp
//
//  Created by Pasha Bahadori on 9/5/16.
//  Copyright © 2016 Pelican. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {
    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    //Everytime something is updated in the UI, post it in this function
    //Everytime a new call comes on the top, it has old data in it so we need to update the UI with new data everytime a view gets recycled
    //
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        // ** When you are downloading stuff from the internet, you need to put it on a asynchronous thread (Synchronous means one after the other after the other) if we left it synchronous and we just downloaded an image from the internet, our app would look like it's broken and stop for a second then when the image is finished downloading, the app would resume to work again. 
        // Downloading on a synchronous thread blocks the UIThread - it's blocking taps, it's blocking updates, ALWAYS put content that is downloading or tasks that take awhile in an asynchronous thread. 
        
        let url = URL(string: partyRock.imageURL)!
        
        // This dispatchQueue will create a new thread in the background, this won't stop our app from updating - it's in the background. The background thread though can't update user interface, it can only do operations. 
        // Once when we have data to show, we go back to the UI Thread. BELOW IS THE NEW SYNTAX IN SWIFT 3
        DispatchQueue.global().async {
            // Here we try to get an Image
            do {
                let data = try Data(contentsOf: url)
                
                // A single global queue to have the synchronous thread grab the contents of the url on the main thread and update the user interface
                //Everytime we create a new cell, we're going to call updateUI which updates the video Title AND try and download an image for each of those cells on a background thread so it doesn't freeze the app
                // After it's done downloading, we go back to the UIThread and we're going to put the image in our videoPreviewImage image view
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                //Handle the error
            }
        }
    }

}
