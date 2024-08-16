// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api

import 'package:chatapp/Pages/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Services/auth_service.dart';
import 'package:chatapp/Services/chat_service.dart';
import 'package:chatapp/Components/user_tile.dart';
import 'package:chatapp/Pages/chatpage.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return const AppPageMobile();
        } else {
          return const AppPageDesktop();
        }
      },
    );
  }
}

class AppPageMobile extends StatefulWidget {
  const AppPageMobile({super.key});

  @override
  State<AppPageMobile> createState() => _AppPageMobileState();
}

class _AppPageMobileState extends State<AppPageMobile> {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logout() {
    final _auth = AuthService();
    _auth.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      drawer: const SideMenu(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Chatpage(
                receiverEmail: userData["email"],
                receiverId: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}

class AppPageDesktop extends StatefulWidget {
  const AppPageDesktop({super.key});

  @override
  _AppPageDesktopState createState() => _AppPageDesktopState();
}

class _AppPageDesktopState extends State<AppPageDesktop> {
  // Replace with your service classes
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logout() {
    final _auth = AuthService();
    _auth.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        // SideMenu takes up fixed width
        /*
        const Expanded(
          flex: 1,
          child: SideMenu(),
        ),
        */
        // Main content area
        Expanded(
          flex: 4,
          child: _buildUserList(),
        ),
      ],
    ));
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
  // Check if the user's email is not the same as the current user's email
  if (userData["email"] != _authService.getCurrentUser()!.email) {
    // Extract the username from the email
    String username = _extractUsername(userData["email"]);
    
    return UserTile(
      text: username, // Use the extracted username instead of the full email
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chatpage(
              receiverEmail: userData["email"],
              receiverId: userData["uid"],
            ),
          ),
        );
      },
    );
  } else {
    return Container();
  }
}

// Function to extract username from email
String _extractUsername(String email) {
  return email.split('@')[0];
}
  }

