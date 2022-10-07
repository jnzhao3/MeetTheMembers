//
//  MainVC.swift
//  Meet the Members
//
//  Created by Michael Lin on 1/18/21.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    
    // Create a property for our timer, we will initialize it in viewDidLoad
    var timer: Timer?
    var currentName: String?
    var currentScore: Int?
    var currentStreak: Int?
//    var score: Int
    
    // MARK: STEP 7: UI Customization
    // Action Items:
    // - Customize your imageView and buttons.
    
    let imageView: UIImageView = {
        let view = UIImageView()
        
        // MARK: >> Your Code Here <<
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let buttons: [UIButton] = {
        return (0..<4).map { index in
            let button = UIButton()

            // Tag the button its index
            button.tag = index
            
            // MARK: >> Your Code Here <<
            var config = UIButton.Configuration.tinted()
//            config.image = UIImage(systemName: "play.circle")
//            config.imagePadding = 10
            config.buttonSize = .medium
            config.baseForegroundColor = .systemBlue
            config.baseBackgroundColor = .systemBlue
            
            button.configuration = config
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }
        
    }()
    
    // MARK: STEP 10: Stats Button
    // Action Items:
    // - Follow the examples you've seen so far, create and
    // configure a UIButton for presenting the StatsVC. Only the
    // callback function `didTapStats(_:)` was written for you.
    
    // MARK: >> Your Code Here <<
    let statsButton: UIButton = {
        let statsButton = UIButton()
//        statsButton.setTitle("Statistics", for: .normal)
        
        var config = UIButton.Configuration.tinted()
        config.image = UIImage(systemName: "chart.bar.xaxis")
        config.buttonSize = .large
        config.imagePadding = 10
        config.baseForegroundColor = .systemBlue
        config.baseBackgroundColor = .systemBlue
        
        statsButton.configuration = config
        
        statsButton.translatesAutoresizingMaskIntoConstraints = false
        
        return statsButton
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        // MARK: STEP 6: Adding Subviews and Constraints
        // Action Items:
        // - Add imageViews and buttons to the root view.
        // - Create and activate the layout constraints.
        // - Run the App
        
        // Additional Information:
        // If you don't like the default presentation style,
        // you can change it to full screen too! However, in this
        // case you will have to find a way to manually to call
        // dismiss(animated: true, completion: nil) in order
        // to go back.
        //
        // modalPresentationStyle = .fullScreen
        
        // MARK: >> Your Code Here <<
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 88),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
//        view.addSubview(buttons[0])
//        NSLayoutConstraint.activate([
//            buttons[0].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 450),
//            buttons[0].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            buttons[0].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
//        // TODO: do this for all buttons
//        // TODO: button configuration
//        // TODO: center it, or put it in a better position
//
//        ])
//
//        view.addSubview(buttons[1])
//        NSLayoutConstraint.activate([
//            buttons[1].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
//            buttons[1].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            buttons[1].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
//        // TODO: do this for all buttons
//
//        ])
//
//        view.addSubview(buttons[2])
//        NSLayoutConstraint.activate([
//            buttons[2].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 550),
//            buttons[2].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            buttons[2].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
//        // TODO: do this for all buttons
//
//        ])
//
//        view.addSubview(buttons[3])
//        NSLayoutConstraint.activate([
//            buttons[3].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
//            buttons[3].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            buttons[3].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
//        // TODO: do this for all buttons
//
//        ])
        
        view.addSubview(statsButton)
        NSLayoutConstraint.activate([
            statsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            statsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        for i in 0...3 {
            view.addSubview(buttons[i])
            NSLayoutConstraint.activate([
                buttons[i].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(450 + i*50)),
                buttons[i].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                buttons[i].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
            // TODO: do this for all buttons
                
            ])
        }
        
        currentScore = 0
        currentStreak = 0
        getNextQuestion()
        
        // MARK: STEP 9: Bind Callbacks to the Buttons
        // Action Items:
        // - Bind the `didTapAnswer(_:)` function to the buttons.
        
        // MARK: >> Your Code Here <<
        for i in 0...3 {
            buttons[i].addTarget(self, action: #selector(tapAnswerHandler/*(_:)*/), for: .touchUpInside)
        }
//        buttons[1].addTarget(self, action: #selector(tapAnswerHandler(_:)), for: .touchUpInside)
//        buttons[2].addTarget(self, action: #selector(tapAnswerHandler(_:)), for: .touchUpInside)
//        buttons[3].addTarget(self, action: #selector(tapAnswerHandler(_:)), for: .touchUpInside)
        
        
        // MARK: STEP 10: Stats Button
        // See instructions above.
        statsButton.addTarget(self, action: #selector(tapStatsHandler(_: )), for: .touchUpInside)
        
        // MARK: >> Your Code Here <<
    }
    
    // What's the difference between viewDidLoad() and
    // viewWillAppear()? What about viewDidAppear()?
    override func viewWillAppear(_ animated: Bool) {
        // MARK: STEP 13: Resume Game
        
        // MARK: >> Your Code Here <<
    }
    
    func getNextQuestion() {
        // MARK: STEP 5: Data Model
        // Action Items:
        // - Get a question instance from `QuestionProvider`
        // - Configure the imageView and buttons with information from
        //   the question instance
        
        // MARK: >> Your Code Here <<
        let newProvider = QuestionProvider()
        if let nextQ = newProvider.nextQuestion() {
            imageView.image = nextQ.image
            for i in 0..<buttons.count {
                buttons[i].setTitle(nextQ.choices[i], for: .normal)
            }
            currentName = nextQ.answer
        }
    }
    
    // MARK: STEP 8: Buttons and Timer Callback
    // You don't have to
    // Action Items:
    // - Complete the callback function for the 4 buttons.
    // - Complete the callback function for the timer instance
    // - Call `startTimer()` where appropriate
    //
    // Additional Information:
    // Take some time to plan what should be in here.
    // The 4 buttons should share the same callback.
    //
    // Add instance properties and/or methods
    // to the class if necessary. You may need to come back
    // to this step later on.
    //
    // Hint:
    // - Checkout `UIControl.addAction(_:for:)`
    //      (`UIButton` subclasses `UIControl`)
    // - You can use `sender.tag` to identify which button is pressed.
    // - The timer will invoke the callback every one second.
    func startTimer() {
        // Create a timer that calls timerCallback() every one second
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func timerCallback() {
        
        // MARK: >> Your Code Here <<
        startTimer()
    }
    
    @objc func tapAnswerHandler(/*_ action: UIAction, */sender button: UIButton) {
        // MARK: >> Your Code Here <<
        if button.currentTitle == currentName {
            currentScore! += 1
            currentStreak! += 1
//            button.configuration?.baseBackgroundColor = .systemGreen
//            button.configuration?.baseForegroundColor = .systemGreen
//            UIView.animate(withDuration: 5.0, delay: 5.0, options: .curveLinear, animations: {
//                button.configuration?.baseBackgroundColor = .systemGreen
//                button.configuration?.baseForegroundColor = .systemGreen
//            }
//            )
//            UIView.animate(withDuration: 0.3, delay: 5.0, options: .curveLinear, animations: {
//                button.configuration?.baseBackgroundColor = .systemBlue
//                button.configuration?.baseForegroundColor = .systemBlue
//            })
        }
        else {
            currentStreak = 0
//            button.configuration?.baseBackgroundColor = .systemRed
//            button.configuration?.baseForegroundColor = .systemRed
        }
        getNextQuestion()
        

    }
    
    @objc func tapStatsHandler(_ action: UIAction) {
        
        
        
        let vc = StatsVC(data: Array([currentScore, currentStreak]))
        
//        vc.modalPresentationStyle = .fullScreen
        
        // MARK: STEP 11: Going to StatsVC
        // When we are navigating between VCs (e.g MainVC -> StatsVC),
        // we often need a mechanism for transferring data
        // between view controllers. There are many ways to achieve
        // this (initializer, delegate, notification center,
        // combined, etc.). We will start with the easiest one today,
        // which is custom initializer.
        //
        // Action Items:
        // - Pause the game when stats button is tapped i.e. stop the timer
        // - Read the example in StatsVC.swift, and replace it with
        //   your custom init for `StatsVC`
        // - Update the call site here on line 139
        
        present(vc, animated: true, completion: nil)
    }
}
