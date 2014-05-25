class Person
    constructor: (name,age) ->
        this.name = name
        this.age = age

    displayInfo: ->
        "#{this.name} is #{this.age} years old"

class Student extends Person
    constructor: (name,age,grade) ->
        super name, age
        this.grade = grade

    displayInfo: ->
        super() + " with #{this.grade}"


p = new Student 'Jing', 25, 'B'
