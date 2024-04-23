class Validator {

  static validateNonNullOrEmpty(value, fieldName) {
    if (value == null || value.toString().trim().isEmpty) {
      return '$fieldName is required';
    } else {
      return null;
    }
  }

  static isValidURL(value, fieldName) {
    final RegExp urlRegex = RegExp(
      r'^(?:http:\/\/|https:\/\/)?(?:www\.)?[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+(?:\/\S*)?$',
    );
    if (value == null || value.toString().trim().isEmpty) {
      return '$fieldName is required';
    } 
    var isUrl = urlRegex.hasMatch(value);
    if(!isUrl){
      return '$fieldName is not a valid URL';
    }else{
      return null;
    }
  }

}