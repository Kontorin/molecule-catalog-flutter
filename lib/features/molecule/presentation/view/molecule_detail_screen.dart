import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/app_settings_actions.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../mechanism/domain/i_mechanism_repository.dart';
import '../../../mechanism/domain/mechanism_model.dart';
import '../../domain/i_molecule_repository.dart';
import '../../domain/molecule_model.dart';
import '../bloc/detail/molecule_detail_cubit.dart';
import '../bloc/detail/molecule_detail_state.dart';

class MoleculeDetailScreen extends StatelessWidget {
  const MoleculeDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => MoleculeDetailCubit(
        context.read<IMoleculeRepository>(),
        context.read<IMechanismRepository>(),
      )..load(id),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(l10n.catalogTitle),
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
                      context.go('/');
                    }
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<MoleculeDetailCubit, MoleculeDetailState>(
                  builder: (context, state) {
                    return switch (state) {
                      MoleculeDetailInitial() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      MoleculeDetailNotFound() => Center(
                        child: Text(l10n.moleculeNotFound),
                      ),
                      MoleculeDetailLoaded(
                        :final molecule,
                        :final mechanisms,
                      ) => _MoleculeDetails(
                        molecule: molecule,
                        mechanisms: mechanisms,
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

class _MoleculeDetails extends StatelessWidget {
  const _MoleculeDetails({
    required this.molecule,
    required this.mechanisms,
  });

  final MoleculeModel molecule;
  final List<MechanismModel> mechanisms;

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
                Text(
                  molecule.id,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontFamily: 'monospace',
                  ),
                ),
                const Divider(height: 24),
                Text(
                  l10n.molecularProperties,
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 12),
                Text('${l10n.formula}: ${molecule.properties.formula}'),
                const SizedBox(height: 8),
                Text(
                  '${l10n.molecularWeight}: '
                  '${molecule.properties.molecularWeight} '
                  '${l10n.molecularWeightUnit}',
                ),
                const Divider(height: 24),
                Text(
                  l10n.mechanismsTitle,
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 12),
                if (mechanisms.isEmpty)
                  Text(l10n.noMechanisms)
                else
                  for (final mechanism in mechanisms)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(mechanism.description),
                      subtitle: Text(
                        '${l10n.mechanismId}: ${mechanism.id}\n'
                        '${l10n.target}: ${mechanism.targetName}',
                      ),
                      trailing: Tooltip(
                        message: l10n.openMechanism,
                        child: const Icon(Icons.chevron_right),
                      ),
                      onTap: () => context.push(
                        '/molecule/${Uri.encodeComponent(molecule.id)}'
                        '/mechanism/${mechanism.id}',
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
