//
//  ConstraintsViewController.swift
//  ConstraintsTestApp
//
//  Created by Pedro Del Rio Ortiz on 18/01/2019.
//  Copyright © 2019 Pedro Del Rio Ortiz. All rights reserved.
//

import UIKit

class ConstraintsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var OutletName: UILabel!
    @IBOutlet weak var OutletImage: UIImageView!
    
    // MARK: - Properties
    
    let htmlParser = HTMLParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNameLabel()
        
        self.htmlParser.parseHTML(urlSring: "https://www.transfermarkt.pt/se-palmeiras-sao-paulo/startseite/verein/1023/saison_id/2018") { (response) in
            
            print(response)
            
        }
    }

    private func setupNameLabel() {
        self.OutletName.font = UIFont.systemFont(ofSize: 100)
        self.OutletName.minimumScaleFactor = 0.1
        self.OutletName.adjustsFontSizeToFitWidth = true
        self.OutletName.numberOfLines = 1
        self.OutletName.textAlignment = NSTextAlignment.center
    }

}
