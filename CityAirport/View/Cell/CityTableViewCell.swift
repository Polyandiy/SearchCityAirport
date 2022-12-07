//
//  CityTableViewCell.swift
//  CityAirport
//
//  Created by Поляндий on 07.12.2022.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    static let identifier = "CityTableViewCell"

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(usingViewModel viewModel: CityViewPresentable) {

        self.cityLabel.text = viewModel.city
        self.locationLabel.text = viewModel.location
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
