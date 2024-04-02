import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/screens/widgets/page_head.dart';

class TeamScreen extends StatelessWidget {
  final bool isMobile;

  TeamScreen({Key? key, this.isMobile = false}) : super(key: key);

  final List<TeamMember> managementTeam = [
    TeamMember(
        name: 'Beom seok',
        position: 'Chairman',
        image: Assets.imagesManagementEight),
    TeamMember(
        name: 'Baek hyeon',
        position: 'President',
        image: Assets.imagesManagementSix),
  ];
  final List<TeamMember> investmentDivisionTeam = [
    TeamMember(
      name: 'Do-Yoon',
      position: 'Vice President',
      image: Assets.imagesCeoOne,
    ),
    TeamMember(
      name: 'Min joon',
      position: 'Executive Managing Director',
      image: Assets.imagesManagementTwo,
    ),
    TeamMember(
      name: 'Kyubok',
      position: 'Director',
      image: Assets.imagesManagementThree,
    ),
    TeamMember(
      name: 'Seong-Ho',
      position: 'Team Manager',
      image: Assets.imagesManagementFour,
    ),
    // Add more members as needed
  ];
  final List<TeamMember> managementSupportTeam = [
    TeamMember(
      name: 'Do-Yoon',
      position: 'Team Manager',
      image: Assets.imagesManagementFive,
    ),
    // Add more members as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const PageHead(title: 'Team', image: Assets.imagesHomebgfour),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(60),
          ),
          child: Column(
            children: [
              _buildTeamGridView('Management', managementTeam),
              SizedBox(height: getProportionateScreenHeight(20)),
              _buildTeamGridView('Investment Division', investmentDivisionTeam),
              SizedBox(height: getProportionateScreenHeight(20)),
              _buildTeamGridView('Management Support', managementSupportTeam),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(70)),
      ],
    );
  }

  Widget _buildTeamGridView(String type, List<TeamMember> team) {
    int itemCount;
    if (type == 'Management') {
      itemCount = 4;
    } else if (type == 'Investment Division') {
      itemCount = 5;
    } else {
      itemCount = 2;
    }

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 2 : 4,
        mainAxisSpacing: 20,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (index == 0) {
          return TypeContainer(type: type, isMobile: isMobile);
        } else if (index <= min(3, team.length)) {
          final member = team[index - 1];
          return TeamContainer(
            name: member.name,
            position: member.position,
            image: member.image,
            isMobile: isMobile,
          );
        } else if (index == 4 &&
            type == 'Investment Division' &&
            team.length >= 4) {
          final member = team[index - 1];
          return TeamContainer(
            name: member.name,
            position: member.position,
            image: member.image,
            isMobile: isMobile,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class TeamMember {
  final String name;
  final String position;
  final String image;

  TeamMember({
    required this.name,
    required this.position,
    required this.image,
  });
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
      height: getProportionateScreenHeight(275),
      width: getProportionateScreenWidth(275),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(right: 20),
      decoration: const BoxDecoration(
        color: Colors.green, // Use your desired color
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          type,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w100,
                color: Colors.white, // Use your desired color
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
      height: getProportionateScreenHeight(275),
      width: getProportionateScreenWidth(275),
      margin: const EdgeInsets.only(right: 20),
      child: Stack(
        children: [
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
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Text(
              name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    // Use your desired color
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
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(0xFFabd58c),
                    fontWeight: FontWeight.w100,
                    fontSize: isMobile ? 10 : 20,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
