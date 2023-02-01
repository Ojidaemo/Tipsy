//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Vitali Martsinovich on 2023-01-31.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let secondView: UIView = {
        let secondView = UIView()
        secondView.backgroundColor = #colorLiteral(red: 0.7364435792, green: 0.8989037871, blue: 0.9391706586, alpha: 1)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        return secondView
    }()
    
    private lazy var recalculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Recalculate", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.addTarget(self, action: #selector(recalculateButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0"
        label.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 45)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var totalPerPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Total per person"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private var settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Split between bla-bla-bla with 10% split"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    
    @objc func recalculateButtonPressed() {
        
        dismiss(animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(secondView)
        secondView.addSubview(totalPerPersonLabel)
        secondView.addSubview(totalLabel)
        view.addSubview(settingsLabel)
        view.addSubview(recalculateButton)
        setConstraints()

    }
    
    func setConstraints() {
        NSLayoutConstraint.activate ([
            
            secondView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            secondView.heightAnchor.constraint(equalToConstant: 250),
            
            totalPerPersonLabel.heightAnchor.constraint(equalToConstant: 100),
            totalPerPersonLabel.topAnchor.constraint(equalTo: secondView.topAnchor,constant: 20),
            totalPerPersonLabel.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            
            totalLabel.heightAnchor.constraint(equalToConstant: 36),
            totalLabel.topAnchor.constraint(equalTo: totalPerPersonLabel.bottomAnchor,constant: 0),
            totalLabel.leadingAnchor.constraint(equalTo: secondView.leadingAnchor),
            totalLabel.trailingAnchor.constraint(equalTo: secondView.trailingAnchor),
            
            settingsLabel.heightAnchor.constraint(equalToConstant: 100),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            settingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            settingsLabel.topAnchor.constraint(equalTo: secondView.bottomAnchor),
            
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
