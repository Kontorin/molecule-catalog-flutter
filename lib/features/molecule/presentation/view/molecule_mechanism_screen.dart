import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/navigation/app_routes.dart';
import '../../../../common/widgets/app_settings_actions.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../mechanism/domain/i_mechanism_repository.dart';
import '../../../mechanism/domain/mechanism_model.dart';
import '../../domain/i_molecule_repository.dart';
import '../../domain/molecule_model.dart';
import '../bloc/mechanism/molecule_mechanism_cubit.dart';
import '../bloc/mechanism/molecule_mechanism_state.dart';

class MoleculeMechanismScreen extends StatelessWidget {
  const MoleculeMechanismScreen({
    super.key,
    required this.moleculeId,
    required this.mechanismId,
  });

  final String moleculeId;
  final String mechanismId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => MoleculeMechanismCubit(
        context.read<IMechanismRepository>(),
        context.read<IMoleculeRepository>(),
      )..load(moleculeId, mechanismId),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(l10n.mechanismTitle),
          actions: const [AppSettingsActions()],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: TextButton.icon(
                  icon: const Icon(Icons.arrow_back),
                  label: Text(l10n.back),
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go(AppRoutes.molecule(moleculeId));
                    }
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<MoleculeMechanismCubit, MoleculeMechanismState>(
                  builder: (context, state) {
                    return switch (state) {
                      MoleculeMechanismInitial() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      MoleculeMechanismNotFound() => Center(
                        child: Text(l10n.mechanismNotFound),
                      ),
                      MoleculeMechanismLoaded(
                        :final mechanism,
                        :final molecule,
                      ) => _MechanismDetails(
                        mechanism: mechanism,
                        molecule: molecule,
                      ),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MechanismDetails extends StatelessWidget {
  const _MechanismDetails({required this.mechanism, required this.molecule});

  final MechanismModel mechanism;
  final MoleculeModel molecule;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(molecule.name, style: theme.textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(molecule.id, style: theme.textTheme.bodyMedium),
                const Divider(height: 24),
                Text(
                  mechanism.description,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Text('${l10n.mechanismId}: ${mechanism.id}'),
                const SizedBox(height: 8),
                Text('${l10n.actionType}: ${mechanism.actionType}'),
                const SizedBox(height: 8),
                Text('${l10n.target}: ${mechanism.targetName}'),
                const SizedBox(height: 8),
                Text('${l10n.targetId}: ${mechanism.targetId}'),
                const Divider(height: 24),
                Text('${l10n.sourceMoleculeId}: ${mechanism.moleculeId}'),
                const SizedBox(height: 8),
                Text('${l10n.parentMoleculeId}: ${mechanism.parentMoleculeId}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
