//
//  NewsTableViewCell.swift
//  MVC_App
//
//  Created by Rajan Arora on 20/06/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var txtViewDescription: UITextView!
    @IBOutlet var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
