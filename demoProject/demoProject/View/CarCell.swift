//
//  CarCell.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-03.
//

import UIKit

class CarCell: UITableViewCell {
    static let Identifier = "CarCell"
    var carImageView = UIImageView()
    var carTitle = UILabel()
    var carPrice = UILabel()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupview()
    }
    
    func setupview () {
        addSubview(carImageView)
        carImageView.layer.cornerRadius = 10
        carImageView.clipsToBounds = true
        carImageView.snp.makeConstraints{make in
            make.top.equalTo(safeAreaLayoutGuide).offset(5)
            make.leading.equalTo(safeAreaLayoutGuide).offset(5)
            make.height.lessThanOrEqualTo(60)
            make.width.lessThanOrEqualTo(90)
        }
        
        addSubview(carTitle)
        carTitle.numberOfLines = 0
        carTitle.adjustsFontSizeToFitWidth = true
        carTitle.snp.makeConstraints{make in
            make.top.equalTo(carImageView)
            make.leading.equalTo(carImageView.snp.trailing).offset(5)
        }

        addSubview(carPrice)
        carPrice.numberOfLines = 0
        carPrice.adjustsFontSizeToFitWidth = true
        carPrice.snp.makeConstraints{make in
            make.top.equalTo(carTitle)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(5)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set (car: Car){
        carImageView.image = car.countryFlagEmoji
        carTitle.text = car.countryName
        carPrice.text = car.priceInDollars.description
    }
    
}
