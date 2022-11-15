
//  ViewController.swift
//  TestInjectFramework
//
//  Created by Miguel Alcântara on 09/11/2022.
//

import UIKit
import Inject

class ViewController2: UIViewController {

    lazy var buttonsStackView = UIStackView()
    lazy var nextButton = UIButton(frame: .zero)
    lazy var backButton = UIButton(frame: .zero)

    lazy var scrollView = UIScrollView()
    lazy var containerStackView = UIStackView()

    lazy var imageView = UIImageView(image: .init(systemName: "arrowtriangle.up.circle.fill"))
    lazy var titleLabel = UILabel()
    lazy var subtitleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.backgroundColor = .blue
//        setupBackButton()
        view.backgroundColor = .gray
        setupRestOfTheView()
        print("\(self) - \(#function)")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self) - \(#function)")
    }

    func setupBackButton() {
        backButton.setTitle("Go back", for: .normal)
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backButton.addTarget(nil, action: #selector(routeBack), for: .touchUpInside)
    }

    func setupBackButtonStackView() {
        backButton.setTitle("Go back", for: .normal)
        buttonsStackView.addArrangedSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(nil, action: #selector(routeBack), for: .touchUpInside)
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    func setupNextButtonStackView() {
        nextButton.setTitle("Go to the next scene", for: .normal)
        buttonsStackView.addArrangedSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(nil, action: #selector(routeToNext), for: .touchUpInside)
        NSLayoutConstraint.activate([
            nextButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    func setupButtonsStackView() {
        view.addSubview(buttonsStackView)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .vertical
//        buttonsStackView.distribution = .fillEqually
        NSLayoutConstraint.activate([
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        setupNextButtonStackView()
        setupBackButtonStackView()
    }

    func setupRestOfTheView() {
        setupButtonsStackView()
        setupScrollView()
        setupContainerStackView()
        setupImageView()
        setupTitleLabel()
        setupSubtitleLabel()
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func setupContainerStackView() {
        scrollView.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .vertical
        containerStackView.alignment = .center
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 48),
            containerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    func setupImageView() {
        containerStackView.addArrangedSubview(imageView)
        containerStackView.setCustomSpacing(32, after: imageView)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: containerStackView.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }

    func setupTitleLabel() {
        containerStackView.addArrangedSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.text = "This is a title label"
        titleLabel.font = .boldSystemFont(ofSize: 18)
    }

    func setupSubtitleLabel() {
        containerStackView.addArrangedSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "This is a subtitle label"
        subtitleLabel.font = .italicSystemFont(ofSize: 14)
    }

    @objc
    func routeBack() {
        if let navVC = navigationController {
            navVC.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }

    @objc
    func routeToNext() {
        let vc = Inject.ViewControllerHost(ViewController3())
        if let navVC = navigationController {
            navVC.pushViewController(vc, animated: true)
        } else {
            present(vc, animated: true)
        }
    }
}
