import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/language/language_notifier.dart';
import '../../../models/deed.dart';
import '../notifiers/deed_notifier.dart';

class DeedTile extends ConsumerStatefulWidget {
  final Deed deed;
  const DeedTile({
    super.key,
    required this.deed,
  });

  @override
  ConsumerState<DeedTile> createState() => _DeedTileState();
}

class _DeedTileState extends ConsumerState<DeedTile> {
  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    ref.watch(deedsProvider);
    return Card(
      child: ListTile(
        leading: CupertinoCheckbox(
          value: ref.watch(deedsProvider.notifier).getIsDoneStatus(widget.deed),
          onChanged: (value) {
            ref.read(deedsProvider.notifier).markAsDone(widget.deed, value!);
          },
        ),
        title: Text(
          language == Language.bn ? widget.deed.titleBn : widget.deed.titleEn,
        ),
      ),
    );
  }
}
