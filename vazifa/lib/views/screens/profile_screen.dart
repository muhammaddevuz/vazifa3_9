import 'package:flutter/material.dart';
import '../../utils/profile.dart';
import '../widgets/profile_edit_dialog.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 160,
                height: 160,
                child: Image.network(
                  Profile.imageAddress,
                  fit: BoxFit.cover,
                ),
              ),
              FloatingActionButton(
                onPressed: () async {
                  Map<String, dynamic>? data = await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (ctx) {
                        return const ProfileEditDialog();
                      });
                  if (data != null) {
                    Profile.name = data["name"];
                    Profile.surname = data["surname"];
                    Profile.phoneNummber = data["phoneNumber"];
                    setState(() {});
                  }
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "${Profile.surname} ${Profile.name}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Phone Number:"),
              SizedBox(
                width: 15,
              ),
              Text(
                Profile.phoneNummber,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}