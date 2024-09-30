import 'package:appdev_no7/main.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyVocab'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;

                /* ทำการเช็คหรือส่งข้อมูลไปยัง API ที่นี่
                print('Username: $username, Password: $password');
              }, */

                // ตรวจสอบว่าข้อมูลล็อกอินถูกต้องหรือไม่
                if (username == 'user' && password == 'pass') {
                  // ล็อกอินสำเร็จ -> ไปยังหน้า Main
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainScaffold()),
                  );
                } else {
                  // ล็อกอินไม่สำเร็จ -> แสดงข้อความแจ้งเตือน
                  setState(() {});
                }
              },
              child: Text('Login'),
            ),

            SizedBox(height: 20),
            // เพิ่มปุ่ม Register
            TextButton(
              onPressed: () {
                // ฟังก์ชันที่ทำเมื่อกดปุ่ม Register
                // นำไปสู่หน้า Register (ถ้ามี) หรือแสดงข้อความ
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Navigate to Register Screen.')),
                );
              },
              child: Text('Don\'t have an account? Register here.'),
            ),
          ],
        ),
      ),
    );
  }
}
