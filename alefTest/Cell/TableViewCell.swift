//
//  TableViewCell.swift
//  alefTest
//
//  Created by baga on 05.11.2021.
//

import UIKit

protocol CellDelegate: AnyObject {
    func didPressButtonFor(cell: TableViewCell)
}

class TableViewCell: UITableViewCell {
    weak var delegate: CellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func deleteCell(_ sender: Any) {
        delegate?.didPressButtonFor(cell: self)
    }
}
