// Создать перечисление с видами чая (black, fruit, green), далее создать структуру, в которой будет хранится вид чая и его стоимость.

struct Tea: MenuProtocol {

    var name: TeaType
    var descr: String { name.rawValue + " tea" } // computed property
    var temperature: Double
    
    // Сделать так, чтобы в структуре чая можно было получить стоимость только через функцию getCost, то есть чтобы извне функции не было доступа к переменной со стоимостью чая.
    
    var cost: Int
    
    // Сделать тип чая вложенным типом для структуры чая
    enum TeaType: String {
        case black
        case fruit
        case green
    }
    
    // Добавить в структуру чая функцию getCost, которая будет возвращать стоимость чая. На вход функция принимает процент скидки (только целое число), который необходимо применить к стоимости. Если скидка больше 50% напечатать в консоль о невозможности применить скидку и вернуть изначальную стоимость чая.    
    func getCost(discount: Int) -> Int {
        
        guard discount <= 50 else {
            print("Невозможно применить скидку")
            return cost
        }
        
        return cost * discount / 100
    }
}



// Создать протокол для меню. Протокол должен содержать стоимость и наименование. Стоимость и название должны быть get-only

protocol MenuProtocol {
    var cost: Int { get }
    var descr: String { get }
}



// В классе кафе должен быть массив с наименованиями меню  и инициализатор. Подпишите структуру чая с прошлого занятия на протокол из первого пункта. В качестве name должен быть вид чая и “tea”, то есть, например, для черного чая должно быть black tea, а для зеленого green tea

class Cafe {

    // Задать переменной с меню в классе Cafe уровень fileprivate
    
    fileprivate var menu: [MenuProtocol]

    // Добавить в класс кафе свойство, в котором будет хранится владелец магазина. Значение свойству должно устанавливаться в инициализаторе. Когда в классе магазина создается Cafe - владелец и у магазина и у кафе должен быть один.
    
    var shopOwner: ShopOwner
    
    init(shopOwner: ShopOwner, menu: [MenuProtocol]) {
        self.shopOwner = shopOwner
        self.menu = menu
    }

    // Добавить в родительский класс функцию (add) по добавлению новой позиции в меню. Саму переменную меню сделать приватной, если она еще таковой не является
    
    func add(menuItem: MenuProtocol) {
        menu.append(menuItem)
    }
    
    // Добавить в класс кафе функцию, которая возвращает все позиции меню
    
    func getMenu() -> [MenuProtocol] {
        menu
    }
    
    // Добавить в класс кафе функцию, которая на основе цены возвращает массив позиций которые можно купить (Например, есть черный чай за 50, зеленый за 60, лимонад за 100 и салат за 150. Функция получае 90, значит она должна вернуть черный чай и зеленый чай)
    
    func getMenuItems(sum: Int) -> [MenuProtocol] {
        menu.filter { $0.cost <= sum }
    }
    
    // С прошлого семинара есть класс Cafe, в котором есть переменная menu, в которую можно добавлять и чай, и лимонад, и салат. Необходимо добавить в структуру чая свойство температуры. Написать функцию в классе Cafe, которая выведет температуру всех Tea из переменной menu.
    
    func printTemperature() {
        for menuItem in menu {
            guard let tea = menuItem as? Tea else {
                continue
            }
            print(tea.temperature)
        }
    }
}


// Создайте еще 3 кафе, для которых класс Cafe будет родительским.

class FirstCafe: Cafe {
    
    // Сделать так, чтобы в первом из трех классов наследников(например, FirstCafe) функция add помимо того, что выполняла все тоже самое, что и в родительском классе, печатала в консоль стоимость добавляемой позиции.
    
    override func add(menuItem: MenuProtocol) {
        super.add(menuItem: menuItem)
        print(menuItem.cost)
    }
    
}

class SecondCafe: Cafe {
    
}

class ThirdCafe: Cafe {
    
}



// Создать класс автомата с едой, не реализовывать в нем ни методов, ни свойств, однако этот класс должен уметь делать все тоже самое, что и FirstCafe

// Сделать так, чтобы от класса автомата с напитками нельзя было наследоваться.

final class FoodAutomat: FirstCafe {

    // Добавить в класс автомата с едой функцию, которая на основе полученного номера (номер элемента в массиве) и денег возвращает товар под необходимым номером, если денег хватает и nil, если денег не хватает. Если товар не найден, тоже вернуть nil

    func getItem(id: Int, sum: Int) -> MenuProtocol? {
        
        guard id < menu.count else {
            return nil
        }
        
        return menu[id].cost <= sum ? menu[id] : nil
    }
    
}



// Для класса автомата с едой создать расширение, в котором будут содержаться функции из протокола из пункта 6 (класс должен быть подписан на протокол). В функции start должно печататься о начале работы автомата, а в final о завершении

extension FoodAutomat: PowerProtocol {
    func start() {
        print("Start")
    }
    func stop() {
        print("Stop")
    }
}



// Создать две структуры: лимонад и салат. Сделать так, чтобы и то и то можно  добавить в меню кафе.

struct Lemonade: MenuProtocol {
    var cost: Int
    var descr: String
}

