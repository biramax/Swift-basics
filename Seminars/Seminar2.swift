// Написать функцию, которая на вход принимает число типа Int, а возвращает, является ли число четным

func checkEven(value: Int) -> Bool {
    return value % 2 == 0
}

var res = checkEven(value: 6)
print(res)



// Написать функцию, которая на вход принимает 3 числа: a, b, c и возвращает результат вычисления b^2 - 4 * a * c

func calc(a: Int, b: Int, c: Int) -> Int {
    b * b - 4 * a * c
}

print(calc(a: 4, b: 2, c: 3))



// Написать функцию, которая рассчитает площадь прямоугольника. На вход два параметра: длина и ширина, на выход: площадь

func calcSquare(a w: Int, b h: Int) -> Int {
    w * h
}
print(calcSquare(a: 4, b: 5))



// Напишите функции, которая на вход принимает целое положительное число, а возвращает сумму всех чисел от 1 до переданного числа

func sum(x: Int) -> Int {
    var res = 0
    for i in 1...x {
        res += i
    }
    return res
}

print(sum(x: 5))



// Создать опционал с типом Int и создать еще одну переменную, которая содержит значение первой переменной, но не является опционалом.  Сделать это необходимо 2 способами: при помощи force unwrapping,  nil coalescing

var a: Int? = 5

var b = a! // Force unwrapping

var b = a ?? 8 // Nil coalescig



// Создать перечисление, которое имеет в виде кейсов два вида чая: зеленый и черный
// Задать для кейсов названия “Black tea” и “Green tea”

enum Tea: String {

    case green = "Green tea"
    case black = "Black tea"
    
    // Написать внутри перечисления функцию, которая будет возвращать цвет чая в строковом формате, то есть, если это blackTea, то black, а если greenTea, то green

    func returnColor() -> String {
        switch self {
            case .green: return "green"
            case .black: return "black"
        }
    }
}



// Создать переменную с типом созданного перечисления, а затем при помощи print вывести цвет чая

var tea1: Tea = .green // 1й способ
var tea2 = Tea.black   // 2й способ

print(tea1.returnColor())
print(tea2.returnColor())



// Написать функцию, которая на вход принимает параметр типа Tea, но который является опционалом. Функция должна печатать название чая, если значение есть и “Данный вид чая не найден”, если значение nil. Написать функцию нужно в 2 вариантах: используя guard let, используя if let

func printTeaName(tea: Tea?) {
    guard let tea = tea else {
        print("Данный вид чая не найден")
        return
    }
    print(tea.rawValue)
}

printTeaName(tea: .black)
printTeaName(tea: nil)

func printTeaName2(tea: Tea?) {
    if let tea {
        print(tea.rawValue)
    } else {
        print("Данный вид чая не найден")
    }
}

printTeaName2(tea: .black)
printTeaName2(tea: nil)
