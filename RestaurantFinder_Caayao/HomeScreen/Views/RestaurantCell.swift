//
//  RestaurantCell.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 09.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import UIKit
import SnapKit
import Kio

public final class RestaurantCell: UITableViewCell {

    public let titleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 20.0)
        view.textColor = UIColor.black
        view.adjustsFontSizeToFitWidth = true
        return view
    }()

    public let distanceLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.gray
        view.adjustsFontSizeToFitWidth = true
        view.textAlignment = NSTextAlignment.left
        return view
    }()

    public let arrowImageView: UIImageView = {
        let view: UIImageView = UIImageView(image: UIImage(named: "right_arrow"))
        view.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        return view
    }()

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white

        self.kio.subviews(forAutoLayout:
            self.titleLabel,
            self.distanceLabel,
            self.arrowImageView
        )

        self.titleLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(15.0)
            make.trailing.equalTo(self.arrowImageView.snp.leading).offset(-15.0)
        }

        self.distanceLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.titleLabel.snp.bottom)
            make.leading.equalToSuperview().offset(15.0)
            make.bottom.equalToSuperview().inset(10.0)
        }

        self.arrowImageView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.trailing.equalToSuperview().inset(10.0)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(40.0)
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configurable Cell
extension RestaurantCell {

    public static var identifier: String {
        return "RestaurantCell"
    }
}
