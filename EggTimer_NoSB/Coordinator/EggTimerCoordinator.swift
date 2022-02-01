//
//  EggTimerCoordinator.swift
//  EggTimer_NoSB
//
//  Created by Raúl Pavón on 31/01/22.
//

import Foundation
import UIKit

class EggTimerCoordinator {
    var navigationController: UINavigationController
    private let factory =  EggTimerFactoryImp()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let eggTimerViewController = factory.makeEggTimerViewController(eggTimerCoordinator: self)
        navigationController.setViewControllers([eggTimerViewController], animated: false)
    }
}
