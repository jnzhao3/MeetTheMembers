//
//  StatsVC.swift
//  Meet the Members
//
//  Created by Michael Lin on 1/18/21.
//

import UIKit

class StatsVC: UIViewController {
    
    // MARK: STEP 11: Going to StatsVC
    // Read the instructions in MainVC.swift
    
    let dataExample: Array<Int?>
    let scoreInt: Int
    let streakInt: Int
    
    init(data: Array<Int?>) {
        self.dataExample = data
        self.scoreInt = dataExample[0]!
        self.streakInt = dataExample[1]!
        // Delegate rest of the initialization to super class
        // designated initializer.
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: >> Your Code Here <<
    
    // MARK: STEP 12: StatsVC UI
    // Action Items:
    // - Initialize the UI components, add subviews and constraints
    
    // MARK: >> Your Code Here <<
    private let scoreLabel: UILabel = {
        let label = UILabel()
                
        label.textColor = .darkGray
                
        // == NSTextAlignment(expected type).center
        label.textAlignment = .center
        
        // == UIFont.systemFont(ofSize: 27, UIFont.weight.medium)
        label.font = .systemFont(ofSize: 27, weight: .medium)
        
        // Must have if you are using constraints.
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let streakLabel: UILabel = {
        let label = UILabel()
                
        label.textColor = .darkGray
                
        // == NSTextAlignment(expected type).center
        label.textAlignment = .center
        
        // == UIFont.systemFont(ofSize: 27, UIFont.weight.medium)
        label.font = .systemFont(ofSize: 27, weight: .medium)
        
        // Must have if you are using constraints.
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        scoreLabel.text = "Score: " + String(scoreInt)
        streakLabel.text = "Streak: " + String(streakInt)
        
        view.addSubview(scoreLabel)
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            // For your understanding, here's what it's saying:
            //     welcomeLabel.leadingAnchor = view.leadingAnchor + 50
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            //     welcomeLabel.trailingAnchor = view.trailingAnchor - 50
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        view.addSubview(streakLabel)
        NSLayoutConstraint.activate([
            streakLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            
            // For your understanding, here's what it's saying:
            //     welcomeLabel.leadingAnchor = view.leadingAnchor + 50
            streakLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            //     welcomeLabel.trailingAnchor = view.trailingAnchor - 50
            streakLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        
        // MARK: >> Your Code Here <<
    }
}
