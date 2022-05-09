set my_path=C:\Users\miki\Michele\APK

set nome=Workplace_365.0.0.30.112-367653625
rem set classes=classes4 classes3 classes2 etc... lista delle classi
set classes=%*

for %%a in (%classes%) do (if %%a==classes (java -Xmx3000m -jar %my_path%\smali-2.5.2.jar ass %my_path%\apks_d\%nome%\smali -o %my_path%\apks_d\%nome%\%%a.dex) else (java -Xmx3000m -jar %my_path%\smali-2.5.2.jar ass %my_path%\apks_d\%nome%\smali_%%a -o %my_path%\apks_d\%nome%\%%a.dex))

if not exist %my_path%\apks_s\NUL mkdir %my_path%\apks_s\

COPY "%my_path%\apks\%nome%.apk" "%my_path%\apks_s\toalign%nome%.apk" /Y

for %%a in (%classes%) do 7za.exe a -tzip %my_path%\apks_s\toalign%nome%.apk %my_path%\apks_d\%nome%\%%a.dex 

%my_path%\zipalign.exe -p -f 4 %my_path%\apks_s\toalign%nome%.apk %my_path%\apks_s\zipaligned%nome%.apk

del %my_path%\apks_s\toalign%nome%.apk

java -Xmx1024m -jar %my_path%\apksigner.jar sign --ks %my_path%\"your keystore".jks --ks-pass pass:"your passwd here" --in %my_path%\apks_s\zipaligned%nome%.apk --out %my_path%\apks_s\signed%nome%.apk

del %my_path%\apks_s\zipaligned%nome%.apk
del %my_path%\apks_s\signed%nome%.apk.idsig

adb.exe install -r %my_path%\apks_s\signed%nome%.apk
