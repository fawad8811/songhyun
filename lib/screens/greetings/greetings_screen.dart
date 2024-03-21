
import 'package:songhyun/utils/app_exports.dart';

class GreetingsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const GreetingsScreen({Key? key, required this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: getProportionateScreenHeight(120),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              Container(
                width: double.infinity,
                height: getProportionateScreenHeight(450),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imagesBgTopGreeting),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: getProportionateScreenHeight(10),
                      left: getProportionateScreenWidth(150),
                      child: Text(
                        'Greetings',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(color: AppColors.kWhite),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(50),
                    bottom: getProportionateScreenHeight(20)),
                child: Text(
                  textAlign: TextAlign.center,
                  'Evergreen Pine Hill, Songhyeon \'松峴\' always\npursues shared growth with invested companies with consistent investment principles.',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: AppColors.kGreenTextColor, height: 1.5),
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Song Hyun\'s investment team has successfully supported the IPO of about 60 venture companies and\n'
                'has been generating excellent investment performance, including remarkable returns in the private equity investment sector since 2015.\n'
                'All funds under management have demonstrated excellent performance, and\n'
                'we are solidifying our investment capabilities from the startup stage to the growth capital stage, as well as expanding our investment horizon from the private equity investment sector to the small & medium cap market.\n'
                'Meanwhile, by becoming a member of Mugunghwa Financial Group in July 2023, Song Hyun\n'
                'will be able to further accelerate venture investment and private equity investment based on Mugunghwa Financial Group\'s powerful financial power and network.\n'
                'Songhyun will continue to pursue shared growth as a faithful partner in the growth momentum of investment companies and\n'
                'pursue the philosophy of sharing by sharing the results with all investors, investment reviewers, and shareholders.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(height: 2.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}


