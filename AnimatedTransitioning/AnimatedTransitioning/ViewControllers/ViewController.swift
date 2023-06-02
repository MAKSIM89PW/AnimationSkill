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
        button.addTarget(self, action: #selector(presentButtonTaped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var transition = CircularTransition()
    
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
        secondViewController.modalPresentationStyle = .custom
        secondViewController.transitioningDelegate = self
        
//        present(secondViewController, animated: true)
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension ViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = presentButton.center
        transition.circleColor = presentButton.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = presentButton.center
        transition.circleColor = presentButton.backgroundColor!
        return transition
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
