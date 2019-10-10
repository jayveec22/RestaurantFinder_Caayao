//
//  RestaurantDetailsView.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 10.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import Foundation
import Kio
import SnapKit

public class RestaurantDetailsView: KioView {
    public let restaurantLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 45.0)
        view.textColor = UIColor.black
        view.adjustsFontSizeToFitWidth = true
        view.numberOfLines = 2
        view.textAlignment = NSTextAlignment.center
        return view
    }()

    public let addressLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 20.0)
        view.textColor = UIColor.black
        view.adjustsFontSizeToFitWidth = true
        view.numberOfLines = 6
        view.textAlignment = NSTextAlignment.center
        return view
    }()

    public let pluralNameLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 30.0)
        view.textColor = UIColor.black
        view.adjustsFontSizeToFitWidth = true
        view.numberOfLines = 2
        view.textAlignment = NSTextAlignment.center
        return view
    }()

    public let restaurantImageView: UIImageView = {
        let view: UIImageView = UIImageView(image: UIImage(named: "restaurant_logo"))
        return view
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white

        self.kio.subviews(forAutoLayout:
            self.restaurantLabel,
            self.pluralNameLabel,
            self.addressLabel,
            self.restaurantImageView
        )

        self.restaurantLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview().offset(15.0)
            make.trailing.equalToSuperview().inset(15.0)
            make.top.equalToSuperview().offset(30.0)
        }

        self.pluralNameLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.restaurantLabel.snp.bottom).offset(10.0)
            make.leading.trailing.equalToSuperview()
        }

        self.addressLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.pluralNameLabel.snp.bottom).offset(50.0)
            make.leading.trailing.equalToSuperview()
        }

        self.restaurantImageView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.addressLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
