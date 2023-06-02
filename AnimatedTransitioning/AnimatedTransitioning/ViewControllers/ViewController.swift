//
//  ViewController.swift
//  AnimatedTransitioning
//
//  Created by Максим Нурутдинов on 02.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var presentButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.setTitle("GO", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(presentButtonTaped), for: .touchDragInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewWillLayoutSubviews() {
        presentButton.layer.cornerRadius = presentButton.frame.width / 2
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        title = "FIRST"
        view.backgroundColor = .white
        
        view.addSubview(presentButton)
    }
    
    @objc private func presentButtonTaped() {
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        present(secondViewController, animated: true)
        
    }

}

extension ViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.heightAnchor.constraint(equalToConstant: 60),
            presentButton.widthAnchor.constraint(equalToConstant: 60)
        
        ])
    }
}
