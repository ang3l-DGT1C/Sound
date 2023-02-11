//
//  ViewController.swift
//  Sound
//
//  Created by Ángel González on 10/02/23.
//

import UIKit
//import SwiftySound
import AVFoundation

class ViewController: UIViewController {
    var player = AVAudioPlayer()
    var sonido = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let iv = UIImageView(frame:view.frame.insetBy(dx:80, dy:150))
        view.addSubview(iv)
        // obtenemos la URL a la imagen que se agrego como recurso
        guard let gifURL = Bundle.main.url(forResource: "song", withExtension: "gif") else { return }
        iv.image = UIImage.animatedImage(withAnimatedGIFURL: gifURL)
        
        guard let soundURL = Bundle.main.url(forResource: "MUSIC3", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf:soundURL)
            player.numberOfLoops = -1
            player.play()
        } catch {
            print ("Error abriendo el archivo de sonido " + String(describing: error))
        }
        /* IMPLEMENTACION DEL SONIDO CON UN PAQUETE (no funcionó)
        Sound.play(url: soundURL, numberOfLoops:-1)
         */
        sonido = UIButton(frame:CGRect(x: 5, y: 45, width: 44, height: 44))
        sonido.setBackgroundImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
        sonido.setBackgroundImage(UIImage(systemName: "speaker.wave.1.fill"), for: .selected)
        sonido.addTarget(self, action:#selector(botonTouch), for:.touchUpInside)
        view.addSubview(sonido)
    }
    
    @objc func botonTouch() {
        sonido.isSelected = !sonido.isSelected
        if sonido.isSelected {
            player.pause()
        }
        else {
            player.play()
        }
    }
}

