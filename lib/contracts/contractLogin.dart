
import 'package:mvp/contracts/basePresenter.dart';
import 'package:mvp/contracts/baseView.dart';

abstract class  View extends BaseView{
  showError(var msg);
  showSuccess(var msg);
  gotoHomePage();
}

abstract class Presenter extends BasePresenter{

  setEmail(String email);
  setPassword(String password);
  doLogin();
  
}