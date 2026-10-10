import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/app_settings_actions.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/list/molecule_list_cubit.dart';
import '../bloc/list/molecule_list_state.dart';
import 'widgets/molecule_card.dart';

class MoleculeListScreen extends StatefulWidget {
  const MoleculeListScreen({super.key});

  @override
  State<MoleculeListScreen> createState() => _MoleculeListScreenState();
}

class _MoleculeListScreenState extends State<MoleculeListScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: context.read<MoleculeListCubit>().state.query,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.catalogTitle),
        actions: const [AppSettingsActions()],
      ),
      body: SafeArea(
        child: BlocBuilder<MoleculeListCubit, MoleculeListState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.libraryTitle,
                        style: theme.textTheme.headlineSmall,
                      ),
                      Text(
                        l10n.recordCount(state.molecules.length),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _searchController,
                        onChanged: context.read<MoleculeListCubit>().search,
                        decoration: InputDecoration(
                          hintText: l10n.searchHint,
                          prefixIcon: const Icon(Icons.search),
                          border: const OutlineInputBorder(),
                          suffixIcon: state.query.isEmpty
                              ? null
                              : IconButton(
                                  tooltip: l10n.clearSearch,
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    _searchController.clear();
                                    context.read<MoleculeListCubit>().search('');
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: state.molecules.isEmpty
                      ? Center(child: Text(l10n.nothingFound))
                      : ListView.builder(
                          key: const PageStorageKey<String>('molecule-list'),
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                          itemCount: state.molecules.length,
                          itemBuilder: (context, index) {
                            final molecule = state.molecules[index];

                            return MoleculeCard(
                              key: ValueKey(molecule.id),
                              molecule: molecule,
                              onTap: () => context.push(
                                '/molecule/${Uri.encodeComponent(molecule.id)}',
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
