(function() {
  var Person, Student, p,
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  Person = (function() {

    function Person(name, age) {
      this.name = name;
      this.age = age;
    }

    Person.prototype.displayInfo = function() {
      return "" + this.name + " is " + this.age + " years old";
    };

    return Person;

  })();

  Student = (function(_super) {

    __extends(Student, _super);

    function Student(name, age, grade) {
      Student.__super__.constructor.call(this, name, age);
      this.grade = grade;
    }

    Student.prototype.displayInfo = function() {
      return Student.__super__.displayInfo.call(this) + (" with " + this.grade);
    };

    return Student;

  })(Person);

  p = new Student('Jing', 25, 'B');

  console.log(p.displayInfo());

}).call(this);
