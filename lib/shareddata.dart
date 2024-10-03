import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDetails {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String studentsId = '1yRPk63zD3oNq8OXh6wJ';
  String adminId = 'LQphDobPX5fZHmGhVDGS';

  String? lastNameController = '';
  String? firstNameController = '';
  String? nationalityController = '';
  String? genderController = '';
  String? bloodGroupController = '';
  String? titleController = '';
  String? dobController = '';
  String? placeOfBirthController = '';
  String? stateOfBirthController = '';
  String? religionController = '';
  String? heightController = '';
  String? weightController = '';
  String? motherTongueController = '';
  String? casteController = '';
  String? emailController = '';
  String? contactNum1Controller = '';
  String? contactNum2Controller = '';
  String? addressController = '';
  String? crtftsController = '';
  String? achmtsController = '';
  String? _thrsname = '';
  String? _profilePicUrl = '';

  // Initialize profile details
  Future<void> initializeProfile() async {
    await _loadthrsName();
    await _loadProfilePic();
    await _updateprofileinfo();
  }

  // Update profile information
  Future<void> _updateprofileinfo() async {
    await _loadBasicInfo();
    await _loadContactInfo();
    await _loadCertificatesInfo();
    await _loadAddressInfo();
    await _loadachivementsInfo();
    await _saveString();
  }

  // Load the teacher's name from Firestore
  Future<void> _loadthrsName() async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('profiledetails').doc(adminId).get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        _thrsname = data['username'] ?? 'No teacher name found';
        print('Teacher Name: $_thrsname');
      } else {
        print('Profile not found');
      }
    } catch (e) {
      print('Error occurred while loading teacher name: $e');
    }
  }

  // Load profile picture URL from Firestore
  Future<void> _loadProfilePic() async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('profiledetails').doc(studentsId).get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        _profilePicUrl = data['profilepic'] ?? '';
        print('Profile picture URL loaded successfully');
      } else {
        print('Profile not found');
      }
    } catch (e) {
      print('Error loading profile picture: $e');
    }
  }

  Future<void> _loadBasicInfo() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('profiledetails')
          .doc(studentsId)
          .collection('basicinfo')
          .doc(studentsId)
          .get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        lastNameController = data['lastname'] ?? '';
        firstNameController = data['firstname'] ?? '';
        nationalityController = data['nationality'] ?? '';
        genderController = data['gender'] ?? '';
        bloodGroupController = data['bloodgroup'] ?? '';
        titleController = data['title'] ?? '';
        dobController = data['dob'] ?? '';
        placeOfBirthController = data['placebirth'] ?? '';
        stateOfBirthController = data['statebirth'] ?? '';
        religionController = data['religion'] ?? '';
        heightController = data['height'] ?? '';
        weightController = data['weight'] ?? '';
        motherTongueController = data['mothertongue'] ?? '';
        casteController = data['caste'] ?? '';
        print('basicinfo URL loaded successfully');
        print('lastname  $lastNameController');
        print('firstname  $firstNameController');
        print('nationality  $nationalityController');
        print('gender  $genderController');
        print('bloodgroup  $bloodGroupController');
        print('title  $titleController');
        print('dob  $dobController');
        print('placebirth  $placeOfBirthController');
        print('statebirth  $stateOfBirthController');
        print('religion  $religionController');
        print('height  $heightController');
        print('weight  $weightController');
        print('mothertongue  $motherTongueController');
        print('caste  $casteController');
      } else {
        print('basicinfo not found');
      }
    } catch (e) {
      print('Error loading basicinfo: $e');
    }
  }

  Future<void> _loadContactInfo() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('profiledetails')
          .doc(studentsId)
          .collection('contactinfo')
          .doc(studentsId)
          .get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        emailController = data['email'] ?? '';
        contactNum1Controller = data['contact 1'] ?? '';
        contactNum2Controller = data['contact 2'] ?? '';
        print('contactinfo URL loaded successfully');
        print('email  $emailController');
        print('contact 1  $contactNum1Controller');
        print('contact 2  $contactNum2Controller');
      } else {
        print('contactinfo not found');
      }
    } catch (e) {
      print('Error loading contactinfo: $e');
    }
  }

  Future<void> _loadCertificatesInfo() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('profiledetails')
          .doc(studentsId)
          .collection('certificates')
          .doc(studentsId)
          .get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        crtftsController = data['certificates'] ?? '';
        print('certificates URL loaded successfully');
        print("certificates  $crtftsController");
      } else {
        print('certificates not found');
      }
    } catch (e) {
      print('Error loading certificates: $e');
    }
  }

  Future<void> _loadAddressInfo() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('profiledetails')
          .doc(studentsId)
          .collection('address')
          .doc(studentsId)
          .get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        addressController = data['address'] ?? '';
        print('addressinfo URL loaded successfully');
        print("address  $addressController");
      } else {
        print('addressinfo not found');
      }
    } catch (e) {
      print('Error loading addressinfo: $e');
    }
  }

  Future<void> _loadachivementsInfo() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('profiledetails')
          .doc(studentsId)
          .collection('achievements')
          .doc(studentsId)
          .get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        achmtsController = data['achievements'] ?? '';
        print('achivements URL loaded successfully');
        print("achivements  $achmtsController");
      } else {
        print('achivements not found');
      }
    } catch (e) {
      print('Error loading achivements: $e');
    }
  }

  // Save profile information to SharedPreferences
  Future<void> _saveString() async {
    SharedPreferences shareddata1 = await SharedPreferences.getInstance();
    shareddata1.setString('nationality', nationalityController!);
    shareddata1.setString('firstname', firstNameController!);
    shareddata1.setString('lastname', lastNameController!);
    shareddata1.setString('gender', genderController!);
    shareddata1.setString('bloodgroup', bloodGroupController!);
    shareddata1.setString('title', titleController!);
    shareddata1.setString('dob', dobController!);
    shareddata1.setString('placebirth', placeOfBirthController!);
    shareddata1.setString('statebirth', stateOfBirthController!);
    shareddata1.setString('religion', religionController!);
    shareddata1.setString('height', heightController!);
    shareddata1.setString('weight', weightController!);
    shareddata1.setString('mothertongue', motherTongueController!);
    shareddata1.setString('caste', casteController!);
    shareddata1.setString('email', emailController!);
    shareddata1.setString('contact 1', contactNum1Controller!);
    shareddata1.setString('contact 2', contactNum2Controller!);
    shareddata1.setString('address', addressController!);
    shareddata1.setString('certificates', crtftsController!);
    shareddata1.setString('achievements', achmtsController!);
    shareddata1.setString('thrsname', _thrsname!);
    shareddata1.setString('profilepic', _profilePicUrl!);
    print('Profile information saved to SharedPreferences');
  }
}
