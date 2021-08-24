## Environment Setup 
### Robot Framework setup with Pycharm ###
1. **Install python for windows**
  I have used python v3.9.6 from https://www.python.org/downloads/
2. **Install pycharm community edition from** https://www.jetbrains.com/pycharm/download/#section=windows
3. **Install intellibot plugin in pycharm** to enable support for robot framework and keyword highlighting
4. Create a new project with **virtual environment(venv)** in pycharm 
5. Install all libraries viz; **AppiumLibrary , Selenium2Library & robotframework-pythoncore** from venv:
   e.g  C:\Users\RAVI RAI\PycharmProjects\pythonProject>pip install robotframework-appiumlibrary

### Android SDK Setup ###
1. **Install Android studio** from https://developer.android.com/studio
2. Set ANDROID_HOME in your environment variable for /path/to/Android Studio/android-sdk
3. Set %ANDROID_HOME%/bin; Set %ANDROID_HOME%/platform-tools & %ANDROID_HOME%/tools in Path under Environment Variables to enable adb & uiautomatorviewer commands.
4. Enable developer tools option in your physical device by clicking on build number 6-7 times.
5. Enable USB debugging option under Developer Options and accept trust device prompt
6. Run adb devices command to get the UID of your android phone.

## Execution ##
1. Create *.robot file to start writing test cases with robot keywords and execute test case using:
 e.g. robot -d Output --loglevel TRACE .\testSelenium\sample.robot

