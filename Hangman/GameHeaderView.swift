//
//  GameHeaderView.swift
//  Hangman
//
//  Created by Shubham Goenka on 28/02/17.
//  Copyright © 2017 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameHeaderView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var quitButton: UIButton!
    var hangmanLabel: UILabel!
    var newGameButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        
        quitButton = UIButton(frame: CGRect(x: 0, y: self.frame.height * 0.05, width: self.frame.width * 0.25, height: self.frame.height * 0.9))
        quitButton.setTitle("Quit", for: .normal)
        quitButton.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        quitButton.setTitleColor(.black, for: .normal)
        quitButton.titleLabel?.adjustsFontSizeToFitWidth = true
        quitButton.titleLabel?.numberOfLines = 1
        quitButton.clipsToBounds = true
        quitButton.titleLabel?.textAlignment = .left
        
        hangmanLabel = UILabel(frame: CGRect(x: self.frame.width * 0.25, y: 0, width: self.frame.width * 0.5, height: self.frame.height))
        hangmanLabel.text = "HANGMAN"
        hangmanLabel.textAlignment = .center
        hangmanLabel.textColor = UIColor.blue
        hangmanLabel.font = UIFont(name: "Avenir", size: 25)
        hangmanLabel.adjustsFontSizeToFitWidth = true
        hangmanLabel.numberOfLines = 1
        hangmanLabel.shadowOffset = CGSize(width: 1, height: 1)
        hangmanLabel.shadowColor = UIColor.lightGray
        
        newGameButton = UIButton(frame: CGRect(x: self.frame.width * 0.75, y: self.frame.height * 0.05, width: self.frame.width * 0.25, height: self.frame.height * 0.9))
        newGameButton.setTitle("New Game", for: .normal)
        newGameButton.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        newGameButton.setTitleColor(.black, for: .normal)
        newGameButton.titleLabel?.adjustsFontSizeToFitWidth = true
        newGameButton.titleLabel?.numberOfLines = 1
        newGameButton.clipsToBounds = true
        newGameButton.titleLabel?.textAlignment = .right
        
        addSubview(quitButton)
        addSubview(hangmanLabel)
        addSubview(newGameButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

