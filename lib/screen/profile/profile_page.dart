import 'package:flutter/material.dart';
import 'package:persons_exam/data/model/repo/model.dart';
import 'package:persons_exam/data/model/repo/people.dart';

import '../custom_ui/reuseable_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.personData,
  });

  final People personData;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selected = 0;
  final EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 20.0);
  late People current;
  onFirstLoaded() {
    current = widget.personData;
  }


  @override
  Widget build(BuildContext context) {
    onFirstLoaded();
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: _buildAppBar(),
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.all(10),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Image(
               image: Image.network(current.image).image,
              ),
               AppText(
                text: "Full Name: ${current.firstName} ${current.lastName}",
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,

              ),
              AppText(
                text: "Email: ${current.email}",
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              AppText(
                text: "Phone: ${current.phone}",
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              AppText(
                text: "Birthday: ${current.birthDate}",
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              AppText(
                text: "Age: ${current.age}",
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              AppText(
                text: "BloodGroup: ${current.bloodGroup}",
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              AppText(
                text: "Height: ${current.height}",
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              AppText(
                text: "weight: ${current.weight}",
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        )
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_outlined),
        ),
      ],
    );
  }
}
