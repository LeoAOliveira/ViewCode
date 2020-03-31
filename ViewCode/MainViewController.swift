//
//  MainViewController.swift
//  ViewCode
//
//  Created by Leonardo Oliveira on 30/03/20.
//  Copyright © 2020 Leonardo Oliveira. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    let nextButton = UIButton()
    let backgroundImageView = UIImageView()
    let mainImageView = UIImageView()
    let sounds = Audios().sounds

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupMainImage()
        setupNextButton()
    }
    
    func setupBackground() {
        let backgroundImage = UIImage(named: "Space")
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        
        view.addSubview(backgroundImageView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupMainImage() {
        let mainImage = UIImage(named: "SWBackground")
        mainImageView.image = mainImage
        mainImageView.contentMode = .scaleAspectFit
        
        view.addSubview(mainImageView)
        
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.133).isActive = true
    }
    
    func setupNextButton() {
        nextButton.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        view.addSubview(nextButton)
        setNextButtonConstraints()
    }
    
    func setNextButtonConstraints() {
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    @objc func nextButtonTapped() {
        
        let nextScreen = NextViewController()
        nextScreen.title = "NEXT"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEvent.EventSubtype.motionShake{
            playAudio()
        }
    }
    
    func playAudio() {
        
        let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
        
        guard let fileLocation = Bundle.main.path(forResource: sounds[randomNumber], ofType: "mp3") else {
            return
        }
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation))
            
        } catch {
            createAlert(title: "Error", message: "Error loading the sound", actionTitle: "Ok")
            return
        }
        
        DispatchQueue.main.async {
            self.player?.play()
        }
    }
    
    func createAlert(title: String, message: String, actionTitle: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let fillLabelAction = UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(fillLabelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
