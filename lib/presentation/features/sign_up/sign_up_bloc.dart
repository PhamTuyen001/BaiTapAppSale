import 'package:baitap_appsale/presentation/features/sign_up/sign_up_event.dart';
import '../../../common/bases/base_bloc.dart';
import '../../../common/bases/base_event.dart';
import '../../../data/datasources/remote/dto/app_resource.dart';
import '../../../data/datasources/remote/dto/user_dto.dart';
import '../../../data/repositories/authentication_repository.dart';

class SignUpBloc extends BaseBloc {
  late AuthenticationRepository _repository;

  void updateAuthenRepo(AuthenticationRepository authenticationRepository) {
    _repository = authenticationRepository;
  }

  @override
  void dispatch(BaseEvent event) {
    switch (event.runtimeType) {
      case SignUpEvent:
        handleSignUp(event as SignUpEvent);
        break;
    }
  }

  void handleSignUp(SignUpEvent event) async {
    loadingSink.add(true);
    try {
      AppResource<UserDTO> resourceUserDTO = await _repository.signUp(event.email, event.password, event.phone, event.name, event.address);
      if (resourceUserDTO.data == null) return;
      progressSink.add(SignUpSuccessEvent(email: event.email, password: event.password));
      loadingSink.add(false);
    } catch (e) {
      progressSink.add(SignUpFailEvent(message: e.toString()));
      loadingSink.add(false);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}