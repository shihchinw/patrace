Patrace
=======

PATrace is software for capturing GLES calls of an application and replaying them on a different device, keeping the GPU workload the same. It's similar to the open source Apitrace project, but optimised for performance measurements.

[Manual](patrace/doc/manual.md)

Building Retracer for Android on Windows
-------

This branch contains few modifications to build eglretracer from Android Studio project on windows:

1. Install [Android Studio](https://developer.android.com/studio)
2. Open Android Studio and install **NDK**
   1. Check **File > Settings**, then navigate to **Appearance & Behavior > System Settings > Android SDK**.
   2. Click the **SDK Tools** tab and select **Show Package Details** to display all the version available of the packages.
   3. Select **21.1.6352462** under NDK as your NDK version.
3. Install [Open JDK 8](https://jdk.java.net/java-se-ri/8-MR3)
4. Set two environment variables **NDK** and **JAVA_HOME** to corresponding installation folders
    ```
    set NDK=C:\android-sdk-windows\ndk\21.1.6352462
    set ANDROID_HOME=C:\android-sdk-windows
    set JAVA_HOME=C:\java-se-8u41-ri
    ```
5. Install [Python 3.x](https://www.python.org/downloads/windows/)
6. Configure source files
    ```
    python ./scripts/build.py patrace android release
    ```
7. Launch Android Studio from terminal shell (ensure we have identical config of environment variables for auto source file generation.)
8. Open **<repo_root>\patrace\project\android\eglretrace** in Android Studio
9. Click **Sync Project with Gradle Files** to sync your project.
10. Click **Build > Make Project**


Caveats
-------

PATrace cannot open trace files captured with the open source Apitrace.
