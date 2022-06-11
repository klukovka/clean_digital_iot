import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:clean_digital_iot/di/injection_container.dart';
import 'package:clean_digital_iot/router/clean_digital_router.dart';
import 'package:clean_digital_iot/views/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../bloc/setup_iot_page/setup_iot_page_cubit.dart';

enum _SetupIotPageFields {
  email,
  password,
  washMachineId,
}

class SetupIotPage extends StatefulWidget implements AutoRouteWrapper {
  const SetupIotPage({Key? key}) : super(key: key);

  @override
  State<SetupIotPage> createState() => _SetupIotPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<SetupIoTPageCubit>(),
      child: this,
    );
  }
}

class _SetupIotPageState extends State<SetupIotPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  SetupIoTPageCubit get cubit => context.read();

  String? Function(String?) _passwordValidator(BuildContext context) {
    return (password) {
      final expression = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9#?!@$%^&*-]).{8,32}$',
      );
      final matches = expression.hasMatch(password ?? '');

      if (!matches) {
        return 'Password is not valid';
      }
      return null;
    };
  }

  void _onStateChanged(
    BuildContext context,
    SetupIoTPageState state,
  ) {
    if (state.status == SetupIoTPageStatus.error) {
      log(state.errorMessage);
    } else if (state.status == SetupIoTPageStatus.success) {
      router.replaceSetupEventPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SetupIoTPageCubit, SetupIoTPageState>(
        listener: _onStateChanged,
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FormBuilder(
                key: _fbKey,
                onChanged: _fbState?.save,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildEmailField(),
                    const SizedBox(height: 16),
                    _buildPasswordField(state),
                    const SizedBox(height: 16),
                    _buildWashMachineField(),
                    const SizedBox(height: 16),
                    _buildSetupButton(state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: _SetupIotPageFields.email.name,
      decoration: const InputDecoration(
        prefixIcon: Icon(Typicons.mail),
        labelText: 'Email',
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            context,
            errorText: 'Required field',
          ),
          FormBuilderValidators.email(
            context,
            errorText: 'Email is not valid',
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField(SetupIoTPageState state) {
    return FormBuilderTextField(
      name: _SetupIotPageFields.password.name,
      obscureText: state.obscureText,
      validator: _passwordValidator(context),
      decoration: InputDecoration(
        prefixIcon: const Icon(Typicons.key_outline),
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            state.obscureText ? FontAwesome5.eye_slash : FontAwesome5.eye,
          ),
          onPressed: cubit.changeObscureText,
        ),
      ),
    );
  }

  Widget _buildWashMachineField() {
    return FormBuilderTextField(
      name: _SetupIotPageFields.washMachineId.name,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.local_laundry_service),
        labelText: 'Washing Machine Id',
      ),
      validator: FormBuilderValidators.required(
        context,
        errorText: 'Required field',
      ),
    );
  }

  Widget _buildSetupButton(SetupIoTPageState state) {
    return PrimaryButton(
      title: 'Setup IoT',
      isLoading: state.status == SetupIoTPageStatus.loading,
      onPressed: () {
        if (_fbState?.saveAndValidate() ?? false) {
          cubit.login(
            _fbValue[_SetupIotPageFields.email.name],
            _fbValue[_SetupIotPageFields.password.name],
            _fbValue[_SetupIotPageFields.washMachineId.name],
          );
        }
      },
    );
  }
}
