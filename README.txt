Download the official FTDI D2XX drivers for Windows 11 from FTDI's site:

  https://ftdichip.com/drivers/d2xx-drivers/

Both the X64 and ARM64 packages are required, as the resulting product is a
hybrid between the two. In short, the actual driver is taken from the ARM64
package, but the userspace interfaces are taken from the X64 package so that
Quartus can use them.

Once both packages are downloaded, run the build script as shown:

  $ make.sh <X64.zip> <ARM64.zip>

The build script expects a POSIX shell environment and `unzip` to be present.

After running, the patched driver will be available in `./build`. Copy this
folder onto a Windows machine, then manually install the drivers through the
context menu or main menu in Device Manager.

You can find pre-packaged drivers in "Releases" if you trust me.

This was last tested with FTDI driver versions 2.12.21 (X64) and 2.12.36.4
(ARM64) and is the recommended configuration since the X64 portions will match
what ships with Quartus (22.1.2) exactly.

Addons: After found this package on github I add re-package script make_x64.sh for windows 11 64-bit.
Run the build script as shown:
  $ make_x64.sh <X64.zip>

Important note: on Windows 11 you need to switch off certificate checking, for example run in admin console:

for switching off driver signatures:
    bcdedit.exe -set loadoptions DISABLE_INTEGRITY_CHECKS
    bcdedit.exe -set TESTSIGNING ON
    bcdedit.exe -set NOINTEGRITYCHECKS ON
    Shutdown -f -r -t 0

for switching on driver signatures:
    bcdedit.exe -set loadoptions ENABLE_INTEGRITY_CHECKS
    bcdedit.exe -set TESTSIGNING OFF
    bcdedit.exe -set NOINTEGRITYCHECKS OFF
