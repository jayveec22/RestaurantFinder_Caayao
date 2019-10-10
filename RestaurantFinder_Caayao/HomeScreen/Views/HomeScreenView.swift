//
//  HomeScreenView.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 09.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import SnapKit
import Kio
import Foundation


public class HomeScreenView: KioView {
    public let collectionLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Restaurants Near You"
        view.font = UIFont.systemFont(ofSize: 36.0)
        view.textColor = UIColor.black
        return view
    }()

    public let tableView: UITableView = {
        let view: UITableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        view.backgroundColor = UIColor.white
        return view
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.kio.subviews(forAutoLayout: self.collectionLabel, self.tableView)

        self.collectionLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(10.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(30.0)
        }

        self.tableView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(collectionLabel.snp.bottom).offset(10.0)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
