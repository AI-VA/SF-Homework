import UIKit


// MARK: 1. Создай кортеж для двух человек с одинаковыми типами данных и параметрами.
// При том одни значения доставай по индексу, а другие — по параметру.

let person1 = (name: "John", age: 30)
let person2 = (name: "Sarah", age: 25)

print(person1.0) // "John"
print(person2.age) // 25


// MARK: 2. Создай массив «дни в месяцах» (12 элементов содержащих количество дней в соответствующем месяце). Используя цикл for и этот массив, выведи количество дней в каждом месяце:

let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

for (index, days) in daysInMonths.enumerated() {
    print("Количество дней в месяце \(index + 1) равно \(days)")
}


// Используй еще один массив с именами месяцев чтобы вывести название месяца + количество дней:
let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let monthNames = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]

for (index, days) in daysInMonths.enumerated() {
    print("\(monthNames[index]) содержит \(days) дней")
}


// Сделай тоже самое, но используя массив кортежей с параметрами (имя месяца, количество дней):
let months = [("Январь", 31), ("Февраль", 28), ("Март", 31), ("Апрель", 30), ("Май", 31), ("Июнь", 30), ("Июль", 31), ("Август", 31), ("Сентябрь", 30), ("Октябрь", 31), ("Ноябрь", 30), ("Декабрь", 31)]

for month in months {
    print("\(month.0) содержит \(month.1) дней")
}


// Сделай тоже самое, только выведи дни в обратном порядке (порядок в исходном массиве не меняется)
let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let monthNames = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]

for (index, days) in daysInMonths.reversed().enumerated() {
    print("\(monthNames.reversed()[index]) содержит \(days) дней")
}


// Для произвольно выбранной даты (месяц и день) посчитай количество дней до конца года
let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let monthNames = ["январь", "февраль", "март", "апрель", "май", "июнь", "июль", "август", "сентябрь", "октябрь", "ноябрь", "декабрь"]

let month = 5 // май
let day = 20

// Сколько дней осталось в текущем месяце
let daysInCurrentMonth = daysInMonth[month - 1] - day + 1

// Сколько дней осталось в остальных месяцах до конца года
let daysInRestOfYear = daysInMonth.suffix(from: month).reduce(0, +)

let daysUntilEndOfYear = daysInCurrentMonth + daysInRestOfYear - 1 // -1 чтобы не учитывать текущий день
print("До конца года осталось \(daysUntilEndOfYear) дней")



// MARK: 3. Создай словарь, как журнал студентов, где имя и фамилия студента это ключ, а оценка за экзамен — значение.

var studentGrades = [
    "Иван Петров": 4.5,
    "Мария Сидорова": 5.0,
    "Петр Иванов": 3.8,
    "Ольга Новикова": 4.2,
    "Андрей Смирнов": 3.5
]

// Повысь студенту оценку за экзамен
studentGrades["Иван Петров"]! += 0.5


// Если оценка положительная (4 или 5) или удовлетворительная (3), то выведи сообщение с поздравлением, отрицательная (1, 2) - отправь на пересдачу
if let grade = studentGrades["Иван Петров"] {
    if grade >= 4 {
        print("Поздравляем, вы успешно сдали экзамен!")
    } else if grade >= 3 {
        print("Ваша оценка за экзамен удовлетворительная. Можете попробовать улучшить ее в следующий раз.")
    } else {
        print("Ваша оценка за экзамен недостаточная. Вам нужно пересдать экзамен.")
    }
} else {
    print("Оценка не найдена.")
}

// Добавь еще несколько студентов — это будут новые одногруппники!
studentGrades["Мария Иванова"] = 5
studentGrades["Алексей Сидоров"] = 3
studentGrades["Никита Петров"] = 2

// Удали одного студента — он отчислен
studentGrades.removeValue(forKey: "Никита Петров")

// Посчитай средний балл всей группы по итогам экзамена.
var sum: Double = 0
for grade in studentGrades.values {
    sum += grade
}

let average = Double(sum) / Double(studentGrades.count)
print("Средний балл группы: \(average)")
