//
//  AirportTableViewCell.swift
//  CityAirport
//
//  Created by Поляндий on 07.12.2022.
//


import UIKit

class AirportTableViewCell: UITableViewCell {
    static let identifier = "AirportTableViewCell"

    @IBOutlet weak var airportNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(usingViewModel viewModel: AirportViewPresentable) {
        self.airportNameLabel.text = viewModel.name
        self.distanceLabel.text = viewModel.formattedDistance
        self.countryLabel.text = viewModel.address
        self.lengthLabel.text = viewModel.runwayLength
        self.selectionStyle = .none
    }
}
