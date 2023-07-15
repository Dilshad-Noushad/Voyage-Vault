//
//  ViewModel.swift
//  Voyage Vault
//
//  Created by Dilshad N on 24/01/23.
//

import Foundation
import UIKit
import SwiftUI

class AppVM: ObservableObject {
    @Published var navToHome: Bool = false
    @Published var showDetailPage: Bool = false
}
