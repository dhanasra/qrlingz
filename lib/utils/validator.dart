
class Validator {

  static validateNonNullOrEmpty(value, fieldName) {
    if (value == null || value.toString().trim().isEmpty) {
      return '$fieldName is required';
    } else {
      return null;
    }
  }

  static isValidURL(value, fieldName, {bool required = true}) {
    final RegExp urlRegex = RegExp(
      r'^(?:http:\/\/|https:\/\/)?(?:www\.)?[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+(?:\/\S*)?$',
    );
    if (value == null || value.toString().trim().isEmpty) {
      if(!required){
        return null;
      }
      return '$fieldName is required';
    } 
    var isUrl = urlRegex.hasMatch(value);
    if(!isUrl){
      return '$fieldName is not a valid URL';
    }else{
      return null;
    }
  }

  static isValidPassword(value, {bool required = true}) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    if (value == null || value.toString().trim().isEmpty) {
      if(!required){
        return null;
      }
      return 'Password is required';
    } 
    var isPasswordValid = passwordRegex.hasMatch(value);
    if(!isPasswordValid){
      return 'Password must be at least 8 characters long and contain at least one letter, one special character and one number';
    }else{
      return null;
    }
  }

  static String? validatePhoneNumber(
    String? value, {
    String? fieldName,
    bool required = true,
  }) {
    if (value == null || value.toString().trim().isEmpty) {
      if (!required) {
        return null;
      }
      return '${fieldName ?? 'Mobile Number'} is required';
    } else if (!RegExp(r'^\+?[0-9.-]+$').hasMatch(value)) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

  static validateEmail(value, {bool required = true}) {
    if (value == null || value.toString().trim().isEmpty) {
      if(!required){
        return null;
      }

      return 'Email address is required';
    } else {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
      );
      if (!emailRegex.hasMatch(value)) {
        return 'Enter a valid email address';
      } else {
        return null;
      }
    }
  }

  static validateBarcodeContent(type, value) {
    if (value == null || value.toString().trim().isEmpty) {
      return "Content is required";
    } else {
      if(isValidBarcodeContent(type, value)){
        return null;
      }else{
        return "Invalid barcode content";
      }
    }
  }

  static isValidBarcodeContent(String type, String value){

    if(type=="code_39"){

      RegExp regex = RegExp(r'^[A-Z0-9\-\.\$\/\+\%\s]+$');
      return regex.hasMatch(value);
    }else if(type=="code_93"){

      RegExp regex = RegExp(r'^[A-Z0-9\-\.\$\/\+\%]+$');
      return regex.hasMatch(value);
    }else if(type=="code_128"){

      RegExp regex = RegExp(r'^[\x00-\x7F]+$');
      return regex.hasMatch(value);
    }else if(type=="codabar"){
      RegExp regex = RegExp(r'^[0-9\$\-/:\+]+$');
      return regex.hasMatch(value);
    }else if(type=="itf" || type=="itf_14" || type=="itf_16"){

      if (!isNumeric(value)) {
        return false;
      }

      if (type == "itf" && value.length % 2 != 0) {
        return false;
      }else if (type == "itf_14" && value.length != 14) {
        return false;
      }else if (type == "itf_16" && value.length != 16) {
        return false; 
      }

      return true;
    } else if(type=="ean_13" || type=="ean_8" || type=="ean_5" || type=="ean_2"){

      if (!isNumeric(value)) {
        return false;
      }

      if (type == "ean_13" && value.length != 13) {
        return false;
      }else if (type == "ean_8" && value.length != 8) {
        return false;
      }else if (type == "ean_5" && value.length != 5) {
        return false; 
      }else if (type == "ean_2" && value.length != 2) {
        return false; 
      }

      return true;
    } else if( type=="upc_a" || type=="upc_e" ){

      if (!isNumeric(value)) {
        return false;
      }

      if(!(value.startsWith("0") || value.startsWith("1"))){
        return false;
      }

      if(type=="upc_a" && value.length!=12){
        return false;
      }else if(type=="upc_e" && value.length!=8){
        return false;
      }

      return true;
    }else if(type=="isbn"){
        var isbn = value.replaceAll("-", "").replaceAll(" ", ""); // Remove hyphens and spaces
        if (isbn.length != 13 || !RegExp(r'^\d{13}$').hasMatch(isbn)) {
          return false; 
        }

        int sum = 0;
        for (int i = 0; i < 12; i++) {
          sum += int.parse(isbn[i]) * (i.isEven ? 1 : 3);
        }

        int checksum = (10 - (sum % 10)) % 10;
        return checksum == int.parse(isbn[12]);
    }else if(type=="telepen"){
      if (!RegExp(r'^[0-9A-Z.$/+%-]+$').hasMatch(value)) {
        return false;
      }

      if (value.isEmpty || (value[0] != '\u001E' && value[value.length - 1] != '\u001D')) {
        return false;
      }
      return true;
    }else if(type=="rm4scc"){
      if (!RegExp(r'^[A-Z0-9]+$').hasMatch(value)) {
        return false;
      }
      if (value[0] != 'R' && value[value.length - 1] != 'R') {
        return false;
      }
      return true;
    }else if(type=="pdf417"){
      if (!RegExp(r'^[!-~]*$').hasMatch(value)) {
        return false;
      }
      if (value.length >= 3) {
        if (value.substring(0, 3) != "PDF" && value.substring(value.length - 3) != "PDF") {
          return false;
        }
      }else{
        return false;
      }
      return true;
    }else if(type=="data_matrix"){
      if (!RegExp(r'^[!-~]*$').hasMatch(value)) {
        return false;
      }
      if (value.length < 3) {
        return false;
      }
      if (value.substring(0, 3) != "DMA" && value.substring(value.length - 3) != "DMA") {
        return false;
      }
      return true;
    }else if(type=="aztec"){
      if (!RegExp(r'^[!-~]*$').hasMatch(value)) {
        return false;
      }
      if (value.length < 3) {
        return false;
      }
      if (value.substring(0, 3) != "AZT" && value.substring(value.length - 3) != "AZT") {
        return false;
      }
      return true;
    }else if(type=="gs1_128"){
      if (!RegExp(r'^[!-~]*$').hasMatch(value)) {
        return false;
      }
      if (value.length < 3) {
        return false;
      }
      if (value.substring(0, 3) != "FNC1" || value.substring(value.length - 3) != "FNC1") {
        return false;
      }
      return true;
    }
    return true;
  }

  static bool isNumeric(String str) {
    return double.tryParse(str) != null;
  }

}
