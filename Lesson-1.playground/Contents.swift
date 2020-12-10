import Foundation

/* Задание 1 */
//Мы разобрали
typealias VoidClosure = () -> Void

//Возвращаем Int на выходе
typealias IntClosure = () -> Int

//Принимаем на входе String
typealias StringClosure = (String) -> Void

//Принимаем на входе Int и возвращаем на выходе Sex
enum Sex {
    case male
    case female
}
typealias SexClosure = (Int) -> Sex

/* Задание 2 */
enum MyOptional<T> {
    case value(T)
    case emptyValue
}

//Спижено с урока
var age: MyOptional<Int> = .value(26)
switch age {
case .value(let num):
    print("Мой возраст: \(num) лет.")
case .emptyValue:
    print("x_x")
}

//Что в черном ящике?
enum BoxType: String {
    case keys = "ключи"
    case money = "деньги"
    case emptyBox = "ничего нет"
}
var blackBox: MyOptional<BoxType>

let randomIndex = Int.random(in: 0...3)
switch randomIndex {
case 0:
    blackBox = .value(.keys)
case 1:
    blackBox = .value(.money)
case 2:
    blackBox = .value(.emptyBox)
default:
    blackBox = .emptyValue
}

switch blackBox {
case .value(let boxType):
    print("В черном ящике \(boxType.rawValue)")
default:
    print("No value")
}

/* Задание 3 */
//Разбираем шаблон Strategy
///https://www.youtube.com/watch?v=eXT-yR1eCCY

final class Hero {
    
    var heroStrategy: HeroStrategy?
    
    func showInfo() {
        self.heroStrategy?.action()
    }
}

protocol HeroStrategy {
    func action()
}

final class SpiderMan: HeroStrategy {
    
    func action() {
        print("* Особенность героя: Паутина")
    }
}

final class IronMan: HeroStrategy {
    
    func action() {
        print("* Особенность героя: Броня")
    }
}


final class SuperMan: HeroStrategy {
    
    func action() {
        print("* Особенность героя: Сила")
    }
}

var hero = Hero()

hero.heroStrategy = SpiderMan()
hero.showInfo()

hero.heroStrategy = IronMan()
hero.showInfo()

hero.heroStrategy = SuperMan()
hero.showInfo()
