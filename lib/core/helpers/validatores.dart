
import 'dart:io';

class AppValidators {
  AppValidators._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (val == null || val.trim().isEmpty) {
      return 'الخانة دي مطلوبة';
    } else if (!emailRegex.hasMatch(val)) {
      return 'اكتب إيميل صحيح';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');

    if (val == null || val.isEmpty) {
      return 'الخانة دي مطلوبة';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'الباسورد لازم يبقى 8 حروف على الأقل ويحتوي على حروف وأرقام';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'الخانة دي مطلوبة';
    } else if (val != password) {
      return 'الباسوردين مش شبه بعض';
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');

    if (val == null || val.isEmpty) {
      return 'الخانة دي مطلوبة';
    } else if (!usernameRegex.hasMatch(val)) {
      return 'اكتب اسم مستخدم صحيح';
    } else if (val.trim().length < 3) {
      return 'الاسم يجب أن يكون 3 أحرف على الأقل';
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return 'الخانة دي مطلوبة';
    } else {
      return null;
    }
  }

  String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك أدخل الاسم';
    }

    if (value.trim().length < 3) {
      return 'الاسم يجب أن يكون 3 أحرف على الأقل';
    }

    final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');

    if (!nameRegex.hasMatch(value.trim())) {
      return 'الاسم يجب أن يحتوي على حروف فقط';
    }

    return null;
  }

  static String? validatePersonName(String? value) {
    final name = value?.trim() ?? '';

    if (name.isEmpty) return 'الاسم مطلوب';
    if (name.length < 2 || name.length > 60) {
      return 'الاسم يجب أن يكون من حرفين إلى 60 حرف';
    }
    if (!RegExp(r'^[a-zA-Z\u0621-\u064A\s]+$').hasMatch(name)) {
      return 'الاسم يجب أن يحتوي على حروف فقط';
    }

    return null;
  }



  static String? validateImageSize(File? image) {
    if (image == null || image.lengthSync() <= 2 * 1024 * 1024) {
      return null;
    }

    return 'حجم الصورة يجب ألا يتجاوز 2 ميجابايت';
  }

  static String normalizePhone(String phone) {
    phone = phone.trim().replaceAll(' ', '');

    if (phone.startsWith('+20')) {
      return '0${phone.substring(3)}';
    }

    if (phone.startsWith('20')) {
      return '0${phone.substring(2)}';
    }

    return phone;
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'الخانة دي مطلوبة';
    }

    final phone = normalizePhone(val);

    final regex = RegExp(r'^01[0125]\d{8}$');

    if (!regex.hasMatch(phone)) {
      return 'اكتب رقم موبايل مصري صحيح';
    }

    return null;
  }

  
  static String? validateCity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'اختار المحافظة';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'اختار العنوان';
    }
    return null;
  }

  static bool validateLocation(double? latitude, double? longitude) {
    if (latitude == null || longitude == null) {
      return false;
    }
    return true;
  }
}
