//
//  OnboardingSplashView.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 15/12/21.
//

import UIKit
import SnapKit

final class OnboardingSplashView: NomadCustomView {
    
    private let model: OnboardingModel
    
    private lazy var onboardingImageView: UIImageView = {
        let image = UIImage(named: model.image)
        let iv = UIImageView(image: image)
        iv.backgroundColor = .lightGray
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = model.title
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = model.subtitle
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .lightGray.withAlphaComponent(0.7)
        return label
    }()
    
    init(model: OnboardingModel = .init(image: "", title: "Titulo", subtitle: "Subtitlo")) {
        self.model = model
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViewHierarchy() {
        self.addSubview(onboardingImageView)
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
    }
    
    func configureConstraint() {
        
        onboardingImageView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(300)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.onboardingImageView.snp.bottom).offset(30)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(self.titleLabel.snp.leading)
            $0.trailing.equalTo(self.titleLabel.snp.trailing)
        }
        
        self.snp.makeConstraints {
            $0.bottom.equalTo(self.subtitleLabel.snp.bottom).offset(10)
            $0.width.equalTo(400)
        }
        
    }
    
    func configureStyle() {
        self.backgroundColor = .white
    }
    
    
}
