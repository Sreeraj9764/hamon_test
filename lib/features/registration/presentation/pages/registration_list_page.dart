import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/core/extentions/context_extentions.dart';
import 'package:hamon_test/features/registration/presentation/blocs/register_bloc.dart';

class RegistrationListPage extends StatefulWidget {
  const RegistrationListPage({super.key});

  @override
  State<RegistrationListPage> createState() => _RegistrationListPageState();
}

class _RegistrationListPageState extends State<RegistrationListPage> {
  @override
  void initState() {
    context.read<RegistrationBloc>().add(GetRegistrationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HamonScaffold(
      body: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          if (state is RegistrationBlocLoading ||
              state is RegistrationBlocInitial) {
            return const HmLoadingIndicator();
          }
          if (state is RegistrationBlocError) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is GetRegistrationBlocSuccess) {
            return state.registrations.isNotEmpty
                ? ListView.builder(
                    itemCount: state.registrations.length,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: HmCard(
                        title: state.registrations[index].student,
                        subtitle: state.registrations[index].student,
                        trailing: Text("ID: ${state.registrations[index].id}"),
                      ),
                    ),
                  )
                : const Center(child: Text("No Records"));
          }
          return const Text("Empty Data");
        },
      ),
      bottom: const NavChilds(),
    );
  }
}

class NavChilds extends StatelessWidget {
  const NavChilds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "New Registration",
                style: context.textTheme.titleSmall,
              )),
        ),
      ],
    );
  }
}
