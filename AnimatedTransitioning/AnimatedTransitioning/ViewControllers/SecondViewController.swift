//
//  SecondViewController.swift
//  AnimatedTransitioning
//
//  Created by Максим Нурутдинов on 02.06.2023.
//

import UIKit

final class SecondViewController: UIViewController {
    private lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("X", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(dismissButtonTaped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewWillLayoutSubviews() {
        dismissButton.layer.cornerRadius = dismissButton.frame.width / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        title = "SECOND"
        view.backgroundColor = .orange
        
        view.addSubview(dismissButton)
    }
    
    @objc private func dismissButtonTaped() {
        dismiss(animated: true)
//        navigationController?.popViewController(animated: true)
    }
}

extension SecondViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.heightAnchor.constraint(equalToConstant: 60),
            dismissButton.widthAnchor.constraint(equalToConstant: 60)
        
        ])
    }
}
