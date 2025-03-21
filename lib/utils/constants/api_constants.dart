class TApiConstants {
  TApiConstants._();

  static const String baseUrl = 'https://pharmacy.technoplus.dev/api/';

  static const String darkMap = 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png';

  static const String lightMap = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';

  static const String register = 'driver/register';

  static const String verify = 'otp/verify';

  static const String resend = 'otp/resend';

  static const String forget = 'ForgetPassword';

  static const String forgetVerify = 'otp/password/verify';

  static const String forgetReset = 'resetPassword';

  static const String signin = 'driver/login';

  static const String change = 'drivers/toggle-status';

  static const String accept = 'driver/order_accept';

  static const String confirm = 'driver/confirmDelivered';

  static const String reject = 'driver/order_reject';

  static const String getOrders = 'drivers/orders';

  static const String showOrder = 'order/show';

  static const String getDrivers = 'drivers';

  static const String assignOrder = 'order/assign-driver';

  static const String updateOrder = 'order/status/on_the_way';

  static const String addOrderPrice = 'order/add_price';

  static const String addDeliveryPrice = 'delivery-price';
}