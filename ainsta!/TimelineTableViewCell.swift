//
//  TimelineTableViewCell.swift
//  ainsta!
//
//  Created by Nuraini Aguse on 3/6/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit
import Parse

class TimelineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var caption: UILabel!
    
    var post: PFObject?{
        
        didSet{
            
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
