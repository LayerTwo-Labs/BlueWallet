//
//  Handoff.swift
//  BlueWalletWatch Extension
//
//  Created by Admin on 9/27/21.
//  Copyright © 2021 BlueWallet. All rights reserved.
//

import Foundation

enum HandoffIdentifier: String {
  case ReceiveOnchain = "com.layertwolabs.bluewallet.receiveonchain"
  case Xpub = "com.layertwolabs.bluewallet.xpub"
  case ViewInBlockExplorer = "com.layertwolabs.bluewallet.blockexplorer"
}

enum HandOffUserInfoKey: String {
  case ReceiveOnchain = "address"
  case Xpub = "xpub"
}

enum HandOffTitle: String {
  case ReceiveOnchain = "View Address"
  case Xpub = "View XPUB"
}
