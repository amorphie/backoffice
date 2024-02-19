import 'package:flutter/material.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/navigation/neo_navigation_helper.dart';
import 'package:backoffice/reusable_widgets/neo_badge/model/neo_badge_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_badge/neo_badge.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/reusable_widgets/sub_navigation/models/sub_navigation_component_details.dart';
import 'package:backoffice/util/neo_util.dart';

class SubNavigationWidget extends StatelessWidget {
  final List<SubNavigationComponentDetails> componentDetailsList;

  const SubNavigationWidget({required this.componentDetailsList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            ...componentDetailsList.map((e) => _buildNavigationItemRow(e, context)),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItemRow(SubNavigationComponentDetails componentDetails, BuildContext context) {
    return InkWell(
      onTap: () => getIt.get<NeoNavigationHelper>().navigate(
            navigationType: componentDetails.navigationType,
            navigationPath: componentDetails.navigateTo,
          ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NeoText(
                componentDetails.displayName,
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    if (componentDetails.displayNewBadge)
                      const NeoBadge(
                        text: "New", // STOPSHIP: Add localization
                        displayMode: NeoBadgeDisplayMode.blackHighlighted,
                      ).paddingOnly(end: 4.0),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
