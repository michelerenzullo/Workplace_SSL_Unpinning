# Workplace SSL Unpinning
Workplace SSL Pinning on Android  
(`ARM64`) Version **372.0.0.20.107-378066467** 
(`ARM`) Version **372.0.0.20.107-378066454**
(`x86`) Version **372.0.0.20.107-378066472**

**Do you like this project? Support it by donating**

- ![Paypal](https://raw.githubusercontent.com/reek/anti-adblock-killer/gh-pages/images/paypal.png) Paypal: [Donate](https://www.paypal.com/donate?hosted_button_id=XQ8QUEME5JZMN) or [paypal.me/michelerenzullo](https://paypal.me/michelerenzullo)
- ![btc](https://raw.githubusercontent.com/reek/anti-adblock-killer/gh-pages/images/bitcoin.png) Bitcoin: 1K9RF3s4aocmaRbh2Zu2FuHjrcg5BNeDxU

**Install**

Non-rooted devices, uninstall Workplace and Work Chat because the signature is different, install the patched Workplace app  
Rooted devices, just replace the patched lib in /data/data/com.facebook.work/lib-compressed/

**For devs** 

Due to the new obfuscation of "libs" archive:

- For arm64 it seems hardly obfuscated, I found a way to patch the bytes using RandomAccessFile in the source code:  
Read [this article](https://renzullomichele.medium.com/patch-encrypted-libraries-in-metas-apps-for-android-ad3dfd35db79) on Medium for more information about the process.

- For arm the archive is still obfuscated but less heavier therefore we can still find the bytes to patch, update it and the calculate the new SHA256 in metadata.txt

- For x86 the archive isn't obfuscated
