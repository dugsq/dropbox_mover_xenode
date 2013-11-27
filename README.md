dropbox-mover-xenode
====================

***Dropbox Mover Xenode*** monitors a specific file on Dropbox and moves it to another location on the same Dropbox. It leverages the "dropbox-sdk" RubyGem to perform the file move operation. 

###Config file options:###
* loop_delay: defines number of seconds the Xenode waits before running the Xenode process. Expects a float.  
* enabled: determines if the Xenode process is allowed to run. Expects true/false. 
* debug: enables extra debug messages in the log file. Expects true/false.
* move_from_path: specifies the source location of the file to move. Expects a string.
* move_to_path: specifies the target location of the file to move. Expects a string.
* named_file: specifies the file to move. Expects a string.
* access_token: specifies the application access token for your Dropbox account. Expects a string.

###Example Configuration File:###
```yaml
enabled: true
loop_delay: 60
debug: false
move_from_path: "/source"
move_to_path: "/target"
named_file: "hello.txt"
access_token: "1234567890abcdefg"
```

###Example Input:###
* The Dropbox Mover Xenode does not expect nor handle any input.  

###Example Output:###
* The Dropbox Mover Xenode does not generate any output. 
