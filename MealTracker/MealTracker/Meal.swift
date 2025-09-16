import Foundation


struct Meal{
    var name:String
    var food:[Food]
}
var meals: [Meal] {
    let breakfast = Meal(
        name: "Breakfast",
        food: [
            Food(name: "Eggs", description: "eggs with salt"),
            Food(name: "Toast", description: "Whole toast"),
            Food(name: "Juice", description: "Fresh juice")
        ]
    )

    let lunch = Meal(
        name: "Lunch",
        food: [
            Food(name: "Sandwich", description: "sandwich with cheese"),
            Food(name: "Salad", description: "Green salad"),
            Food(name: "Fruit", description: "Bowl of mixed fruit")
        ]
    )

    let dinner = Meal(
        name: "Dinner",
        food: [
            Food(name: "Pasta", description: "Spaghetti with sauce"),
            Food(name: "Vegetables", description: "Broccoli and carrots"),
            Food(name: "Chicken", description: "Grilled chicken")
        ]
    )

    return [breakfast, lunch, dinner]
}
