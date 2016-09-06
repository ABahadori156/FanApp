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
        //TODO: set image from URL
    }

}
