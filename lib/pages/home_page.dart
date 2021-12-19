import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:office_app/data/model.dart';
import 'package:office_app/pages/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Сотрудники",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 42,
              margin: const EdgeInsets.only(bottom: 16),
              child: CupertinoSearchTextField(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
              ),
            ),
            const Text(
              "У кого сегодня день рождения",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 23),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: getEmployees().length,
                    itemBuilder: (context, index) {
                      Employee? employee = getEmployees()[index];
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(
                                      name: employee.name,
                                      position: employee.position,
                                      direction: employee.direction,
                                      department: employee.department,
                                      email: employee.email,
                                      birthDate: employee.birthDate,
                                      primaryPhoneNumber:
                                          employee.primaryPhoneNumber,
                                      officeNumber: employee.officeNumber,
                                      whatsAppNumber: employee.whatsAppNumber,
                                      profileImage: employee.profileImage,
                                    ))),
                        child: Container(
                          margin: const EdgeInsets.only(left: 9),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage(employee.profileImage ?? ""))),
                        ),
                      );
                    })),
            const Text(
              "У кого завтра день рождения",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 23),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Container(
                    margin: const EdgeInsets.only(left: 9),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/stalin.jpeg"))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 9),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/hitler.jpeg"))),
                  ),
                ])),
            const Text(
              "Все сотрудники",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Employee? employee = getEmployees()[index];
                  return ListTile(
                    onTap: () => _settingModalBottomSheet(
                        context,
                        employee.name,
                        employee.primaryPhoneNumber,
                        employee.officeNumber,
                        employee.whatsAppNumber),
                    tileColor: Colors.white,
                    contentPadding: const EdgeInsets.all(11),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    leading: CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage(employee.profileImage ?? ""),
                    ),
                    title: Text(
                      employee.name ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    trailing: const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                itemCount: getEmployees().length)
          ],
        ),
      ),
    );
  }
}

void _settingModalBottomSheet(context, String? name, String? primaryPhoneNumber,
    String? officeNumber, String? whatsAppNumber) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      backgroundColor: Colors.white,
      builder: (BuildContext bc) {
        return Container(
            padding: const EdgeInsets.all(20),
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text(
                    "Позвонить",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  subtitle: Text(
                    name ?? "",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  trailing: const Icon(Icons.cancel),
                ),
                ListTile(
                  onTap: () => _callNumber(primaryPhoneNumber),
                  title: const Text(
                    "Телефон основной",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    primaryPhoneNumber ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                ),
                ListTile(
                  onTap: () => _callNumber(officeNumber),
                  title: const Text(
                    "Телефон рабочий",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    officeNumber ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                ),
                ListTile(
                  onTap: () => _callNumber(whatsAppNumber),
                  title: const Text(
                    "Телефон What's app",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  subtitle: Text(
                    whatsAppNumber ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                ),
              ],
            ));
      });
}

_callNumber(String? number) async {
  bool? res = await FlutterPhoneDirectCaller.callNumber(number ?? "");
}

List<Employee> getEmployees() {
  List<Employee> employees = [];
  employees.add(Employee(
      "Жапаров Садыр Нуркожоевич",
      "Президент Кыргызской Республики",
      "Администрация Президента КР",
      "Отдел Управления",
      "sadyrpresident@gmail.com",
      "12.12.1912",
      "+996555555555",
      "+996777777777",
      "+996505050505",
      "assets/images/sadyr.jpeg"));
  employees.add(Employee(
      'Carl "CJ" Johnson',
      "The underboss of the Grove Street Families",
      "Grove Street Families",
      "Grove Street",
      "cj@gmail.com",
      "23.06.1988",
      "+996704684871",
      "996704684871",
      "996704684871",
      "assets/images/cj.jpg"));
  employees.add(Employee(
      "Владимир Владимирович Путин",
      "President of Russian Federation",
      "Russian Federation Goverment",
      "Administration",
      "putin@gmail.com",
      "32.13.2022",
      "+7345345435",
      "+7123123332",
      "+76567656765",
      "assets/images/putin.jpeg"));
  employees.add(Employee(
      'Абдылдаев "Зима не будет" Арстан',
      "Председатель политической партии Эл учун",
      "Жогорку Кенеш",
      "Депутат",
      "arstanalai@gmail.com",
      "28.04.1968",
      "+996700007140",
      "+996554450011",
      "+996708234234",
      "assets/images/abdyldaev.jpeg"));
  employees.add(Employee(
      "Barack Hussein Obama II",
      "the 44th president of the United States",
      "U.S. goverment",
      "Democratic party",
      "blackObama@gmail.com",
      "04.08.1961",
      "+234234234",
      "+3423424234",
      "+23421342123",
      "assets/images/obama.jpeg"));
  employees.add(Employee(
      "Мотуев Аманканович Нурлан",
      "глава Народно-патриотического движения «Жоомарт»",
      "Политика",
      "Независимое движение",
      "motuev@gmail.com",
      "10.12.1969",
      "+996553567894",
      "+996708123456",
      "+996553053585",
      "assets/images/motuev.jpeg"));
  return employees;
}
