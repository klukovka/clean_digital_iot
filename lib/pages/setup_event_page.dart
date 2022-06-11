import 'package:auto_route/auto_route.dart';
import 'package:clean_digital_iot/di/injection_container.dart';
import 'package:clean_digital_iot/models/additional_mode.dart';
import 'package:clean_digital_iot/views/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../bloc/setup_event_page/setup_event_page_cubit.dart';
import '../models/mode.dart';

enum _SetupEventFields {
  mode,
  additionalMode,
  temperature,
  spinning,
}

class SetupEventPage extends StatefulWidget implements AutoRouteWrapper {
  const SetupEventPage({Key? key}) : super(key: key);

  @override
  State<SetupEventPage> createState() => _SetupEventPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<SetupEventPageCubit>(),
      child: this,
    );
  }
}

class _SetupEventPageState extends State<SetupEventPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  SetupEventPageCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    SetupEventPageState state,
  ) {
    // TODO: implement listener
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup event'),
      ),
      body: BlocConsumer<SetupEventPageCubit, SetupEventPageState>(
        listener: _onStateChanged,
        builder: (context, state) {
          if (state.status == SetupEventPageStatus.loading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(state),
          );
        },
      ),
    );
  }

  Widget _buildForm(SetupEventPageState state) {
    return FormBuilder(
      key: _fbKey,
      child: ListView(
        children: [
          const SizedBox(height: 16),
          _buildTemperatureField(state),
          const SizedBox(height: 16),
          _buildSpinningField(state),
          const SizedBox(height: 16),
          _buildModeField(state),
          const SizedBox(height: 16),
          _buildAdditionalModeField(state),
          const SizedBox(height: 16),
          _buildTimeAndCosts(state),
          const SizedBox(height: 16),
          _buildButtons(state),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTemperatureField(SetupEventPageState state) {
    return FormBuilderDropdown<int>(
      name: _SetupEventFields.temperature.name,
      validator: FormBuilderValidators.required(
        context,
        errorText: 'Required',
      ),
      decoration: const InputDecoration(helperText: 'Temperature'),
      items: state.temperatures.map((e) {
        return DropdownMenuItem<int>(
          value: e,
          child: Text('$e °C'),
        );
      }).toList(),
    );
  }

  Widget _buildSpinningField(SetupEventPageState state) {
    return FormBuilderDropdown<int>(
      name: _SetupEventFields.spinning.name,
      decoration: const InputDecoration(helperText: 'Spinning speed'),
      onChanged: (_) => _fbState?.save(),
      validator: FormBuilderValidators.required(
        context,
        errorText: 'Required',
      ),
      items: state.speed.map((e) {
        return DropdownMenuItem<int>(
          value: e,
          child: Text('$e'),
        );
      }).toList(),
    );
  }

  Widget _buildModeField(SetupEventPageState state) {
    return FormBuilderDropdown<Mode>(
      name: _SetupEventFields.mode.name,
      decoration: const InputDecoration(helperText: 'Mode'),
      onChanged: (mode) {
        _fbState?.save();
        cubit.changeCostsAndTime(
          mode: mode,
          additionalMode: _fbValue[_SetupEventFields.additionalMode.name],
        );
      },
      validator: FormBuilderValidators.required(
        context,
        errorText: 'Required',
      ),
      items: state.modes.map((e) {
        return DropdownMenuItem<Mode>(
          value: e,
          child: Text(
            '${e.name} '
            '(Time: ${e.time}, Costs: ${e.costs})',
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAdditionalModeField(SetupEventPageState state) {
    return FormBuilderDropdown<AdditionalMode?>(
      name: _SetupEventFields.additionalMode.name,
      decoration: const InputDecoration(helperText: 'Additional Mode'),
      onChanged: (additionalMode) {
        _fbState?.save();
        cubit.changeCostsAndTime(
          mode: _fbValue[_SetupEventFields.mode.name],
          additionalMode: additionalMode,
        );
      },
      items: state.additionalModes.map((e) {
        return DropdownMenuItem<AdditionalMode>(
          value: e,
          child: Text(
            '${e.name} '
            '(Time: ${e.time}, Costs: ${e.costs})',
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimeAndCosts(SetupEventPageState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Time: ${state.time}',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(width: 16),
        Text(
          'Costs: ${state.costs}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }

  Widget _buildButtons(SetupEventPageState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PrimaryButton(
            title: 'Reset',
            isOutlined: true,
            onPressed: () {
              _fbState?.reset();
              cubit.reset();
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: PrimaryButton(
            title: 'Start',
            isLoading: state.status == SetupEventPageStatus.saving,
            onPressed: () {
              //TODO: Uncomment
              // cubit.save(
              //   mode: _fbValue[_SetupEventFields.mode.name],
              //   spinning: _fbValue[_SetupEventFields.spinning.name],
              //   temperature: _fbValue[_SetupEventFields.temperature.name],
              //   additionalMode: _fbValue[_SetupEventFields.additionalMode.name],
              // );
            },
          ),
        ),
      ],
    );
  }
}
