import 'package:dartweek/application/ui/loader/loader_mixin.dart';
import 'package:dartweek/application/ui/messages/messages_mixin.dart';
import 'package:dartweek/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  // RxString nome = RxString("Fabiano");
  //var nome = 'Fabiano'.obs;
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading.value = true;
      await _loginService.login();
      loading.value = false;
      message(
        MessageModel.info(
            title: "Login Sucesso", message: "Login realizado com sucesso"),
      );
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: "login Erro", message: "erro ao realizar login"));
    }
  }
}
