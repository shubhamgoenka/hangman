//
//  GuessView.swift
//  Hangman
//
//  Created by Shubham Goenka on 28/02/17.
//  Copyright © 2017 Shawn D'Souza. All rights reserved.
//

import UIKit

class GuessView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var guessLabel: UILabel!
    var guessTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        
        guessLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width * 0.5 - 2.5, height: self.frame.height))
        guessLabel.adjustsFontSizeToFitWidth = true
        guessLabel.clipsToBounds = true
        guessLabel.font = UIFont(name: "Avenir", size: 20)
        guessLabel.numberOfLines = 1
        guessLabel.textAlignment = .left
        guessLabel.text = "Your Guess:"
        guessLabel.textColor = .black
        
        guessTextField = UITextField(frame: CGRect(x: self.frame.width * 0.5 + 2.5, y: 0, width: self.frame.width * 0.5 - 2.5, height: self.frame.height))
        guessTextField.adjustsFontSizeToFitWidth = true
        guessTextField.borderStyle = .roundedRect
        guessTextField.clipsToBounds = true
        guessTextField.font = UIFont(name: "Avenir", size: 20)
        guessTextField.textColor = .black
        guessTextField.textAlignment = .right
        
        addSubview(guessLabel)
        addSubview(guessTextField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
