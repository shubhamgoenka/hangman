//
//  HomeViewController.swift
//  Hangman
//
//  Created by Shubham Goenka on 28/02/17.
//  Copyright © 2017 Shawn D'Souza. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var hangmanLabel: UILabel!
    var hangmanImageView: UIImageView!
    var playButton: UIButton!
    var helpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        
        view.backgroundColor = UIColor.white
        
        hangmanLabel = UILabel(frame: CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.2, width: view.frame.width * 0.5, height: 50))
        hangmanLabel.text = "HANGMAN"
        hangmanLabel.textAlignment = .center
        hangmanLabel.textColor = UIColor.blue
        hangmanLabel.font = UIFont(name: "Avenir-Bold", size: 50)
        hangmanLabel.adjustsFontSizeToFitWidth = true
        hangmanLabel.numberOfLines = 1
        hangmanLabel.shadowColor = UIColor.black
        
        hangmanImageView = UIImageView(frame: CGRect(x: view.frame.width * 0.5 - view.frame.height * 0.175 + 75, y: view.frame.height * 0.2 + 150, width: (view.frame.height * 0.35 - 150), height: (view.frame.height * 0.35 - 150)))
        hangmanImageView.clipsToBounds = true
        hangmanImageView.contentMode = .scaleAspectFill
        hangmanImageView.image = #imageLiteral(resourceName: "hangman7")
        
        playButton = UIButton(frame: CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.55 + 100, width: view.frame.width * 0.4, height: 40))
        playButton.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
        playButton.setTitle("New Game", for: .normal)
        playButton.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        playButton.setTitleColor(.black, for: .normal)
        playButton.titleLabel?.adjustsFontSizeToFitWidth = true
        playButton.titleLabel?.numberOfLines = 1
        playButton.clipsToBounds = true
        
        helpButton = UIButton(frame: CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.55 + 165, width: view.frame.width * 0.4, height: 40))
        helpButton.addTarget(self, action: #selector(helpPressed), for: .touchUpInside)
        helpButton.setTitle("How To Play", for: .normal)
        helpButton.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        helpButton.setTitleColor(.black, for: .normal)
        helpButton.titleLabel?.adjustsFontSizeToFitWidth = true
        helpButton.titleLabel?.numberOfLines = 1
        helpButton.clipsToBounds = true
        
        view.addSubview(hangmanLabel)
        view.addSubview(hangmanImageView)
        view.addSubview(playButton)
        view.addSubview(helpButton)
    }
    
    func playPressed() {
        self.performSegue(withIdentifier: "toGame", sender: self)
    }
    
    func helpPressed() {
        self.performSegue(withIdentifier: "toHelp", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
