//
//  ViewController.swift
//  loaderViewAnimation
//
//  Created by Максим Нурутдинов on 31.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var goButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Download and present", for: .normal)
        button.backgroundColor = .orange
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(goButton)
        
        NSLayoutConstraint.activate([
            goButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            goButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    @objc private func goButtonTapped() {
        print("tap")
    }

}

