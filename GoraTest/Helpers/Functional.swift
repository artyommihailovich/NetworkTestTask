//
//  Functional.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/4/21.
//

import Foundation

protocol FunctionalWrapper {}

extension NSObject: FunctionalWrapper {}

extension FunctionalWrapper {
    func `do`(_ mutator: (Self) -> Void) -> Self {
        mutator(self)
        return self
    }
}
