
// Структура работника пиццерии

struct Employee {
    
    var name: String
    var position: Position
    var salary: Double
    
    enum Position: String {
        case cashier // Кассир
        case cook // Повар
    }
}



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

    // Добавляем массив с работниками
    var employees: [Employee]

    // Добавляем массив столиков
    // Поскольку столики будем создавать в инициализаторе (не передавать), то нужно инициализировать уже здесь, с пустым массивом
    var tables: [Table] = []
    

    init(menu: [MenuItem], employees: [Employee], numTables: Int) {
        self.menu = menu
        self.employees = employees
        
        // Столики создаём сразу в инициализаторе, исходя из переданного количества столиков
        for _ in 1...numTables {
            tables.append(Table(pizzeria: self, numSeats: 4)) // На 4 места
        }
    }
    
    // Добавление новой позиции в меню
    func addMenuItem(menuItem: MenuItem) {
        menu.append(menuItem)
    }
    
    // Получение меню
    func getMenu() -> [MenuItem] {
        menu
    }
    
    // Вывод работников
    func printEmployees() -> Void {
        print("Работники:")
        for employee in employees {
            print("Имя: \(employee.name), должность: \(employee.position), зарплата: \(employee.salary)")
        }
    }

    // Вывод столиков
    func printTables() -> Void {
        print("Количество столиков: \(tables.count)")
        print("Количество мест у столиков:")
        for (i, table) in tables.enumerated() {
            print("Столик \(i + 1): \(table.numSeats)")
        }
    }

}


// Класс столика

class Table {
    
    var numSeats: Int
    
    // Столик без пиццерии может существовать, а пицеррия без столиков вряд ли )
    // Поэтому сделаем здесь слабую связь, чтобы не закольцевать взаимные сильные связи с классом Pizzeria
    weak var pizzeria: Pizzeria?
    
    init(pizzeria: Pizzeria, numSeats: Int) {
        self.numSeats = numSeats
    }
    
    func enoughtNumSeats(numGuests: Int) -> Bool {
        numGuests <= numSeats
    }
}


// Протокол, в котором содержатся функции открытия и закрытия

protocol WorkProccess {
    func open()
    func close()
}


// Расширение для класса пиццерии, в котором реализован протокол WorkProccess

extension Pizzeria: WorkProccess {
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


// Создаём работников

let employee1 = Employee(name: "Борис", position: .cashier, salary: 50000)
let employee2 = Employee(name: "Елена", position: .cook, salary: 60000)


// Создаём экземпляр класса пиццерии, добавляем в него работников, меню (пиццу и картошку фри), а также определяем количество столиков

var pizzeria = Pizzeria(menu: [pepperoni, margarita, fries1], employees: [employee1, employee2], numTables: 8)


// Добавляем ещё одну пиццу

let neapolitano = Pizza(price: 650, type: .neapolitano, thickness: .thin, toppings: [.pepperoni, .chees])
pizzeria.addMenuItem(menuItem: neapolitano)


// Добавляем ещё одну картошку фри

let fries2 = Fries(price: 400, size: .big)
pizzeria.addMenuItem(menuItem: fries2)


// Запрашиваем все доступные блюда в пиццерии и выводим их

var menu = pizzeria.getMenu();

print("Меню:")

for menuItem in menu {
    
    if let pizza = menuItem as? Pizza {
        print("Пицца - вид: \(pizza.type), цена: \(pizza.price), тесто: \(pizza.thickness), добавки: \(pizza.toppings.map { "\($0)" }.joined(separator: ", "))")
    } 
    
    else if let fries = menuItem as? Fries {
        print("Картошка фри - размер: \(fries.size), цена: \(fries.price)")
    }
}
// Меню:
// Пицца - вид: pepperoni, цена: 600, тесто: thin, добавки: tomatos, chees
// Пицца - вид: margarita, цена: 550, тесто: thick, добавки: pepperoni
// Картошка фри - размер: middle, цена: 300
// Пицца - вид: neapolitano, цена: 650, тесто: thin, добавки: pepperoni, chees
// Картошка фри - размер: big, цена: 400


// Проверяем работу расширения

pizzeria.open() // Пиццерия открылась.
pizzeria.close() // Пиццерия закрылась.


// Выводим работников пиццерии

pizzeria.printEmployees()
// Работники:
// Имя: Борис, должность: cashier, зарплата: 50000.0
// Имя: Елена, должность: cook, зарплата: 60000.0


// Выводим Столики

pizzeria.printTables()
// Количество столиков: 8
// Количество мест у столиков:
// Столик 1: 4
// Столик 2: 4
// Столик 3: 4
// Столик 4: 4
// Столик 5: 4
// Столик 6: 4
// Столик 7: 4
// Столик 8: 4
