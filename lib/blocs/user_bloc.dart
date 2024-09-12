import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/user_repository.dart';
import '../models/user.dart';
import '../models/add_user_response.dart';

// BLOC EVENTS
abstract class UserEvent {}

class FetchUsers extends UserEvent {}

class AddUser extends UserEvent {
  final String name;
  final String job;

  AddUser({required this.name, required this.job});
}

// BLOC STATES
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;

  UserLoaded({required this.users});
}

class UserError extends UserState {
  final String message;

  UserError({required this.message});
}

class AddUserLoading extends UserState {}

class AddUserSuccess extends UserState {
  final AddUserResponse addUserResponse;

  AddUserSuccess({required this.addUserResponse});
}

class AddUserError extends UserState {
  final String message;

  AddUserError({required this.message});
}

// BLOC: UserBloc
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.fetchUsers();
        emit(UserLoaded(users: users));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });

    on<AddUser>((event, emit) async {
      emit(AddUserLoading());
      try {
        final response = await userRepository.addUser(event.name, event.job);
        emit(AddUserSuccess(addUserResponse: response));
      } catch (e) {
        emit(AddUserError(message: e.toString()));
      }
    });
  }
}
