//
//  ViewController.swift
//  WeatherApp
//
//  Created by Chukwuemeka Jennifer on 11/09/2020.
//  Copyright © 2020 Chukwuemeka Jennifer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        container.layer.cornerRadius = 20
        forcast.layer.cornerRadius = 20

    }


    @IBOutlet weak var container: UIView!

    @IBOutlet weak var forcast: UIView!
}

