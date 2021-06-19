@echo off
echo Remove the existing auto-generated source files...
del ..\..\..\src\common\api_info_auto.cpp
del ..\..\..\src\dispatch\eglproc_auto.hpp
del ..\..\..\src\dispatch\eglproc_auto.cpp
del ..\..\..\src\retracer\retrace_gles_auto.cpp
del ..\..\..\src\specs\khronos_enums.hpp

echo Auto-generate the retrace code...
pushd ..\..\..\src\common && python api_info.py && popd
pushd ..\..\..\src\common && python call_parser.py && popd
pushd ..\..\..\src\dispatch && python eglproc.py && popd
pushd ..\..\..\src\retracer && python retrace.py && popd
pushd ..\..\..\src\specs\ && python glxml_header.py && popd
pushd ..\..\..\src\tracer && python trace.py && popd

echo Generate C header for NativeAPI.java
set ANDROID_JAR=%ANDROID_HOME%\platforms\android-%1\android.jar
"%JAVA_HOME%\bin\javac" -classpath %ANDROID_JAR% ./src/com/arm/pa/paretrace/NativeAPI.java
"%JAVA_HOME%\bin\javah" -d jni -classpath %ANDROID_JAR%;src com.arm.pa.paretrace.NativeAPI