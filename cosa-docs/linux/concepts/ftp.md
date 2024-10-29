# FTP

When configuring an FTP server using vsftpd, user verification and access control are managed through several mechanisms, particularly the **user list** and **chroot list**. Understanding how these lists interact is crucial for effective server management.

## User Verification in vsftpd

1. **User List**: The user_list file contains usernames that can either be allowed or denied access based on the userlist_deny setting. If userlist_deny=NO, only users listed in this file are permitted to log in. Conversely, if set to YES, users in the list are denied access entirely. This file is typically located at /etc/vsftpd.userlist.

2. **Chroot List**: The chroot_list file specifies users who should not be chrooted to their home directories when they log in. If chroot_local_user=YES, the users listed in the chroot_list will have unrestricted access to the filesystem outside their home directory, which can pose security risks. This list is typically found at /etc/vsftpd.chroot_list.

## Interaction Between Lists

- If a user, such as **reva**, is included in the chroot_list but not in the user_list, their ability to log in depends on the userlist_deny directive:
  - If `userlist_deny=NO`, **reva** can log in but will be chrooted to their home directory.
  - If `userlist_deny=YES`, **reva** will be denied access entirely, regardless of their presence in the `chroot_list`.

- The critical difference lies in the permissions and restrictions applied:
  - **Users in `user_list`**: They are explicitly allowed or denied access based on the configuration.
  - **Users in `chroot_list`**: They may have broader access privileges if not controlled by the user list, which can lead to potential security vulnerabilities if not managed correctly.

## Summary

In summary, placing a user like **reva** in the `chroot_list` without including them in the `user_list` means they may have a chance to log in (if userlist_deny is set to NO), but they might not have restricted access as intended unless additional configurations are applied. Properly managing these lists is essential for maintaining both accessibility and security on your FTP server.
