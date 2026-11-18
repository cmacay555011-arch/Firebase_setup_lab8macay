class DemoAuth {
  static String? registeredUsername;
  static String? registeredPassword;
  static String? currentUsername;

  // --- NEW: User Profile Data ---
  static String? registeredFullName;
  static String? registeredStudentId;
  static String? registeredSection;
  static String? registeredEmail;

  static bool login(String username, String password) {
    final isAdmin = username == 'admin' && password == 'admin123';

    final isRegisteredUser =
        registeredUsername != null &&
        username == registeredUsername &&
        password == registeredPassword;

    if (isAdmin || isRegisteredUser) {
      currentUsername = username;
      return true;
    }

    return false;
  }

  // --- UPDATED: Register method now takes extra details ---
  static void register({
    required String username,
    required String password,
    required String fullName,
    required String studentId,
    required String section,
    required String email,
  }) {
    registeredUsername = username;
    registeredPassword = password;
    
    registeredFullName = fullName;
    registeredStudentId = studentId;
    registeredSection = section;
    registeredEmail = email;
  }

  static void logout() {
    currentUsername = null;
  }
}