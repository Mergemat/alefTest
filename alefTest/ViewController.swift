//
//  ViewController.swift
//  alefTest
//
//  Created by baga on 05.11.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CellDelegate {
    // MARK: OUTLETS

    @IBOutlet var addChildButton: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ageTextField: CustomTextField!
    @IBOutlet var nameTextField: CustomTextField!
    @IBOutlet var clearButton: UIButton!
    var alert = UIAlertController()

    var childCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Table View set

        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self

        setUI()
    }

    // MARK: Настройка UI

    func setUI() {
        addChildButton.layer.cornerRadius = 20
        addChildButton.layer.borderWidth = 3
        addChildButton.layer.borderColor = CGColor(red: 0.004, green: 0.655, blue: 0.992, alpha: 1)

        clearButton.layer.cornerRadius = 27
        clearButton.layer.borderWidth = 3
        clearButton.layer.borderColor = UIColor(red: 0.812, green: 0.141, blue: 0.122, alpha: 1).cgColor
    }

    // MARK: Функция для удаления ячейки по нажатию кнопки в ней.

    func didPressButtonFor(cell: TableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        childCount -= 1
        tableView.deleteRows(at: [indexPath], with: .fade)
        addChildButton.isHidden = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }

    // MARK: Добавление ячейки по нажатию кнопки

    @IBAction func addChildren(_ sender: Any) {
        let indexPath = IndexPath(row: childCount, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        childCount += 1
        tableView.endUpdates()
        view.endEditing(true)
        if childCount == 5 {
            addChildButton.isHidden = true
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 157.0
    }

    // MARK: Очистка всего модуля

    @IBAction func clearAll(_ sender: Any) {
        alert = UIAlertController(title: "Подтвердите действие", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Сбросить данные", style: .destructive, handler: { _ in
            self.childCount = 0
            self.tableView.reloadData()
            self.addChildButton.isHidden = false
            self.nameTextField.text = ""
            self.ageTextField.text = ""
        }))

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(alert, animated: true)
    }
}
