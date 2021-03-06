//
//  File.swift
//  StickerAddOniMassage
//
//  Created by Mehedi on 11/8/21.
//

import UIKit
import Messages

class StickerBrowserViewController: MSStickerBrowserViewController {

  var stickers = [MSSticker]()

  func changeBrowserViewBackgroundColor(color: UIColor){
    stickerBrowserView.backgroundColor = color
  }

  func loadStickers(){

    createSticker(asset: "1", localizedDescription:"grinning face")
    createSticker(asset: "2", localizedDescription:"grimacing face")
    createSticker(asset: "3", localizedDescription:"grinning face with smiling eyes")
    createSticker(asset: "4", localizedDescription:"face with tears of joy")
    createSticker(asset: "5", localizedDescription:"smiling face with open mouth")
    createSticker(asset: "6", localizedDescription:"smiling face with open mouth and smiling eyes")

  }

  func createSticker(asset: String, localizedDescription: String){

    guard let stickerPath = Bundle.main.path(forResource: asset, ofType:"png") else {
      print("couldn't create the sticker path for", asset)
      return
    }

    // we use URL so, it's possible to use image from network
    let stickerURL = URL(fileURLWithPath:stickerPath)

    let sticker: MSSticker
    do {

      try sticker = MSSticker(contentsOfFileURL: stickerURL, localizedDescription: localizedDescription)
      // localizedDescription for accessibility

      stickers.append(sticker)
    }catch {
      print(error)
      return
    }

  }

  override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int{
    return stickers.count
  }

  override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker{

    return stickers[index] as MSSticker

  }

}
