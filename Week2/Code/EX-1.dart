enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearOfExperiences;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearOfExperiences);

  Employee.MobileDev(this._name, this._baseSalary, this._address, this._yearOfExperiences): _skills = [Skill.FLUTTER, Skill.DART];
  Employee.WebDev(this._name, this._baseSalary, this._address, this._yearOfExperiences): _skills = [Skill.OTHER];

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearOfExperiences => _yearOfExperiences;

  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}, Skills: $_skills, Address: ${_address.street}, ${_address.city}, ${_address.zipCode}, Years of Experience: $_yearOfExperiences');
  }
  double calcSalary(){
    double totalSalary = _baseSalary + (_yearOfExperiences * 2000);
    _skills.forEach((skill) {
      if(skill == Skill.FLUTTER){
        totalSalary += 5000;
      }
      else if (skill == Skill.DART){
        totalSalary += 3000;
      }
      else {
        totalSalary += 1000;
      }
    });
    return totalSalary;
  }
}
void main() {
  Employee emp1 = Employee('Sokea', 40000, [Skill.FLUTTER], Address('national road 6', 'Phnom Penh', '	120101'), 3);
  print(emp1.calcSalary());
  emp1.printDetails();

  Employee emp2 = Employee('Ronan', 45000, [Skill.DART, Skill.OTHER, Skill.FLUTTER], Address('national road 3', 'Phnom Penh', '120101'), 5);
  print(emp2.calcSalary());
  emp2.printDetails();

  Employee emp3 = Employee.MobileDev("Tara", 30000, Address('national road 11', 'Phnom Penh', '120101'), 2);
  print(emp3.calcSalary());
  emp3.printDetails();

  Employee emp4 = Employee.WebDev("Chompa", 35000, Address('national road 4', 'Phnom Penh', '120101'), 4);
  print(emp4.calcSalary());
  emp4.printDetails();
}