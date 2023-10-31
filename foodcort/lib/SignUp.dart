import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodcort/SignIn.dart';
import 'package:foodcort/validationfile.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUPPage extends StatefulWidget {
  const SignUPPage({super.key});
  static const String pageName='/SignUPPage';

  @override
  State<SignUPPage> createState() => _SignUPPageState();
}

class _SignUPPageState extends State<SignUPPage> {
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
late  TextEditingController usernameController,emailController,passwordController;
  double radius=27;
  @override
  void initState() {
    super.initState();
    usernameController=TextEditingController();
    passwordController=TextEditingController();
    emailController=TextEditingController();
  }
  @override
  void dispose() {
 usernameController.dispose();
 passwordController.dispose();
 emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.sizeOf(context);
    final height=size.height;
    final width=size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color:Colors.black,
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                   color: Colors.black,
                   child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:6,bottom: 8),
                        child: Text('(WEL-COME TO FOOD CORT)',
          
                        style: TextStyle(color: Color.fromARGB(255, 240, 251, 253),
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17,right: 4),
                        child: Text('Need some help?',
                        style: TextStyle(color: Colors.white),),
                      )
                    ],
                   )  ),
                  ),
                Expanded(flex: 9,
                child:Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                
                    borderRadius: 
                    BorderRadius.only(
                      topLeft: Radius.circular(52),
                      topRight: Radius.circular(52))
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            children: [
                              Spacer(flex: 1,),
                              Expanded(flex: 6,
                              child:Padding(
                                padding: const EdgeInsets.only(left: 18,top: 14),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Getting started',
                                  style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w800),),
                                ),
                              )),
                              Expanded(flex: 3,
                              child:Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: Text('Create account to continue!',
                                  style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                                ),
                              )),
                            ],
                          ),
                        )),
                        // first completed.......
                        Expanded(flex: 8,
                          child: Container(
                            child: Column(
                              children: [
                                Expanded(flex: 1,child:Row(
                                children: [
                                  Expanded(
                                           flex: 1,                        child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                       child:InkWell(
                                        onTap: () {
                                          signInWithGoogle();
                                        },
                                         child: ClipRRect(
                                          borderRadius: BorderRadius.circular(35),
                                           child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/google.png'),
                                                fit: BoxFit.fill
                                             ) ),
                                           ),
                                         ),
                                       )
                                    // CircleAvatar(
                                    //     backgroundImage: AssetImage('assets/images/google.png'),
                                    //     radius: radius,
                                    //   ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                         child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/facebook.png'),
                                              fit: BoxFit.fill
                                           ) ),
                                         ),
                                       )
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                         child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/twitter.png'),
                                              fit: BoxFit.fill
                                           ) ),
                                         ),
                                       )
                                    ),
                                  ),
                                  Spacer(flex: 2,)
                                ],  
                                ) ),
                                // text field started
                                Expanded(flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: emailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Email Address';
                                      } else if(!isValidEmail(value)){
                                        return 'Email is inValid';
                                      }
                                      else{

                                      }
                                    },
                                    decoration: InputDecoration(
                                      
                                      prefixIcon: Icon(Icons.email),
                                      hintText: "Enter e-mail",
                                      border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)
                                
                                      )
                                    ),
                                  ),
                                )),
                                Expanded(flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: usernameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter user name';
                                      } else if(!isValidUserName(value)){
                                        return 'username is inValid';
                                      }
                                      else{

                                      }
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person_add_alt_1_outlined,color: Colors.black,),
                                      hintText: "Enter username",
                                      border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)
                                      )
                                    ),
                                  ),
                                )),
                                Expanded(flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter password';
                                      } else if(!isValidPassword(value)){
                                        return 'inValid Password';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock_open,color: Colors.black,),
                                      hintText: "Enter password",
          
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color:Color.fromARGB(255, 206, 176, 8),
                                        strokeAlign: 2 ),
                                  borderRadius: BorderRadius.circular(25)
                                
                                      )
                                    ),
                                  ),
                                )),
                                Spacer(flex: 1,),
                                // text field completed.....
                               // Expanded(flex: 1,child: Align(alignment: Alignment.centerLeft,child: Text('Reminder me next time'))),
                                Expanded(flex: 2,child: Padding(
                                  padding: const EdgeInsets.only(left: 28,right: 28,bottom: 18,top:4),
                                  child: InkWell(
                                    onTap: () {
                                      if (_formkey.currentState!.validate()) {
                                        createAccountUsingPassword();
                                        Navigator.pushReplacementNamed(context,SignInPage.pageName);
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SignUp Successfully')));
                                      } else {
                                        
                                      }
                                     
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                      color: Color.fromARGB(231, 30, 30, 25),
                                                                
                                        borderRadius: BorderRadius.circular(55)
                                      ),
                                      child: Center(
                                        child: Text('SIGN UP',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),),
                                      ),
                                    ),
                                  ),
                                )),
                                //Spacer(flex: 1,),
                                //  sign up button....
                                Expanded(flex: 1,child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(context,SignInPage.pageName);
                                    },
                                    child: RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Already have an account?',
                                          style: TextStyle(color: Colors.black,fontSize: 15),
                                        ),
                                        TextSpan(
                                          onEnter: (event) {
                                            
                                          },
                                          text: 'Sign In',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 47, 21, 2),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                       
                                       
                                      ],
                                    ),
                                                                  ),
                                  ),
                                )
          )
                              ],
                            ),
                          )
                        ),
                    ],
                  ),
                ) )
              ],
            ),
          ),
        ),
      ),
    );
  }
  //methods.....
   void createAccountUsingPassword()async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email:emailController.text.trim() ,
    password: passwordController.text.trim(),
  );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  // Google SignIn

signInWithGoogle() async {
  try {
     // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
   await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  }
 
}
}