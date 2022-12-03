//
//  AgendaTableViewCell.swift
//  Reto3
//
//  Created by Erinson Andres Romero Terry on 3/12/22.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloAgendaLabel: UILabel!
    
    @IBOutlet weak var descripcionAgendaLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
