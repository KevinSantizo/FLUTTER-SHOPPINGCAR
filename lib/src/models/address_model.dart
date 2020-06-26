
class Localization {
  final List <Departments> departments;
  final List <Towns> towns;

  Localization({this.departments, this.towns});

  factory Localization.fromJson(Map<String, dynamic> json){
    return Localization(
      towns: parseTowns(json),
      departments: parseDepartments(json),
    );
  }

  static List<Towns> parseTowns(townsJson){
    var tList = townsJson['towns'] as List;
    List<Towns> townsList = tList.map((data) => Towns.fromJson(data)).toList();
    return townsList;
  }

  static List<Departments> parseDepartments(departmentsJson){
    var dList = departmentsJson['departments'] as List;
    List<Departments> departmentsList = dList.map((data) => Departments.fromJson(data)).toList();
    return departmentsList;
  }
}



class Towns {
  final int id;
  final String name;

  Towns({this.id, this.name});

  factory Towns.fromJson(Map<String, dynamic> parsedJson){
    return Towns(id: parsedJson['id'], name: parsedJson['name']);
  }

}

class Departments {
  final int id;
  final String name;
  final int stateId;

  Departments({this.id, this.name, this.stateId});

  factory Departments.fromJson(Map<String, dynamic> parsedJson) {
    return Departments(id: parsedJson['id'], name: parsedJson['name'],  stateId: parsedJson['state_id']);
  }

}