//
//  ChocolateCell.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-03.
//

import UIKit

class ChocolateCell: UITableViewCell {
    var chocolateImageView = UIImageView()
    var chocolateTitle = UILabel()
    var chocolatePrice = UILabel()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupview()
    }
    
    func setupview () {
        addSubview(chocolateImageView)
        chocolateImageView.layer.cornerRadius = 10
        chocolateImageView.clipsToBounds = true
        chocolateImageView.snp.makeConstraints{make in
            make.top.equalTo(safeAreaLayoutGuide).offset(5)
            make.leading.equalTo(safeAreaLayoutGuide).offset(5)
            make.height.lessThanOrEqualTo(60)
            make.width.lessThanOrEqualTo(90)
        }
        
        addSubview(chocolateTitle)
        chocolateTitle.numberOfLines = 0
        chocolateTitle.adjustsFontSizeToFitWidth = true
        chocolateTitle.snp.makeConstraints{make in
            make.top.equalTo(chocolateImageView)
            make.leading.equalTo(chocolateImageView.snp.trailing).offset(5)
        }

        addSubview(chocolatePrice)
        chocolatePrice.numberOfLines = 0
        chocolatePrice.adjustsFontSizeToFitWidth = true
        chocolatePrice.snp.makeConstraints{make in
            make.top.equalTo(chocolateTitle)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(5)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set (chocolate: Chocolate){
        chocolateImageView.image = chocolate.countryFlagEmoji
        chocolateTitle.text = chocolate.countryName
        chocolatePrice.text = chocolate.priceInDollars.description
    }
    
}
