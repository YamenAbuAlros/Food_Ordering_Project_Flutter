import 'package:foodordering/core/data/network/network_config.dart';

class UserEndPoints {
  static String login = NetworkConfig.getFullApiRoute('user/login');

  static String verfiy = NetworkConfig.getFullApiRoute('user/verfiy');

  static String register = NetworkConfig.getFullApiRoute('user/register');
  // static String register = NetworkConfig.getFullApiRoute('JoinApplication/Create');

  static String forgotpassword =
      NetworkConfig.getFullApiRoute('user/forgotpassword');
}
