
// Структура пиццы 

struct Pizza: MenuItem {
    
    var price: Int
    var type: PizzaType
    var thickness: Thickness // Толщина теста
    var toppings: [Toppings] // Добавки

    // Виды пиццы
    enum PizzaType {
        case pepperoni
        case margarita
        case neapolitano
        case fourCheeses
        case caesar
    }
    
    // Толщина теста
    enum Thickness {
        case thin
        case thick
    }
    
    // Добавки
    enum Toppings {
        case pepperoni
        case tomatos
        case chees
    }
}


// Структура картошки фри

struct Fries: MenuItem {
    
    var price: Int
    var size: FriesSize // Размер
    
    // Размер
    enum FriesSize {
        case small
        case middle
        case big
    }
}


// Создаём протокол для описания общего интерфейса пиццы и картошки фри

protocol MenuItem {
    var price: Int { get set }
}


// Класс пиццерии

class Pizzeria {

    // Переменная, в которую можно класть и пиццу, и картошку фри    
    var menu: [MenuItem]

    init(menu: [MenuItem]) {
        self.menu = menu
    }
    
    // Добавление новой позиции в меню
    func addMenuItem(menuItem: MenuItem) {
        menu.append(menuItem)
    }
    
    // Получение меню
    func getMenu() -> [MenuItem] {
        menu
    }
}


// Протокол, в котором содержатся функции открытия и закрытия
protocol PizzeriaWork {
    func open()
    func close()
}


// Расширение для класса пиццерии, в котором реализован протокол PizzeriaWork

extension Pizzeria:  PizzeriaWork {
    func open() {
        print("Пиццерия открылась.")
    }
    func close() {
        print("Пиццерия закрылась.")
    }
}




// Создаём экземпляры пиццы

let pepperoni = Pizza(price: 600, type: .pepperoni, thickness: .thin, toppings: [.tomatos, .chees])
let margarita = Pizza(price: 550, type: .margarita, thickness: .thick, toppings: [.pepperoni])


// Создаём экземпляр картошки фри

let fries1 = Fries(price: 300, size: .middle)


// Создаём экземпляр класса пиццерии и добавить в него пиццы и картошку фри

var pizzeria = Pizzeria(menu: [pepperoni, margarita, fries1])


// Добавляем ещё одну пиццу

let neapolitano = Pizza(price: 650, type: .neapolitano, thickness: .thin, toppings: [.pepperoni, .chees])
pizzeria.addMenuItem(menuItem: neapolitano)


// Добавляем ещё одну картошку фри

let fries2 = Fries(price: 400, size: .big)
pizzeria.addMenuItem(menuItem: fries2)


// Запрашиваем все доступные блюда в пиццерии и выводим их

var menu = pizzeria.getMenu();

for menuItem in menu {
    
    if let pizza = menuItem as? Pizza {
        print("Пицца - вид: \(pizza.type), цена: \(pizza.price), тесто: \(pizza.thickness), добавки: \(pizza.toppings.map { "\($0)" }.joined(separator: ", "))")
    } else if let fries = menuItem as? Fries {
        print("Картошка фри - размер: \(fries.size), цена: \(fries.price)")
    }
}

// Пицца - вид: pepperoni, цена: 600, тесто: thin, добавки: tomatos, chees
// Пицца - вид: margarita, цена: 550, тесто: thick, добавки: pepperoni
// Картошка фри - размер: middle, цена: 300
// Пицца - вид: neapolitano, цена: 650, тесто: thin, добавки: pepperoni, chees
// Картошка фри - размер: big, цена: 400


// Проверяем работу расширения

pizzeria.open() // Пиццерия открылась.
pizzeria.close() // Пиццерия закрылась.




// Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания

func subtract<T: Numeric>(a: T, b: T) -> T {
    a - b
}

print(subtract(a: 10, b: 5.5)) // 4.5
