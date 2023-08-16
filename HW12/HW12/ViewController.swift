import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var btn: UIButton!
    @IBOutlet private weak var textView: UITextView!
    
    @IBAction func btnAction(_ sender: Any) {
        myFunction()
        func myFunction() {
            /*:
             ## Упражнение - приведение типов и их контроль

             Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
             */
            let items: [Any] = [1, 2, 3, "Sanya", "IOs", 7.6, 1.5, true, false]
            for item in items { textView.text += ("\n \(item) \n") }
            /*:
             Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
             */

            for element in items {
                if let intValue = element as? Int {
                    textView.text += "\n Целое число: \(intValue) \n"
                } else if let doubleValue = element as? Double {
                    textView.text += "\n Вещественное число: \(doubleValue) \n"
                } else if let stringValue = element as? String {
                    textView.text += "\n Строка: \(stringValue)\n "
                } else if let boolValue = element as? Bool {
                    textView.text += "\n Булево значение: \(boolValue) \n"
                } else {
                    textView.text += "\n Неизвестный тип данных \n"
                }
            }

            /*:
             Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите крассиво на консоль пары ключ/значения для всех элементов коллекции.
             */

            let dictionary: [String: Any] = [
                "name": "Alexandr Filovets",
                "age": 22,
                "height": 172.5,
                "isStudentTechMeSkills": true
            ]
            for (key, value) in dictionary { textView.text += "\n Ключ:\(key) - Значение: \(value) \n" }
            /*:
             Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
             */
            var total: Double = 0

            for (_, value) in dictionary {
                if let intValue = value as? Int {
                    total += Double(intValue)
                } else if let doubleValue = value as? Double {
                    total += doubleValue
                } else if let stringValue = value as? String {
                    total += 1
                } else if let boolValue = value as? Bool {
                    boolValue ? (total += 2) : (total -= 3)
                }
            }
            textView.text += "\n Sum = \(total)\n"
            /*:
             Обнулите переменную `total` и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
             */
            
            total = 0

            for (_, value) in dictionary {
                if let intValue = value as? Int {
                    total += Double(intValue)
                } else if let doubleValue = value as? Double {
                    total += doubleValue
                } else if let stringValue = value as? String {
                    if let stringInt = Int(stringValue) {
                        total += Double(stringInt)
                    }
                }
            }
            textView.text += "\n New sum = \(total) \n"
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
