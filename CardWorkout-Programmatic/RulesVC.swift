//
//  RulesVCViewController.swift
//  CardWorkout-Programmatic
//
//  Created by Māris Lakšs on 12/03/2023.
//

import UIKit

class RulesVC: UIViewController {
    // Concept of Segway exists only in Storyboard, no such thing creating an app programmatically

    let titleLabel      = UILabel()
    let rulesLabel      = UILabel()
    let exerciseLabel   = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
    }

    func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center

        // This is the same as pinning constraints in Storyboard, except this is done in code
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            // NOTE! When dealing with trailing numbers, it's always NEGATIVE
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            // REMEMBER - LABELS WHERE THE ONES WHO DON'T NEED 4 CONSTRAINTS, IT'S ENOUGH WITH 3
        ])
    }

    func configureRulesLabel() {
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = "The value of each card represents the number of exercise you do.\n\nJ = 11, Q = 12, K = 13, A = 14"
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.textAlignment = .center
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            // In this case the topAnchor is the bottom of the Title (Rules) label
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }

    func configureExerciseLabel() {
        view.addSubview(exerciseLabel)
        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseLabel.text = """
                                ♠️ = Push-ups

                                ♥️ = Sit-ups

                                ♣️ = Burpees

                                ♦️ = Jumping Jacks
                             """
        // The same as "♠️ = Push-ups\n\n❤️ = Sit-up\n\n♣️ = Burpees\n\n♦️ = Jumping Jacks"
        exerciseLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        // We don't need textAlignment this time because it's from the left by default
        exerciseLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            // Here we pin topAnchor to the bottom of the rules label
            exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 60),
            exerciseLabel.widthAnchor.constraint(equalToConstant: 200),
            exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
