import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6B3FA0),
              Color(0xFF4A1E7C),
              Color(0xFF2D1152),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    Spacer(),
                  ],
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          'Enter to win the Oraimo\nOpenSnap!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 40),
                      
                      // Earbuds Image with Platform
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Light rays background
                          Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  Colors.white.withValues(alpha: 0.1),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          
                          Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha:0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset('assets/images/earpod.png',
                                width: 180,
                                height: 180,
                                )
                              ),
                              
                              SizedBox(height: 16),
                              
                              Container(
                                width: 150,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFF7C3FA0),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 40),

                      Text(
                        'DRAW ENDS IN',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha:0.7),
                          fontSize: 12,
                          letterSpacing: 1.5,
                        ),
                      ),
                      
                      SizedBox(height: 12),
                      
                      // Countdown Timer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildTimeUnit('03', 'Days'),
                          _buildTimeSeparator(),
                          _buildTimeUnit('24', 'Hours'),
                          _buildTimeSeparator(),
                          _buildTimeUnit('00', 'Mins'),
                          _buildTimeSeparator(),
                          _buildTimeUnit('00', 'Secs'),
                        ],
                      ),
                      
                      SizedBox(height: 20),
                      
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha:0.1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          '4,327 USERS HAVE ENTERED SO FAR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 24),
                      
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Color(0xFF3D2163),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withValues(alpha:0.1),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xFF7C3FA0),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset('assets/images/speaker.png')
                            ),
                            
                            SizedBox(height: 16),
                            
                            Text(
                              'QUALIFICATION RULE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            
                            SizedBox(height: 8),
                            
                            Text(
                              'Invite at least 2 friends who sign up\nthrough your link to qualify.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha:0.8),
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                            
                            SizedBox(height: 24),
                            
                            
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha:0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Color(0xFF2D1152),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 32,
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.group_add, size: 20),
                                        SizedBox(width: 8),
                                        Text(
                                          'Invite Friends Now',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  SizedBox(height: 20),
                                  
                                                             
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.white.withValues(alpha:0.2),
                                        child: Image.asset('assets/images/avatar.png')
                                      ),
                                      SizedBox(width: 12),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.white.withValues(alpha:0.2),
                                        child: Icon(
                                          Icons.person_outline,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  
                                  SizedBox(height: 12),
                                  
                                  Text(
                                    'Once your second friend joins, you\'re\nautomatically entered.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha:0.5),
                                      fontSize: 12,
                                      height: 1.4,
                                    ),
                                  ),
                                  
                                  SizedBox(height: 24),
                                  
                                  Text(
                                    'Invite your friends quick & easy.',
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.9),
                                      fontSize: 14,
                                    ),
                                  ),
                                  
                                  SizedBox(height: 12),
                                  
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha:0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'https://Bravoo.ref12419',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        IconButton(
                                          icon: Icon(Icons.copy),
                                          color: Colors.white,
                                          iconSize: 16,
                                          onPressed: () {
                                            final text = "https://Bravoo.ref12419";
                                              Clipboard.setData(ClipboardData(text: text));
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                  content: Text('Copied to clipboard!'),
                                                  duration: Duration(seconds: 1),
                                                ),
                                              );
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  SizedBox(height: 20),
                                  
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _buildSocialButton(
                                        Image.asset('assets/images/whatsapp.png'),
                                        'Whatsapp',
                                        Color(0xFF25D366),
                                      ),
                                      SizedBox(width: 8),
                                      _buildSocialButton(
                                        Image.asset('assets/images/x.png'),
                                        'X (Twitter)',
                                        Color(0xFF1DA1F2),
                                      ),
                                      SizedBox(width: 8),
                                      _buildSocialButton(
                                        Image.asset('assets/images/linkedin.png'),
                                        'LinkedIn',
                                        Color(0xFF0077B5),
                                      ),
                                    ],
                                  ),
                                  
                                  SizedBox(height: 24),
                                  
                                  // Referral Count
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha:0.1),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'You referred',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        SizedBox(width: 99),
                                        Icon(
                                          Icons.people,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeUnit(String value, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: Color(0xFF3D2163),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha:0.7),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        ':',
        style: TextStyle(
          color: Colors.white.withValues(alpha:0.7),
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSocialButton(dynamic icon, String label, Color color) {
    return Container(
      width: 80,
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha:0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha:0.3),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 6,),
          icon,
          SizedBox(height: 18),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}