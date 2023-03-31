//
//  CardSelectionVc.swift
//  CardWorkout-Programmatic
//
//  Created by Māris Lakšs on 12/03/2023.
//

import UIKit

class CardSelectionVC: UIViewController {
    let cardImageView   = UIImageView()
    let stopButton      = CWButton(color: .systemRed, title: "Stop", SystemImageName: "stop.circle")
    let resetButton     = CWButton(color: .systemGreen, title: "Reset", SystemImageName: "arrow.clockwise.circle")
    let rulesButton     = CWButton(color: .systemBlue, title: "Rules", SystemImageName: "list.bullet.clipboard")

    var cards: [UIImage] = CardDeck.allValues
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, // 0.1 refers to seconds
                                     target: self,
                                     selector: #selector(showRandomCard),
                                     userInfo: nil, repeats: true)
    }

    @objc func stopTimer() {
        timer.invalidate()
    }

    @objc func restartTimer() {
        stopTimer()
        startTimer()
    }

    @objc func showRandomCard() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS") // In case it's an empty array, Ace of Spades image will pop up
        // If you would build a product for real users, good idea would be to use i.e. "Joker" card
        // for the start screen
    }


    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }

    func configureCardImageView() {
        // NOTE! When making an application programmatically you have to add Subview to the View
        // This is very important and must be done at all times
        view.addSubview(cardImageView)
        // Line below is also important and it basically says "Use auto layout"
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")

        // REMEMBER! Rule of thumb was to add 4 constraints to an object
        // The code below is for adding those constrains programmatically
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75),
        ])
    }

    func configureStopButton() {
        // This code is the same as dragging the UIButton on Storyboard
        view.addSubview(stopButton)
        // Here we will configure STOP button in code so it stops when you press it, without IBAction like in Storyboard
        // .touchUpInside is the same as button pressed!
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)


        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Below we pin the Stop button to cardImageView
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30),
        ])
    }

    func configureResetButton() {
        // This code is the same as dragging the UIButton on Storyboard
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)

        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            // leadingAnchor means from the left side (of the stop button)
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
        ])
    }

    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)

        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            // trailingAnchor means from the right side (of the stop button)
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
        ])
    }

    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
        // If we would be in NavigationController, we would write:
        // navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
}
