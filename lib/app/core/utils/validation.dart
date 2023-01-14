
class Validations {
  static String? email(String? value) {
    if (value!.isEmpty) {
      return"required";
    } else if (!value.contains('@') || !value.contains('.')) {
      return  "must_be_like_this_example@mail.com";
    } else {
      return null;
    }
  }

  static String? any(dynamic value) {
    if (value==null) {
      return "required";
    }  if (value.isEmpty) {
      return "required";
    } else {
      return null;
    }
  }


  static String? phone(String? value) {
    if (value!.isEmpty) {
      return "required";
    } else if (value.length < 8) {
      return  "wrong_phone_number";
    } else {
      return null;
    }
  }

  static String? password(String? value) {
    if (value!.isEmpty) {
      return  "required";
    } else if (value.length < 6) {
      return"6_characters_minimum";
    } else {
      return null;
    }
  }

  static String? code(String value) {
    if (value.isEmpty) {
      return '';
    } else if (value.length < 4) {
      return "LocaleKeys.codeError.tr()";
    } else {
      return null;
    }
  }

  static String? name(
    String? value,
  ) {
    if (value!.isEmpty) {
      return "required";
    } else if (value.isEmpty) {
      return  "must_be_more_than_one_character";
    } else {
      return null;
    }
  }
}
