class SignUpEmailAndPasswordFailure {
  final String message;

  SignUpEmailAndPasswordFailure([this.message = " An Unknow error occurred"]);

  factory SignUpEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpEmailAndPasswordFailure('Please enter a strong password');
      case 'invalid-email':
        return SignUpEmailAndPasswordFailure('Email is not valid');
      case 'email-already-in-use':
        return SignUpEmailAndPasswordFailure('Email da dc su dung');
      case 'operation-not-allowed':
        return SignUpEmailAndPasswordFailure('Operation is not allowed');
      case 'user-disabled':
        return SignUpEmailAndPasswordFailure('User da duoc du dung');
      default:
        return SignUpEmailAndPasswordFailure();
    }
  }
}
