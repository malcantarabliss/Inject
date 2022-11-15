
//  ViewController.swift
//  TestInjectFramework
//
//  Created by Miguel Alcântara on 09/11/2022.
//

import UIKit

class ViewController3: UIViewController {

    lazy var button = UIButton(frame: .zero)

    lazy var scrollView = UIScrollView()
    lazy var containerStackView = UIStackView()

    lazy var imageView = UIImageView(image: .init(systemName: "music.quarternote.3"))
    lazy var lyricsLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGreen
        setupRestOfTheView()
        print("\(self) - \(#function)")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self) - \(#function)")
    }

    func setupButton() {
        button.setTitle("Go back", for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(routeBack), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func setupRestOfTheView() {
        setupButton()
        setupScrollView()
        setupContainerStackView()
        setupImageView()
        setupDescriptionLabel()
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func setupContainerStackView() {
        scrollView.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .vertical
        containerStackView.alignment = .center
        containerStackView.spacing = 24
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

    func setupDescriptionLabel() {
        containerStackView.addArrangedSubview(lyricsLabel)
        lyricsLabel.translatesAutoresizingMaskIntoConstraints = false
        lyricsLabel.numberOfLines = 0
        lyricsLabel.text = """
        Some 500 years have now passed, yet in the past
        I'm still finding the keys to the questions that I
        Ask.
        I'm only one great son, son of the great great One,
        Of the One great spirit, of the great One sum.
        I'm thinking about how I could feel it
        When I lived your slums,
        I was beaten by the seasons,
        With no material wealth
        I was a free man; All is magic.
        I could hear this; All is music.
        Such is the dream, such is the vision
        It's just like that; One day I swayed
        Along the scenes of dream daze
        And caught fast lanes in my eyes
        Along the rays of crystal glaze
        And then all became named
        I had awoken to the sky, been smoked by the sun,
        Raised by the High, smoked by the One,
        Raised on this Earth
        To provoke everyone
        In a good way.
        Channel the Ravel, unravel,
        Revel the rebel, the level

        I am copper. Deep from this earth,
        And am all that surrounds me at birth,
        I become all that surrounds me in death.

        I'm telling you a story of a man in space,
        With his hands on his face.
        Floating about him are the spirits of age;
        Whispering about man and his place.
        They asking him to remind this man of his place,
        And using his voice;
        And despite all the violence and the noise
        You can still hear them saying:
        Be proud Redman be proud. Be proud of your tradition,
        Be proud of your race and be proud of your vision.

        The past is now passed and although I may ask
        Why the past is my mask I must know
        That I am what I now choose to grab from my past;
        That I will only know what I now choose will last
        From my past. From my blood. From my race.
        From the colour in my face.
        From the nature of my place in the old ways.
        In one of those days I too was borne
        To the dust in the earth and the scorn,
        Red blood under redskin; the red sin
        In the culture I am dressed in.
        Possessed in.
        Unblessed in.
        Vexed in
        And stressed in.
        Identity, enter me, let me see the enemy,
        Let me be the animal.
        Escape, from the entities, that crave my humanity,
        That feed from my fears,
        That feed from my greed and that feed from my tears.
        I will take off these clothes, stand proud,
        Take my place in the round,
        And stomp the ground in powwow.

        I am copper. Deep from this earth.
        And am all that surrounds me at birth,
        I become all that surrounds me in death.

        I'm telling you a story of a man in space,
        With his hands on his face.
        Floating about him are the spirits of age;
        Whispering about man and his place.
        They asking him to remind this man of his place,
        Using his voice;
        And despite all the violence and the noise
        You can still hear them saying:
        Be proud Redman be proud. Be proud of your tradition,
        Be proud of your race and be proud of your vision.
        Be proud of your place and be proud of your mission.
        The paint on your face, saying never submission,
        Remember those days and remember your religion,
        The freedom and the nature and the birth of first
        Vision.
        We are all still here;
        We are all still listening to the prayers
        In the smoke that your pipes release into the air
        With the hope that your children will grow to be
        Aware
        And be proud of what is theirs.

        To the Redman:
        I am copper. Deep from this earth.
        And I am all that surrounds me at birth,
        And I am all that surrounds me in growth,
        And I become all that surrounds me in death.
        """
        lyricsLabel.font = .italicSystemFont(ofSize: 14)
    }

    @objc
    func routeBack() {
        if let navVC = navigationController {
            navVC.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
}
