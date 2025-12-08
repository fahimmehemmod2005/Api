class Data {
  String? id;
  String? modelName;
  String? slug;
  dynamic year; // Changed to dynamic to handle both int and double
  String? price;
  Manufacturer? manufacturer;
  Owner? owner;
  List<Engines>? engines;

  Data({
    this.id,
    this.modelName,
    this.slug,
    this.year,
    this.price,
    this.manufacturer,
    this.owner,
    this.engines,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelName = json['model_name'];
    slug = json['slug'];
    year = json['year'];
    price = json['price'];
    manufacturer = json['manufacturer'] != null
        ? Manufacturer.fromJson(json['manufacturer'])
        : null;
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    if (json['engines'] != null) {
      engines = <Engines>[];
      json['engines'].forEach((v) {
        engines!.add(Engines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['model_name'] = modelName;
    data['slug'] = slug;
    data['year'] = year;
    data['price'] = price;
    if (manufacturer != null) {
      data['manufacturer'] = manufacturer!.toJson();
    }
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    if (engines != null) {
      data['engines'] = engines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Manufacturer {
  String? id;
  String? name;
  String? country;
  dynamic foundedYear; // Changed to dynamic

  Manufacturer({this.id, this.name, this.country, this.foundedYear});

  Manufacturer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    foundedYear = json['founded_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country'] = country;
    data['founded_year'] = foundedYear;
    return data;
  }
}

class Owner {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  List<Occupations>? occupations;

  Owner({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.occupations,
  });

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    if (json['occupations'] != null) {
      occupations = <Occupations>[];
      json['occupations'].forEach((v) {
        occupations!.add(Occupations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    if (occupations != null) {
      data['occupations'] = occupations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Occupations {
  String? id;
  String? title;
  String? description;

  Occupations({this.id, this.title, this.description});

  Occupations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class Engines {
  String? id;
  String? name;
  dynamic displacement; // Changed to dynamic
  dynamic horsepower; // Changed to dynamic
  Brand? brand;

  Engines({this.id, this.name, this.displacement, this.horsepower, this.brand});

  Engines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displacement = json['displacement'];
    horsepower = json['horsepower'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['displacement'] = displacement;
    data['horsepower'] = horsepower;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    return data;
  }
}

class Brand {
  String? id;
  String? name;
  String? headquarters;
  Origin? origin;

  Brand({this.id, this.name, this.headquarters, this.origin});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    headquarters = json['headquarters'];
    origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['headquarters'] = headquarters;
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    return data;
  }
}

class Origin {
  String? id;
  Destination? destination;

  Origin({this.id, this.destination});

  Origin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    destination = json['destination'] != null
        ? Destination.fromJson(json['destination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (destination != null) {
      data['destination'] = destination!.toJson();
    }
    return data;
  }
}

class Destination {
  String? id;
  String? country;
  dynamic latitude; // Changed to dynamic
  dynamic longitude; // Changed to dynamic

  Destination({this.id, this.country, this.latitude, this.longitude});

  Destination.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country'] = country;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}