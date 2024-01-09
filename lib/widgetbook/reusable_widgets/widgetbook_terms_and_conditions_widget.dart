import 'package:backoffice/reusable_widgets/neo_terms_and_conditions/neo_terms_and_conditions.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookTermsAndConditionsWidget => WidgetbookComponent(
      name: 'TermsAndConditionsWidget',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoTermsAndConditions(
            titleText: context.knobs.string(
              label: 'Title',
              initialValue: "Terms And Conditions",
            ),
            contentText: context.knobs.string(
              label: 'Content',
              initialValue:
                  "Lorem ipsum dolor sit amet consectetur. Nibh faucibus vel natoque libero. Facilisis eu nulla ornare tortor sit condimentum eget egestas volutpat. Enim consequat et faucibus aenean in nec odio eget. Dui sit vestibulum imperdiet enim dolor amet pulvinar dolor ultricies. At consectetur at id tristique aliquam enim. Quis a arcu vitae dui fermentum. Nunc accumsan facilisis scelerisque massa.\n\nOrci dictum pellentesque duis aliquet turpis convallis. Posuere consectetur odio scelerisque mi. Massa in etiam facilisis enim augue nisl faucibus. Molestie quis gravida et dui nullam nec gravida faucibus. Hac amet non rhoncus eu tortor netus et sagittis pellentesque. Morbi accumsan enim non non massa integer euismod. Arcu porttitor mattis enim et et congue. Id dolor libero turpis sit sem pellentesque viverra. Et aliquet id tortor orci scelerisque sollicitudin nisl magna. Magna egestas quis blandit tellus. Consequat purus amet ut semper. Sem est molestie eget eget maecenas. Mauris sit nec id pellentesque eget elementum.\n\nFaucibus lorem amet aenean adipiscing lorem eget. Nisi congue magnis nulla egestas odio. Gravida ullamcorper arcu nibh ut nulla suspendisse facilisis vitae. Dignissim quis aliquet volutpat feugiat nullam a neque lorem tortor. Quis accumsan scelerisque eu pharetra. Lorem ipsum dolor sit amet consectetur. Nibh faucibus vel natoque libero. Facilisis eu nulla ornare tortor sit condimentum eget egestas volutpat.",
            ),
          ).paddingAll(NeoDimens.px16),
        ),
      ],
    );
