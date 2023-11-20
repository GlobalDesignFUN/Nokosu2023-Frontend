import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
  late AppLocalizations locale;
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;
  String _selectedLanguage = 'English';
  String _profileName = 'guest'; // Default profile name
  TextEditingController _profileBioController = TextEditingController();

  Future<void> _getImage() async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _updateProfileImage(pickedFile);
  }

  void _updateProfileImage(XFile? pickedFile) {
    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      }
    });
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: DropdownButton<String>(
            value: _selectedLanguage,
            onChanged: (String? newValue) {
              setState(() {
                _selectedLanguage = newValue!;
              });
              Navigator.of(context).pop();
            },
            items: <String>['English', 'Japanese', 'Korean', 'Chinese']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _editProfile() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileEditPage(
          profileImage: _profileImage,
          profileName: _profileName,
          profileBio: _profileBioController.text,
        ),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        _profileImage = result['profileImage'];
        _profileName = result['profileName'];
        _profileBioController.text = result['profileBio'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
  onTap: _getImage,
  child: Container(
    width: 120,
    height: 120,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: const Color.fromARGB(255, 195, 217, 235), // bgBlueWhite に変更
    ),
           child: CircleAvatar(
              radius: 60,
              backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
              child: _profileImage == null
                  ? Icon(
                      Icons.camera_alt,
                      size: 40,
                    )
                  : null,
            ),
  ),
            ),
            SizedBox(height: 10),
            Text(
              _profileName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 160),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _SquareButton(
                  onPressed: _editProfile,
                  icon: Icons.person,
                  label: 'Edit Profile',
                ),
                _SquareButton(
                  onPressed: _showLanguageDialog,
                  icon: Icons.language,
                  label: 'Change Language',
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Language: $_selectedLanguage'),
            SizedBox(height: 20),
            _profileBioController.text.isEmpty
                ? Text('No Bio')
                : Text('Bio: ${_profileBioController.text}'),
          ],
        ),
      ),
    );
  }
}

class ProfileEditPage extends StatefulWidget {
  final File? profileImage;
  final String profileName;
  final String profileBio;

  ProfileEditPage({
    required this.profileImage,
    required this.profileName,
    required this.profileBio,
  });

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController _editNameController = TextEditingController();
  TextEditingController _editBioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _editNameController.text = widget.profileName;
    _editBioController.text = widget.profileBio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: widget.profileImage != null ? FileImage(widget.profileImage!) : null,
              child: widget.profileImage == null
                  ? Icon(
                      Icons.camera_alt,
                      size: 40,
                    )
                  : null,
            ),
            SizedBox(height: 10),
            Text(
              widget.profileName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _editNameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _editBioController,
              decoration: InputDecoration(labelText: 'Bio'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save edited profile information logic
                // You can save the edited profile image, name, and bio to a database or perform other actions.
                print('Edited Profile saved');

                Navigator.of(context).pop({
                  'profileImage': widget.profileImage, // You can replace this with the edited image if necessary
                  'profileName': _editNameController.text,
                  'profileBio': _editBioController.text,
                });
              },
              child: Text('Complete Editing'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SquareButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  const _SquareButton({
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.2,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 205, 227, 246),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // 影の位置を調整
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
