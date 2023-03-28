import '../Model/User.dart';
import '../contracts/contractLogin.dart';

class PresenterLogin implements Presenter {
  late View mView;
  late User user;

  PresenterLogin(View v) {
    v.setPresenter(this);
    mView = v;
    user = User();
  }

  @override
  doLogin() {
    if (user.isLoginValid()) {
      //user credentials are valid
      //for this tuts we simulate login
      onSuccess('payload from server', 'success');
    } else
      mView.showError('User credentials not valid, try again');
  }

  @override
  onError(String msg) {
    mView.showError(msg);
  }

  @override
  onSuccess(payload, String msg) async {
    mView.showSuccess(msg);
    await mView.gotoHomePage();
  }

  @override
  setEmail(String email) {
    user.email = email;
  }

  @override
  setPassword(String pwd) {
    //set user password;
    user.password = pwd;
  }

  @override
  Future subscribe() async {
    // here you subscribe to resources like database etc;
  }

  @override
  Future unsubscribe() async {
    // here, you release resources etc like database;
  }
}