import 'package:easy_localization/easy_localization.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';
import 'dart:math';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TeamScreen extends StatefulWidget {
  final bool isMobile;

  const TeamScreen({Key? key, this.isMobile = false}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  // Define lists for random data
  final List<String> names = [
    'John Doe',
    'Alice Smith',
    'Michael Johnson',
    'Emily Brown',
    'Daniel Wilson',
    'Sophia Lee',
  ];

  final List<String> positions = [
    'CEO',
    'Vice President',
    'Executive Managing',
    'Director of Marketing',
    'Financial Officer',
    'Technology Officer',
  ];

  final List<String> images = [
    Assets.imagesteamProfile,
    // Assets.imagesteamProfile2,
    // Assets.imagesteamProfile3,
    // Assets.imagesteamProfile4,
    // Assets.imagesteamProfile5,
    // Assets.imagesteamProfile6,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const PageHead(title: 'Team', image: Assets.imagesBgTopTeam),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(60),
          ),
          child: Column(
            children: [
              _buildTeamGridView('Management', widget.isMobile),
              SizedBox(height: getProportionateScreenHeight(20)),
              _buildTeamGridView('Investment Division', widget.isMobile),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(70)),
      ],
    );
  }

  Widget _buildTeamGridView(String type, bool isMobile) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 2 : 4,
        mainAxisSpacing: 20,
      ),
      itemCount: type == 'Management' ? 4 : 5,
      itemBuilder: (context, index) {
        if (index == 0) {
          return TypeContainer(type: type, isMobile: isMobile);
        } else {
          // Generate random index for data
          final random = Random();
          final nameIndex = random.nextInt(names.length);
          final positionIndex = random.nextInt(positions.length);
          final imageIndex = random.nextInt(images.length);

          return TeamContainer(
            name: names[nameIndex],
            position: positions[positionIndex],
            image: images[imageIndex],
            isMobile: isMobile,
          );
        }
      },
    );
  }
}

class TypeContainer extends StatelessWidget {
  final bool isMobile;
  final String type;

  const TypeContainer({
    required this.type,
    required this.isMobile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      width: 275,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(right: 20),
      decoration: const BoxDecoration(
        color: AppColors.kGreen,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          type.tr(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.kWhite,
                fontSize: isMobile ? 16 : 40,
              ),
        ),
      ),
    );
  }
}

class TeamContainer extends StatelessWidget {
  final String name;
  final String position;
  final String image;
  final bool isMobile;

  const TeamContainer({
    required this.name,
    required this.position,
    required this.image,
    this.isMobile = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      width: 275,
      margin: const EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          // Image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                border: const Border.fromBorderSide(
                  BorderSide(
                    color: Color(0xFFcccccc),
                    width: 1,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Shadow
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.kBlack.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Text
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Text(
              name.tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.kWhite,
                    fontSize: isMobile ? 14 : 26,
                  ),
            ),
          ),
          Positioned(
            bottom: 18,
            left: 20,
            right: 20,
            child: Text(
              position,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: const Color(0xFFabd58c),
                    fontSize: isMobile ? 10 : 20,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
