import 'package:projectiot/core/errors/failure_handle.dart';

class AuthError {
  static Failure registerError(String code) {
    switch (code) {
      case 'invalid-email':
        return RegisterFirebaseException('Email không đúng định dạng');
      case 'email-already-in-use':
        return RegisterFirebaseException('Email đã tồn tại');
      case 'weak-password':
        return RegisterFirebaseException('Mật khẩu quá yếu (thường < 6 ký tự)');
      case 'network-request-failed':
        return NetworkException(
          'Lỗi kết nối mạng, không thể gửi yêu cầu đến máy chủ',
        );
      default:
        return UnknowException('Lỗi không xác định');
    }
  }

  static Failure loginError(String code) {
    switch (code) {
      case 'invalid-email':
        return LoginFirebaseException('Email không hợp lệ');
      case 'user-disabled':
        return LoginFirebaseException(
          'Tài khoản đã bị vô hiệu hóa bởi máy chủ',
        );
      case 'user-not-found':
        return LoginFirebaseException(
          'Không có người dùng nào khớp với email đã nhập',
        );
      case 'wrong-password':
        return LoginFirebaseException('Sai mật khẩu, vui lòng đăng nhập lại');
      case 'network-request-failed':
        return NetworkException(
          'Lỗi kết nối mạng, không thể gửi yêu cầu đến máy chủ',
        );
      default:
        return UnknowException('Lỗi không xác định');
    }
  }

  static Failure hashCodeUnknowException(String e) {
    return UnknowException(e);
  }

  static Failure verificationEmailError() {
    return VerificationEmailError(
      'Email chưa xác thưc, vui lòng vào gmail nhấn vào link xác thực',
    );
  }
}
