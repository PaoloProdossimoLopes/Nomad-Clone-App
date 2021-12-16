//
//  OnboardingViewController.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 14/12/21.
//

import UIKit

final class OnboardingViewController: NomadCustomViewController {
    
    private let viewModel: OnboardingViewModel
    
    private lazy var backBarButton: UIBarButtonItem = {
        let image = UIImage(systemName: "arrow.backward")
        let button = UIBarButtonItem(image: image, style: .plain, target: self,
                                     action: #selector(backBarButtonHandleTapped))
        button.tintColor = .black
        return button
    }()
    
    private lazy var closeBarButton: UIBarButtonItem = {
        let image = UIImage(systemName: "xmark")
        let button = UIBarButtonItem(image: image, style: .plain, target: self,
                                     action: #selector(closeBarButtonHandleTapped))
        button.tintColor = .black
        return button
    }()
    
    private lazy var progressBar: UIProgressView = {
        let bgColor: UIColor = .lightGray.withAlphaComponent(0.6)
        let pv = UIProgressView()
        pv.trackTintColor = bgColor
        pv.backgroundColor = bgColor
        pv.progressTintColor = .nomadYellowColor
        pv.layer.cornerRadius = 10/2
        pv.clipsToBounds = true
        pv.setProgress(0.2, animated: true)
        return pv
    }()
    
    private lazy var nextStepButton: NMDPrimaryButton = {
        let button = NMDPrimaryButton(buttonTitle: "Continuar")
        button.addTarget(self, action: #selector(nextStepButtonHandleTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var updatedView: UIView = OnboardingSplashView()
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    func configureViewHierarchy() {
        view.addSubview(nextStepButton)
        view.addSubview(updatedView)
    }
    
    func configureConstraint() {
        progressBar.snp.makeConstraints {
            $0.width.equalTo(250)
            $0.height.equalTo(10)
        }
        
        nextStepButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.equalTo(self.view.snp.leading).offset(20)
            $0.trailing.equalTo(self.view.snp.trailing).offset(-20)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        updatedView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.centerX.equalTo(self.view.snp.centerX)
        }
        
    }
    
    func configureStyle() {
        view.backgroundColor = .white
        configureNavigation()
    }
    
    private func configureNavigation() {
        navigationItem.leftBarButtonItem = backBarButton
        navigationItem.rightBarButtonItem = closeBarButton
        navigationItem.titleView = progressBar
    }
    
    @objc private func backBarButtonHandleTapped() {
        
    }
    
    @objc private func closeBarButtonHandleTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func nextStepButtonHandleTapped() {
        print("Tapped")
    }
    
}