struct Salad: MenuProtocol {
    var cost: Int
    var descr: String
}



// Создать протокол, в котором будет содержаться две функции: start и final. 

protocol PowerProtocol {
    func start()
    func stop()
}


// Создайте переменную “a”, в которой будет хранится массив с Tea. Создайте другую переменную “b” и присвойте ей переменную “a”. Выведете в консоль адреса массивов. Затем в “b” добавьте еще один элемент. Выведете в консоль адреса массивов. Объясните полученный результат (можно рядом в комментарии)

var a: [Tea] = []
var b = a
b.append(Tea(name: .black, cost: 300))

getAddress(a)
getAddress(b)

func getAddress(_ collection: UnsafeRawPointer) {
    print(Int(bitPattern: collection))
}


// Создайте класс, в котором будет одна переменная “test” типа String. Создайте экземпляр класса (название переменной, например, c). Создайте еще одну переменную (название переменной, например, d) и присвойте ей c. В переменной d измените “test”. Выведите в консоль “test” для c и d. Объясните результат

class Test {
    
    var test: String = "test"
}

var c = Test()
var d = c
d.test = "test1"

print(c.test)
print(d.test)


// Создайте структуру, в котором будет одна переменная “test” типа String. Создайте переменную, в которой будет лежать структура (название переменной, например, e). Создайте еще одну переменную (название переменной, например, f) и присвойте ей e. В переменной f измените “test”. Выведите в консоль “test” для e и f. Объясните результат

struct Test {
    
    var test: String = "test"
}

var c = Test()
var d = c
d.test = "test1"

print(c.test)
print(d.test)


// Создайте класс магазина. В нем должно быть два массива, один с товарами, второй с работниками. Для работников создайте свою структуру, а для товаров свою. Для товаров должно быть минимум 3 разных структуры, например, еда, напитки и одежда. Добавить в класс функцию, которая будет добавлять работника в массив. Написать функцию, которая будет добавлять новый товар в массив.

protocol Product {
    var name: String { get set }
    var price: Double { get set }
}

class Shop {
    
    private var products: [Product]
    private var employees: [Employee]
    
    var shopOwner: ShopOwner

    // Добавить в  ранее созданный класс магазина свойство, в котором будет хранится Cafe. Сделать так, чтобы все свойства класса магазина (массив товаров и работников, владелец магазина и кафе) устанавливались в инициализаторе, но в инициализатор передается только массив товаров и работников, а также владелец магазина. Кафе создается внутри инициализатора

    var cafe: Cafe
    
    init(shopOwner: ShopOwner, products: [Product], employees: [Employee]) {
        self.shopOwner = shopOwner
        self.products = products
        self.employees = employees
        cafe = Cafe(shopOwner: shopOwner, menu: [])
    }
    
    struct ProductsMeal: Product {
        var name: String
        var price: Double
    }

    struct ProductsDrink: Product {
        var name: String
        var price: Double
    }

    struct ProductsClothes: Product {
        var name: String
        var price: Double
    }

    struct Employee {
        var salary: Double
        var age: Int
        var name: String
    }
    
    func addEmployee(employee: Employee) {
        employees.append(employee)
    }

    func addProduct(product: Product) {
        products.append(product)
    }

    // Написать в классе магазина функцию, которая возвращает меню кафе в виде словаря [<что это>: [массив позиций]], например, в меню есть [чай, чай, лимонад, салат, салат], а вернуть функция должна [“tea”: [чай, чай], “lemonade”: [лимонад], “salad”; [салат, салат] ]. Если для позиции ничего нет (например, нет ни одного лимонада), под ключом должен вернуться пустой массив
    
    func getCafeMenu() -> [String : [MenuProtocol]] {
        var teas: [Tea] = []
        var lemonades: [Lemonade] = []
        var salads: [Salad] = []
        
        for menuItem in cafe.menu {
            if let tea = menuItem as? Tea {
                teas.append(tea)
            } else if let lemonade = menuItem as? Lemonade {
                lemonades.append(lemonade)
            } else if let salad = menuItem as? Salad {
                salads.append(salad)
            }
        }
        
        return ["tea": teas, "lemonade": lemonades, "salad": salads]
    }
    
    // Добавить в класс магазина функцию, которая на основе словаря из предыдущего задания возвращает словарь с теми же ключами, но вместо массива позиций должен быть массив стоимостей этих позиций    
    
    func getCafeMenuCost() -> [String : [Int]] {
    
        var menu = getCafeMenu()
        
        var menuCost: [String: [Int]] = [:]
        
        for (k, v) in menu {
            let costs = v.map { $0.cost }
            menuCost.updateValue(costs, forKey: k)
        }
        
        return menuCost
    }
}


// Создать класс владельца магазина. Добавить в него свойство, в котором будет хранится магазин, которым он владеет. А в класс магазина добавить переменную, в которой будет хранится владелец магазина. Ответьте на вопрос: Есть ли в такой связке магазин -> директор и директор -> магазин какая-то проблема? Если да, то какая и как ее решить?

class ShopOwner {
    
    weak var shop: Shop?
}

