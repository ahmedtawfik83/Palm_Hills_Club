class Gate {
  final String id;
  final String name;
  final bool isIn;
  final DateTime createdAt;
  final DateTime updatedAt;

  Gate.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        isIn = json['isIn'],
        createdAt = json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt = json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'isIn': isIn,
        'createdAt': createdAt?.millisecondsSinceEpoch,
        'updatedAt': updatedAt?.millisecondsSinceEpoch
      };
}
