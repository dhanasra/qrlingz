// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'account_bloc.dart';

@immutable
sealed class AccountEvent {}

class LogoutEvent extends AccountEvent {}

class DeleteAccountEvent extends AccountEvent {}

class SaveProfileEvent extends AccountEvent {
  final String fname;
  final String lname;
  final String? phone;

  SaveProfileEvent({
    required this.fname,
    required this.lname,
    this.phone,
  });
}
