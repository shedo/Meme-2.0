//
//  CustomMemeRow.swift
//  MemeMe 2.0
//
//  Created by Ivan Zandonà on 06/10/2020.
//

import UIKit

class CustomMemeRow: UITableViewCell {
    @IBOutlet weak var imageRow: UIImageView!
    @IBOutlet weak var textRow: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
