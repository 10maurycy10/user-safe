# user-safe

A work in progress program to run programs in unprivileged user.

# Why?

[![xkcd: Authorization](https://imgs.xkcd.com/comics/authorization_2x.png)](https://xkcd.com/1200/)

By default *all* programs have full access to all your files, gpg keys, emails, passwords, camera, microphone...

If someone exploits a bug in your web browser or pdf viewer, they can get access to **everything**.

Idealy activitys should be isolated and not given access to files then dont need.
Nearly all unix like operating systems (Linux, Minix, BSDs) have a system to isolate proccesses: Users.

## side note

Some operating systems like (android) isolate *programs*, but this is not ideal to compartmentalize activity's.
