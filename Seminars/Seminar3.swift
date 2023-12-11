// 1. Создать массив [5, 6, -14, 25], а затем создать новую переменную с отсортированным по возрастанию ранее созданным массивом.

var a = [5, 6, -14, 25]

var aSorted = a.sorted { $0 < $1 }

print(aSorted)



// 2. Создать массив,  а затем создать переменную, в которой будет хранится ранее созданные массив, но в нем каждое значение должно быть увеличено на 5.

var a = [5, 6, -14, 25]

var aModified = a.map { $0 + 5 }

print(aModified)



// 3. Создать массив,  а затем создать переменную, в которой будет хранится ранее созданные массив, но в нем не должно быть ни отрицательных чисел, ни числа 12, а также каждое значение должно быть увеличено в 2 раза.

var a = [5, 6, 12, -14, 25]

var aModified = a.map { $0 * 2 }.filter { $0 >= 0 && $0 != 12 }

print(aModified)



// 4. Создать словарь, в котором ключ будет целым числом, а значение строкой

var a: [Int: String] = [:]



// 5. Создать массив [2, 6, 25, 4, 2, 2, 10, 2], затем создать новую переменную, в которой будут те же значения, что и в ранее созданном массиве, но не должно быть повторяющихся значений.

var a = [2, 6, 25, 4, 2, 2, 10, 2]

var b = Set(a)

print(b)



// 6. Написать функцию, которая на вход принимает массив целых чисел, а возвращает true или false. true, если результат сложения всех чисел массива больше или равно 100, false, если меньше 100


func myFunc(a: [Int]) -> Bool {
    a.reduce(0, +) >= 100
}

print(myFunc(a: [2, 6, 4, 2, 2, 10, 200]))



// 7. Создать переменную, в которой будет хранится замыкание, в которое передается словарь с ключом типа Int и значением типа String, а в ходе выполнения замыкания в консоль печатаются все значения словаря, ключ у которых больше 5

var a = { (a: [Int: String]) in
    for (k, v) in a {
        if k > 5 {
            print(v)
        }
    }
}

a([5: "Five", 7: "Seven"])



// 8. Создать перечисление, которое имеет в виде кейсов три вида чая: зеленый, черный и фруктовый. Затем создать словарь, в котором ключ это вид чая, а значение это стоимость и заполнить этот словарь.

enum Tea {
    case green
    case black
    case fruit
}

let a: [Tea: Int] = [.green: 100, .black: 150, .fruit: 200]



// 9. Написать функцию, которая на вход принимает такой же словарь, как в задании 1, а возвращает новый, который создан по следующим правилам: у фруктового чая стоимость должна быть увеличена на 30%, у черного уменьшена в 1.6 раза, а у зеленого уменьшена на 9.5%

func myFunc(a: [Tea: Int]) -> [Tea: Int] {
    var b: [Tea: Int] = [:]
    for (k, v) in a {
        switch k {
        case .green: b.updateValue(v * 0.905, forKey: k)
        case .black: b.updateValue(v * 0.5, forKey: k)
        case .fruit: b.updateValue(v * 0.3, forKey: k)
        }
    }
    return b
}

enum Tea {
    case green
    case black
    case fruit
}

let a: [Tea: Int] = [.green: 100, .black: 150, .fruit: 200]

myFunc(a: a)



// 10. Написать функцию, которая на вход принимает два целочисленных массива, которые содержат координаты начала и конца отрезка соответственно. Первый элемент массива это x, а второй y. Функция должна вернуть массив, который содержит координаты середины отрезка

func myFunc(a: [Int], b: [Int]) -> [Int] {
    guard a.count == 2 && b.count == 2 else {
        return []
    }
    return [(a[0] + b[0]) / 2, (a[1] + b[1]) / 2]
}

print(myFunc(a: [2, 2], b: [4, 4]))



// 11. Написать функцию, которая на вход принимает массив из 4 целых чисел (если чисел меньше или больше должно вернуться nil). Функция возвращает новый массив, который состоит из 3 элементов, первый элемент это первый элемент переданного массива, второй элемент это сумма второго и третьего элемента (индексы 1 и 2) переданного массива, последний элемент это последний элемент переданного массива. Также этот массив должен быть отсортирован по убыванию.

func myFunc(a: [Int]) -> [Int]? {
    guard a.count == 4 else {
        return nil
    }
    
    // return [a[0], a[1] + a[2], a[3]].sorted { $0 > $1 }
    return [a[0], a[1] + a[2], a[3]].sorted(by: >)
}

let a: [Int] = [4, 6, 7, 10]

print(myFunc(a: a))



// 12. Создайте массив, который состоит из всех целых чисел от 1 до 50

let a = Array(1...50)

print(a)



// 13. Напишите замыкание, которое принимает на вход два целых числа и возвращает их сумму, затем вызовите это замыкание

let closure = { (a: Int, b: Int) in
    a + b
}

print(closure(5, 9))



// 14. Напишите функцию, которая на вход будет принимать замыкание, которое на вход принимает целое число, но ничего не возвращает. Функция также не должна ничего возвращать. Внутри функции должен печататься тип замыкания

func closureFunc(closure: (Int) -> Void) {
    print(type(of: closure))
}

// Вариант 1
closureFunc(closure: {_ in})

// Вариант 2
closureFunc() {_ in}

// Вариант 3
closureFunc {_ in}



// 15. Создать массив и при помощи forEach вывести в консоль все значения

let a = [5, 10, 15]

// Вариант 1
a.forEach { el in
    print(el)
}

// Вариант 2
a.forEach { print($0) }


