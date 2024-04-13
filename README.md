gmailassassin
=============

Run SpamAssassin on your Gmail inbox. Move spam to Gmail spam folder.


Setup
=====

Install imapfilter & spamassassin.

Set up an app password on your Gmail account - https://support.google.com/mail/answer/185833?hl=en-GB

Create ~/.private/imapfilter/gmailcreds.lua like so:

    gmaccount = IMAP {
       server = 'imap.gmail.com',
       username = 'youremail@gmail.com',
       password = 'yourapppassword',
       ssl = 'tls13'
    }

If you don't want to run the spamassassin daemon (spamd), change spamc to spamassassin in gmailass.lua.

Usage
=====

Run imapfilter -c gmailass.lua. Maybe schedule it in cron.

