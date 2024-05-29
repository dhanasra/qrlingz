// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Configuration {
  final bool enablePassword;
  final String? password; 
  final bool enableScanLimit;
  final String? scanLimit; 

  Configuration({
    this.enablePassword = false,
    this.password,
    this.enableScanLimit = false,
    this.scanLimit,
  });


  Configuration copyWith({
    bool? enablePassword,
    String? password,
    bool? enableScanLimit,
    String? scanLimit,
  }) {
    return Configuration(
      enablePassword: enablePassword ?? this.enablePassword,
      password: password ?? this.password,
      enableScanLimit: enableScanLimit ?? this.enableScanLimit,
      scanLimit: scanLimit ?? this.scanLimit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'enablePassword': enablePassword,
      'password': password,
      'enableScanLimit': enableScanLimit,
      'scanLimit': scanLimit,
    };
  }

  factory Configuration.fromMap(map) {
    return Configuration(
      enablePassword: map['enablePassword'] ?? false,
      password: map['password'] != null ? map['password'] as String : null,
      enableScanLimit: map['enableScanLimit'] ?? false,
      scanLimit: map['scanLimit'] != null ? map['scanLimit'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Configuration.fromJson(String source) => Configuration.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Configuration(enablePassword: $enablePassword, password: $password, enableScanLimit: $enableScanLimit, scanLimit: $scanLimit)';
  }

  @override
  bool operator ==(covariant Configuration other) {
    if (identical(this, other)) return true;
  
    return 
      other.enablePassword == enablePassword &&
      other.password == password &&
      other.enableScanLimit == enableScanLimit &&
      other.scanLimit == scanLimit;
  }

  @override
  int get hashCode {
    return enablePassword.hashCode ^
      password.hashCode ^
      enableScanLimit.hashCode ^
      scanLimit.hashCode;
  }
}
