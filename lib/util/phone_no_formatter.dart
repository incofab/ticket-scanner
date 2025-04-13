class PhoneNoFormatter {
  late String _phone;
  PhoneNoFormatter(String phone) {
    _phone = phone.replaceAll(RegExp(r'[- ]'), '');
  }

  get phone => _phone;

  PhoneNoFormatter internationalize() {
    if (_phone.startsWith('234')) {
      _phone = '+$_phone';
    } else if (_phone.startsWith('0')) {
      _phone = '+234${_phone.substring(1)}';
    }
    return this;
  }
}
