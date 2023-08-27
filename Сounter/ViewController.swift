//
//  ViewController.swift
//  Сounter
//
//  Created by Александр Гегешидзе on 23.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var count = 0
    
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "Значение счётчика: \(count)"
        historyTextView.isEditable = false
        historyTextView.text = " История изменений:"
    }
    
    // Текущая дата
    private func currentTime() -> String {
        let time = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let formatteddate = formatter.string(from: time as Date)
        return formatteddate
    }
    
    // Счетчик
    private func counter(sender: String) {
        if sender == "+" {
            self.count += 1
            countLabel.text = "Значение счётчика: \(count)"
        } else {
            self.count -= 1
            countLabel.text = "Значение счётчика: \(count)"
        }
    }

    @IBAction private func plusButton(_ sender: UIButton) {
        guard let sender = sender.titleLabel?.text else { return }
        let time = currentTime()
        counter(sender: sender)
        historyTextView.text += "\n\(time): значение изменено на \(sender)1"
    }
    
    @IBAction private func minusButton(_ sender: UIButton) {
        guard let sender = sender.titleLabel?.text else { return }
        let time = currentTime()
        if count > 0 {
            counter(sender: sender)
            historyTextView.text += "\n\(time): значение изменено на \(sender)1"
        } else {
            historyTextView.text += "\n\(time): попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction private func clearButton(_ sender: UIButton) {
        count = 0
        let time = currentTime()
        countLabel.text = "Значение счётчика: \(count)"
        historyTextView.text += "\n\(time): значение сброшено"
    }
}

