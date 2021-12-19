import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Profile extends StatelessWidget {
  const Profile(
      {Key? key,
      this.name,
      this.position,
      this.direction,
      this.department,
      this.email,
      this.birthDate,
      this.primaryPhoneNumber,
      this.officeNumber,
      this.whatsAppNumber,
      this.profileImage})
      : super(key: key);
  final String? name;
  final String? position;
  final String? direction;
  final String? department;
  final String? email;
  final String? birthDate;
  final String? primaryPhoneNumber;
  final String? officeNumber;
  final String? whatsAppNumber;
  final String? profileImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        automaticallyImplyLeading: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  height: 114,
                  width: 114,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(profileImage ?? ""))),
                ),
                Text(
                  name ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  position ?? "",
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 40,
                ),
              ]),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Направление",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey),
              ),
              Text(
                direction ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(),
              const Text(
                "Отдел",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey),
              ),
              Text(
                department ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(),
              const Text(
                "Email",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey),
              ),
              Text(
                email ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(),
              const Text(
                "Дата рождения",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey),
              ),
              Text(
                birthDate ?? "xx.xx.xx",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(),
              const Text(
                "Телефон основной",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey),
              ),
              Text(
                primaryPhoneNumber ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(),
              const Text(
                "Телефон рабочий",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey),
              ),
              Text(
                officeNumber ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(),
              const Text(
                "Телефон What's app",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey),
              ),
              Text(
                whatsAppNumber ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(),
            ],
          ),
        )
      ]),
    );
  }
}
