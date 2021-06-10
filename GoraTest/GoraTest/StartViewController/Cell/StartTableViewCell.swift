//
//  StartTableViewCell.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/4/21.
//

import UIKit
import SnapKit

final class StartTableViewCell: UITableViewCell, ViewModelAcceptingTableViewCell {
    typealias ViewModel = StartTableViewCellViewModel
    
    var viewModel: StartTableViewCellViewModel? {
        didSet {
            label.text = viewModel?.text
        }
    }
    
    private lazy var label = UILabel().do {
        $0.textAlignment = .left
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        obtainDisclosureIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(label)
        
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
    }
    
    private func obtainDisclosureIndicator() {
        accessoryType = .disclosureIndicator
    }
}

