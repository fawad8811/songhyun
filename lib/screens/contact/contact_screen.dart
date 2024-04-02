import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactScreen extends StatelessWidget {
  final bool isMobile;

  const ContactScreen({Key? key, this.isMobile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const PageHead(title: 'Contact', image: Assets.imagesHomebgfive),
        SizedBox(height: getProportionateScreenHeight(20)),
        Container(
          color: AppColors.kMainBackgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(24),
              vertical: getProportionateScreenHeight(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(30),
                  ),
                  child: Row(
                    children: [
                      Image.asset(Assets.imagesMapIcon1),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        maxLines: 3,
                        AppLocalizations.of(context)!.addressOne,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: const Color(0xFF333333),
                                  fontSize: isMobile ? 12 : 14,
                                ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(30),
                  ),
                  child: Row(
                    children: [
                      Image.asset(Assets.imagesMapIcon2),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        AppLocalizations.of(context)!.phoneNumber,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: const Color(0xFF333333),
                              fontSize: isMobile ? 10 : 14,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(30),
                  ),
                  child: Row(
                    children: [
                      Image.asset(Assets.imagesMapIcon3),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        AppLocalizations.of(context)!.phoneNumber,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: const Color(0xFF333333),
                              fontSize: isMobile ? 10 : 14,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.zero,
                    // height: getProportionateScreenHeight(100),
                    width: isMobile ? double.infinity : getProportionateScreenWidth(150),
                    color: AppColors.kGreen,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.mail_outline_outlined,
                          size: 50,
                          grade: 10,
                          color: AppColors.kWhite,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(2)),
                          child: Text(
                            'Submit Business Plan',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                              fontSize: 25,
                                    color: AppColors.kWhite,
                                    fontWeight: FontWeight.w100),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(80)),
      ],
    );
  }
}

class TypeContainer extends StatelessWidget {
  final String image;

  const TypeContainer({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(275),
        width: getProportionateScreenWidth(275),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.only(right: 20),
        decoration: const BoxDecoration(
          color: AppColors.kWhite,
          border: Border.fromBorderSide(
            BorderSide(
              color: Color(0xFFcccccc),
              width: 1,
            ),
          ),
        ),
        child: Center(
          child: Image.asset(image),
        ));
  }
}
