//
//  MainViewController.swift
//  ViewCode
//
//  Created by Leonardo Oliveira on 30/03/20.
//  Copyright © 2020 Leonardo Oliveira. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNextButton()
        
        view.backgroundColor = .blue
    }
    
    func setupNextButton() {
        nextButton.backgroundColor = .white
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.blue, for: .normal)
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        view.addSubview(nextButton)
        setNextButtonConstraints()
    }
    
    func setNextButtonConstraints() {
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func nextButtonTapped() {
        
        let nextScreen = NextViewController()
        nextScreen.title = "NEXT"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}
