//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Pasha Bahadori on 9/5/16.
//  Copyright © 2016 Pelican. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var partyRocks = [PartyRock]()
    
    // Your viewController is holding a weak reference to the table view itself
    // Because the IBOutlet is on top of the view, it's also holding a reference - so you don't need two strong objects holding a reference to it because if a view goes out of memory then it may have a memory weak (We don't need our IBOutlets to ever be strong)
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // We go to the youtube video and click on share, then copy the URL from embed and put it in here. Then we put \'s before each " in the string
        let urlTest = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/py6-WnjPdK4\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let urlTest2 = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let urlTest3 = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let urlTest4 = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Fql23fCmUDU\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let p1 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: urlTest, videoTitle: "Where the Sun Goes Down")
        
        let p2 = PartyRock(imageURL: "http://www.croshalgroup.com/wp-content/uploads/2015/05/Redfoo-Website.jpg", videoURL: urlTest2, videoTitle: "Upside Inside Out")
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/2wUxw6GH3IM/hqdefault.jpg", videoURL: urlTest3, videoTitle: "Swimming with Leviathan")
        let p4 = PartyRock(imageURL: "http://www.billboard.com/files/styles/article_main_image/public/media/lmfao-party-rock-anthem-2011-billboard-650.jpg", videoURL: urlTest4, videoTitle: "Party Rock Commercial")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)

        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // This method is where iOS recycles the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Give us a PartyCell and if it doesn't have one, it will create one that we can use
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            //Everytime we grab a new cell, the table view knows which index we are and the index will always be equal to the number we put in the numberOfRowsInSection partyRocks.count, so everytime we go through we need to grab an object out of the array using the indexPath.row
            let partyRock = partyRocks[indexPath.row]
            
            //The function updateUI is from a custom func we made in the tableView cell
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else /*If this fails, which it won't */ {
                 return UITableViewCell()
        }
    }

    //How many rows do you want in your table view?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

}
// TableViews, downloading images from the internet on a asynchronous backround thread, custom fonts, custom cells, injecting a HTML inside a webView, and data passing through view controllers
// We're going to need a URL for the Youtube video, we're going to need a title for the cell and we'll need an ImageURL for the image. 
