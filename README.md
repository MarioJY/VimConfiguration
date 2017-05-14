### Frist
### Second

It is a problem that appeared when I first updated to macOS Sierra yesterday.

GDB itself is running OK. However, somehow, it cannot run my program. When I type 'run' and 'enter', it immediately crashes with the information: During startup program terminated with signal SIG113, Real-time event 113.

My GDB is based on homebrew. So today, I uninstalled the whole homebrew package and reinstalled it. After the codesign step, I still faced the same error.

I tried 'sudo' and a few other things. Google had no idea what happened. So I was wondering if you guys might have some magical solution.

This is how I easily fixed the issue. [Update: based on feedback received and yet to be verified, it seems that this solution works with macOS Sierra 10.12 but not with macOS Sierra 10.12.2]

See video instructions here

Quit gdb
Using your text editor e.g. Sublime Text, save a file called “.gdbinit” [Exclude the quotation marks] in your user folder.
In the file add the following: “set startup-with-shell off” [Exclude the quotation marks]
Save the file
gdb should now work
Sources

https://discussions.apple.com/thread/7684629?start=0&tstart=0

Where is .gdbinit is located and how can I edit it?

https://sourceware.org/gdb/onlinedocs/gdb/Starting.html
