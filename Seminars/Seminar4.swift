// Написать функцию, которая будет решать квадратное уравнение. На вход функция получает коэффициенты a, b, c, d (ax^2 + bx+ c = d), а возвращает корни уравнения.

import Foundation // Для применения ф-и sqrt

func myFunc(a: Double, b: Double, c: Double, d: Double) -> (Double?, Double?) {
    let c1 = c - d
    let descr = b * b - 4 * a * c1
    let sqrtDescr = sqrt(descr)
    
    if descr < 0 {
        return (nil, nil)
    } else if descr == 0 {
        return (-b + sqrtDescr / (2 * a), nil)
    } else {
        return (-b + sqrtDescr / (2 * a), -b - sqrtDescr / (2 * a))
    }
}

print(myFunc(a: 2, b: 3, c: 4, d: 5))




// ДАЛЕЕ ИДЁТ ЕДИНЫЙ КОМПЛЕКС ЗАДАЧ (СТРУКТУР, ПЕРЕЧИСЛЕНИЙ, КЛАССОВ...)


// Создать перечисление с видами чая (black, fruit, green), далее создать структуру, в которой будет хранится вид чая и его стоимость.

struct Tea {

    var name: TeaType
    
    // Сделать так, чтобы в структуре чая можно было получить стоимость только через функцию getCost, то есть чтобы извне функции не было доступа к переменной со стоимостью чая.
    
    private var cost: Int

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



// Создать класс Cafe, в котором хранится массив с чаем. Переменная с массивом должна быть приватной. Значение в массив должно устанавливаться в инициализаторе

class Cafe {
    private var teas: [Tea]
    
    init(teas: [Tea]) {
        self.teas = teas
    }

    // Добавить в класс функцию, которая на вход принимает тип чая и скидку, которую нужно применить. Функция должна вернуть стоимость, которую должен заплатить покупатель. Если данного вида чая нет в массиве(меню) - вернуть nil.
    func getCost(tea: Tea.TeaType, discount: Int) -> Int? {
        guard let tea1 = teas.first(where: { $0.name ==  tea }) else {
            return nil
        }
        return tea1.getCost(discount: discount)
    }

    // Добавить в класс Cafe функцию, которая на основе типа активности, предложенной суммы и возможной скидки возвращает доступный чая. Чай выбирается по следующим критериям: если это pupil, то доступен и черный, и зеленый, и фруктовый чай. Если это student, то только черный, а если employee, то черный и фруктовый. Если предложенной суммы хватает на все доступные виды чая, то вернуть самый дорогой. Если суммы хватает только на один, то вернуть его. Если суммы хватает на несколько доступных  видов чая, но у них одинаковая стоимость, то вернуть любой из них. Если суммы не хватает ни на один вид чая, то вернуть nil.
    func teaAvailable(
        typeOfActivity: Person.Activity.TypeOfActivity, 
        sum: Int, 
        discount: Int) -> Tea? {
        
        switch typeOfActivity {
        
        case .pupil: 
            let teaAvail = teas
                .filter { $0.getCost(discount: discount) <= sum }
                .sorted { $0.getCost(discount: discount) > $1.getCost(discount: discount) }
            return teaAvail.first
            
        case .student: 
            let teaAvail = teas
                .filter { $0.getCost(discount: discount) <= sum && $0.name == .black }
                .sorted { $0.getCost(discount: discount) > $1.getCost(discount: discount) }
            return teaAvail.first
            
        case .employee: 
            let teaAvail = teas
                .filter { $0.getCost(discount: discount) <= sum && ($0.name == .black || $0.name == .fruit) }
                .sorted { $0.getCost(discount: discount) > $1.getCost(discount: discount) }
            return teaAvail.first
        }
    }
}



// Создать класс Person, внутри которого должна быть структура Activity, внутри которой должно быть перечисление TypeOfActivity (тип активности) с тремя кейсами: pupil, student, employee. Создать переменную и явно указать ей тип “тип активности”.

class Person {
    
    struct Activity {
        
        enum TypeOfActivity {
            case pupil, student, employee
        }
    }
}

var typeOfActivity: Person.Activity.TypeOfActivity = .pupil



