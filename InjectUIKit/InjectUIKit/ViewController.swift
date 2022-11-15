//
//  ViewController.swift
//  TestInjectFramework
//
//  Created by Miguel Alcântara on 09/11/2022.
//

import UIKit
import Inject

class ViewController: UIViewController {

    var button = UIButton(type: .system)
    var shouldPush = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        setupButton()
        print("\(self) - \(#function)")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shouldPush = false
        print("\(self) - \(#function)")
    }

    func setupButton() {
        button.setTitle("Go to ViewController2", for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        button.addTarget(nil, action: #selector(routeToNext), for: .touchUpInside)
    }

    @objc
    func routeToNext() {
        let vc = Inject.ViewControllerHost(ViewController2())
        if let navVC = navigationController, shouldPush {
            navVC.pushViewController(vc, animated: true)
        } else {
            present(vc, animated: true)
        }
    }
}
