# INTRODUCTION:
Borg is a backup tool and requires a remote server with ssh access.

# OVERVIEW:
To get everything working you'll need to follow this outline of steps:

 0. Ensure client has authorization to your server
 1. Create an initial borg repo on your server
 2. Setup the borgconfig-template file and copy to ~/.borgconfig
 3. Configure a local SMTP service for e-mailing reports
 4. (MAC) Create a borgbackup.app wrapper application
 5a. (MAC) Update borgbackup.plist path and install to ~/Library/LaunchdAgents
 5b. (LINUX) Setup a cron entry to periodically run the borgbackup.sh script


# STEP DETAILS

## STEP 0

Check the ~backup/.ssh/authorized_keys file to verify client authorization

## STEP 1

Confirm your hostname is setup correctly with

    $ hostname -s

If that value is not correct in Mac, check the following values:

    sudo scutil --get ComputerName
    sudo scutil --get HostName
    sudo scutil --get LocalHostName

Follow the setup instructions in borgbackup.sh

## STEP 2

Given the pasphrase generated during `borg init`, create and update the
~/.borgconfig file.

Create a new dotfiles/borg/borgignore-<HOSTNAME> file if needed.

After `borg init`, create the repo and verify there were no errors.

    ./borgbackup.sh

## STEP 3 - Mac OS Postfix Setup:

Create /etc/postfix/sasl_passwd and with the line:

    [smtp.gmail.com]:587 EMAIL@gmail.com:PASSPHRASE

Where:
    EMAIL = your gmail account
    PASSPHRASE = a 2FA token created using "App Passwords" from
                 https://myaccount.google.com/security

Finally run the command:

    $ sudo postmap /etc/postfix/sasl_passwd

Edit /etc/postfix/main.cf ... add the lines to the end:

NOTE: You can change HOSTNAME if you want, but it will work with any value.

    # Relay Host Setup
    myhostname = HOSTNAME.localdomain
    relayhost = [smtp.gmail.com]:587
    smtp_sasl_auth_enable = yes
    smtp_sasl_mechanism_filter = AUTH LOGIN
    smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
    smtp_sasl_security_options =
    smtp_tls_security_level = encrypt
    smtp_use_tls = yes

Restart Postfix and test:

    $ sudo postfix stop && sudo postfix start
    $ date | mail -s test EMAIL@gmail.com


## STEP 4 - borgbackup.app

For Mac you need to create a simple wrapper app to bypass the platform security. Use automator.app
to do this.

* Open `./borgbackup.app` in Mac's automator.app
* Edit the script to match your system.
* Export the worflow as an "Application" to /Applicaitons/borgbackup.app
* Open "System Preferences --> Privacy and Security --> Full Disk Access (FDA)".
* Unlock the tool in the bottom left, and make sure `borgbackup.app` is checked.

You can now test the app by running:

    $ open /Applications/borgbackup.app


## STEP 5a - Mac Launchd Service

You want to periodically run the backup application.

1. Copy `borgbackup.plist` to `~/Library/LaunchAgents`
2. You can now load and start the agent:

        $ launchctl load ~/Library/LaunchAgents/borgbackup.plist
        $ launchctl start ~/Library/LaunchAgents/borgbackup.plist
