//
//  EggTimerFactory.swift
//  EggTimer_NoSB
//
//  Created by Raúl Pavón on 31/01/22.
//

import Foundation

protocol EggTimerFactory {
    func makeEggTimerViewController(eggTimerCoordinator: EggTimerCoordinator) -> EggTimerViewController
}

class EggTimerFactoryImp: EggTimerFactory {
    func makeEggTimerViewController(eggTimerCoordinator: EggTimerCoordinator) -> EggTimerViewController {
        let eggTimerViewController = EggTimerViewController(factory: self, eggTimerCoordinator: eggTimerCoordinator)
        return eggTimerViewController
    }
}
