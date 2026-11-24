import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/navigation/app_routes.dart';
import '../../../../common/widgets/app_settings_actions.dart';
import '../../../../common/widgets/load_error_view.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: context.read<MoleculeListCubit>().state.query,
    );
    _scrollController.addListener(_loadNextPage);
  }

  void _loadNextPage() {
    if (_scrollController.hasClients &&
        _scrollController.position.extentAfter < 300) {
      context.read<MoleculeListCubit>().loadMore();
    }
  }

  void _search(String query) {
    context.read<MoleculeListCubit>().search(query);
    if (_scrollController.hasClients) _scrollController.jumpTo(0);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
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
        child: BlocConsumer<MoleculeListCubit, MoleculeListState>(
          listener: (context, state) {
            if (state.status == MoleculeListStatus.loaded) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) _loadNextPage();
              });
            }
          },
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
                      if (state.hasLoadedPage)
                        Text(
                          l10n.recordCount(
                            state.molecules.length,
                            state.totalCount,
                          ),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _searchController,
                        onChanged: _search,
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
                                    _search('');
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: switch (state.status) {
                    MoleculeListStatus.loading => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    MoleculeListStatus.failure => LoadErrorView(
                      error: state.error!,
                      onRetry: context.read<MoleculeListCubit>().load,
                    ),
                    MoleculeListStatus.loaded ||
                    MoleculeListStatus.loadingMore ||
                    MoleculeListStatus.loadMoreFailure =>
                      state.molecules.isEmpty
                          ? Center(child: Text(l10n.nothingFound))
                          : ListView.builder(
                              key: const PageStorageKey<String>(
                                'molecule-list',
                              ),
                              controller: _scrollController,
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                              itemCount:
                                  state.molecules.length +
                                  (state.nextOffset == null ? 0 : 1),
                              itemBuilder: (context, index) {
                                if (index == state.molecules.length) {
                                  return _PaginationFooter(state: state);
                                }
                                final molecule = state.molecules[index];

                                return MoleculeCard(
                                  key: ValueKey(molecule.id),
                                  molecule: molecule,
                                  onTap: () => context.push(
                                    AppRoutes.molecule(molecule.id),
                                  ),
                                );
                              },
                            ),
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _PaginationFooter extends StatelessWidget {
  const _PaginationFooter({required this.state});

  final MoleculeListState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MoleculeListCubit>();
    final l10n = AppLocalizations.of(context)!;
    return switch (state.status) {
      MoleculeListStatus.loadingMore => const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator()),
      ),
      MoleculeListStatus.loadMoreFailure => LoadErrorView(
        error: state.error!,
        onRetry: () => cubit.loadMore(retry: true),
      ),
      _ => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: TextButton(
            onPressed: cubit.loadMore,
            child: Text(l10n.loadMore),
          ),
        ),
      ),
    };
  }
}
