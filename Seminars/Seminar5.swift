// Создать перечисление с видами чая (black, fruit, green), далее создать структуру, в которой будет хранится вид чая и его стоимость.

struct Tea: MenuProtocol {

    var name: TeaType
    var descr: String { name.rawValue + " tea" } // computed property
    
    // Сделать так, чтобы в структуре чая можно было получить стоимость только через функцию getCost, то есть чтобы извне функции не было доступа к переменной со стоимостью чая.
    
    var cost: Int
    

    // Сделать тип чая вложенным типом для структуры чая
    enum TeaType {
        case black
        case fruit
        case green
    }
    
    init(name: TeaType, cost: Int) {
        self.name = name
        self.cost = cost
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
    
    init(menu: [MenuProtocol]) {
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

