import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class GreetingsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const GreetingsScreen({Key? key, required this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            const PageHead(title:'Greetings', image: Assets.imagesBgTopGreeting),
            Padding(
              padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(50),
                  bottom: getProportionateScreenHeight(20)),
              child: Text(
                textAlign: TextAlign.center,
                'Thank you for visiting SongHyun Investment.',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.kGreenTextColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: Text(
                textAlign: TextAlign.center,
                'We would like to extend our warmest welcome to you.\n We manage a full spectrum of funds specifically dedicated to each phase of development of small and medium-sized companies.\n Our strategy is to expand from early stage venture to growth and private equity investments as evidenced by our first\n private equity fund of KRW 155 billion (USD 135 million) launched in 2015. At the same time, we plan to expand our investment universe beyond Korea into neighboring countries in Asia.\n We are committed to pursuing mutual growth with the invested companies.\n We bring with us a wealth of management and industry expertise.\n We invite you to join us to embark on the next phase of growth in you company.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(height: 2.0, color: AppColors.kBlack),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(150)),
          ],
        ),
      ],
    );
  }
}
