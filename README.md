# vlc-ip-camera-recorder
ضبط تصویر دوربین مداربسته با نرم افزار vlc
این برنامه با استفاده از پخش کننده فیلم vlc، تصویر دوربین مداربسته را در هارددیسک رایانه ضبط می کند.

این نرم افزار فقط روی سیستم عامل ویندوز اجرا میشود.


# شروع ضبط برنامه
برای شروع ضبط فایل StartRecording.bat را اجرا کنید.

# توقف ضبط دوربین
برای توقف ضبط فیلم دوربین فایل StopRecording.bat را اجرا نمایید.

# تنظیمات برنامه (مهم)
»همترین تنظیم برای اجرای برنامه وارد کردن لینک rtsp دوربین مداربسته است.
فایل StartRecording.bat را با یک ویرایشگر متنی ماننده notepad باز کنید.


لینک rtsp دوربین را در متغیر زیر قرار دهید:
- REM //CAM RTSP STREAMS
- SET cam1_rtsp=rtsp://admin:111111@qQ@192.168.100.121:554/media/video1

به صورت پیش فرض فیلم در درایو E رایانه ذخیره میشود. برای تغییر این تنظیم متغیر زیر را ویرایش کنید:
- SET cctvroot=E:

به عنوان مثال، برای ذخیره فیلم در درایو D ، متغیر را به این صورت تغییر دهید:
- SET cctvroot=D:

شما می توانید پوشه ذخیره فیلم را نام گذاری کنید، برای این کار متغیر زیر را تغییر دهید. حتما از حروف انگلیسی و بدون فاصله استفاده شود:
- REM //CAM NAMES
- SET cam1_name=FRONTLEFT

## Authors

- [@intellsoft](https://intellsoft.ir/)
- Contact me on element messanger: [@intellsoft:matrix.org](https://matrix.to/#/@intellsoft:matrix.org)

