import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Validators {
  static MultiValidator nameValidator(BuildContext context){
    return MultiValidator([RequiredValidator(errorText: AppLocalizations.of(context)!.nameIsRequired)]);
  }

  static MultiValidator emailValidator (BuildContext context){
    return MultiValidator([
      RequiredValidator(errorText: AppLocalizations.of(context)!.emailIsRequired),
      PatternValidator(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
          errorText: AppLocalizations.of(context)!.emailIsNotValid)
    ]);
  }

  static MultiValidator passwordValidator (BuildContext context){
    return  MultiValidator([
      RequiredValidator(errorText: AppLocalizations.of(context)!.passwordIsRequired),
      MinLengthValidator(8, errorText: AppLocalizations.of(context)!.password8Length),
      PatternValidator(r"^(?=.*?[A-Z])(?=.*?[a-z]).{6,}$",
          errorText: AppLocalizations.of(context)!.passwordIsNotValid),
      PatternValidator(r"^(?=.*?[0-9]).{6,}$",
          errorText: AppLocalizations.of(context)!.passwordHaveNotNumber),
    ]);
  }
}