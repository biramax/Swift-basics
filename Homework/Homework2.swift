// 1. Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой процент, третий аргумент это срок Функция возвращает сколько денег получит пользователь по итогу.

func calcMoney(sum: Double, persent: Double, numMonthes: Double) -> Double {
    sum + ((sum * persent / 100) / 12) * numMonthes
}

print(calcMoney(sum: 100000, persent: 8.5, numMonthes: 12)) // 108500.0



// 2. Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.

enum Pizza: String {
    case margarita = "Маргарита"
    case pepperoni = "Пепперони"
    case fourCheeses = "4 сыра"
}

var pizzaMargarita = Pizza.margarita
var pizzaPepperoni = Pizza.pepperoni
var pizzaFourCheeses: Pizza = .fourCheeses

print(pizzaMargarita, pizzaPepperoni, pizzaFourCheeses) // margarita pepperoni fourCheeses



// 3. Добавить возможность получения названия пиццы через rawValue

print(pizzaMargarita.rawValue, pizzaPepperoni.rawValue, pizzaFourCheeses.rawValue) // Маргарита Пепперони 4 сыра

// Через функцию

func printPizzaName(pizza: Pizza) {
    print(pizza.rawValue)
}

printPizzaName(pizza: .margarita) // Маргарита