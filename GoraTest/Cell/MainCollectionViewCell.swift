//
//  MainCollectionViewCell.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/6/21.
//

import UIKit
import SnapKit

final class MainCollectionViewCell: UICollectionViewCell, ViewModelAcceptingCollectionViewCell {
    typealias ViewModel = MainCollectionViewCellViewModel
    
    var viewModel: MainCollectionViewCellViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.label.text = self.viewModel?.title
                self.imageView.loadImageUsingCache(withUrl: self.viewModel?.imageUrl ?? "")
            }
        }
    }
    
    private lazy var imageView = UIImageView().do {
        $0.contentMode = .scaleToFill
    }
    
    private lazy var label = PaddingLabel(top: 0, left: 20, bottom: 0, right: 20).do {
        $0.backgroundColor = .white
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    private lazy var contentStackView = UIStackView().do {
        $0.axis = .vertical
        $0.spacing = 10
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.backgroundColor = .white
        $0.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        $0.isLayoutMarginsRelativeArrangement = true
        $0.addArrangedSubviews(imageView, label)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        obtainShadowWithCorner()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(contentStackView)
        
        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func obtainShadowWithCorner() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 10
    }
}
