
// Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением. 

struct Pizza {
    
    var type: PizzaType
    var cost: Int
    var thin: Bool // Тонкое тесто: true|false
    var adds: [Add] // Добавки

    // Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов)
    enum PizzaType {
        case pepperoni
        case margarita
        case neapolitano
        case fourCheeses
        case caesar
    }
        
    // Добавки
    enum Add {
        case pepperoni
        case tomatos
        case chees
    }
}


// Создать класс пиццерии, добавить массив с возможными пиццами. Переменная с массивом должна быть приватной. Массив задается в инициализаторе.

class Pizzeria {
    
    // Массив с возможными пиццами
    private var pizzas: [Pizza]
    
    init(pizzas: [Pizza]) {
        self.pizzas = pizzas
    }
    
    // Написать в классе пиццерии функции для добавления новой пиццы и для получения всех доступных пицц.
    
    // Добавление новой пиццы
    func addPizza(pizza: Pizza) {
        self.pizzas.append(pizza)
    }
    
    // Получение всех доступных пицц
    func getAllPizzas() -> [Pizza] {
        self.pizzas
    }
}


// Создать экземпляр класса пиццерии и добавить в него несколько пицц

let pepperoni = Pizza(type: .pepperoni, cost: 600, thin: true, adds: [.tomatos, .chees])
let margarita = Pizza(type: .margarita, cost: 550, thin: false, adds: [.pepperoni])

var pizzeria = Pizzeria(pizzas: [pepperoni, margarita])

// Добавляем ещё одну пиццу через метод addPizza

let neapolitano = Pizza(type: .neapolitano, cost: 650, thin: true, adds: [.pepperoni, .chees])
pizzeria.addPizza(pizza: neapolitano)


// Запрашиваем все доступные в пиццерии пиццы и выводим их
var allPizzas = pizzeria.getAllPizzas();

for pizza in allPizzas {
    print("Тип пиццы: \(pizza.type), стоимость \(pizza.cost), тесто " + (pizza.thin ? "тонкое" : "толстое") + ", добавки: \(pizza.adds.map { "\($0)" }.joined(separator: ", "))")
    /*
    Тип пиццы: pepperoni, стоимость 600, тесто тонкое, добавки: tomatos, chees
    Тип пиццы: margarita, стоимость 550, тесто толстое, добавки: pepperoni
    Тип пиццы: neapolitano, стоимость 650, тесто тонкое, добавки: pepperoni, chees
    */
}

