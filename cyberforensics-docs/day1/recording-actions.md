# Recording Actions

When you interact with a file, several timestamps can be affected.  These timestamps are metadata attributes associated with the file and are updated by the operating system.  The specific behavior can vary slightly depending on the file system (e.g., NTFS, FAT32, ext4) and the operating system (e.g., Windows, macOS, Linux), but the general principles remain consistent.

Here's a breakdown of the common timestamps and how they are affected by file operations:

* **Creation Time (or Birth Time):**

    * **Creation:**  This timestamp is set when the file is initially created.

    * **Modification:**  Generally *not* changed by file modifications.

    * **Access:** *Not* changed by simply accessing the file.

    * **Copying:**  A *new* creation time is assigned to the copied file.

    * **Moving (within the same volume):**  Usually *preserved* in modern file systems.  Older systems might update it.

    * **Moving (across volumes):** Acts like a copy operation; the creation time on the destination is *new*.

* **Modification Time (or Last Write Time):**

    * **Creation:** Set to the same time as the creation time.

    * **Modification:** Updated whenever the file's *content* is changed (e.g., editing a document, saving changes).

    * **Access:** *Not* changed by simply accessing the file.

    * **Copying:** A *new* modification time is assigned reflecting the time of the copy operation.

    * **Moving (within the same volume):** Usually *preserved* in modern file systems.

    * **Moving (across volumes):**  Acts like a copy; the modification time on the destination is *new*.

* **Last Access Time (or Access Time):**

    * **Creation:** Set to the same time as the creation and modification times.

    * **Modification:**  *Can be updated* depending on the file system and how the modification occurs.  Often updated on Windows file systems. Less frequently updated on macOS and Linux for performance reasons.

    * **Access:**  Updated whenever the file is accessed (e.g., opening, reading, executing).

    * **Copying:** A *new* access time is assigned reflecting the time of the copy operation.

    * **Moving (within the same volume):** Usually *preserved* in modern file systems.

    * **Moving (across volumes):** Acts like a copy; the access time on the destination is *new*.

* **Change Time (or Metadata Change Time - usually NTFS):**

    * **Creation:** Set to the same time as the creation, modification, and access times.

    * **Modification:**  *Not* changed by content modification.

    * **Access:**  *Not* changed by simply accessing the file.

    * **Copying:** A *new* change time is assigned.

    * **Moving:**  Updated to reflect the time of the move operation.

    * **Metadata Changes:**  This timestamp is updated whenever metadata attributes of the file are changed (e.g., changing file permissions, renaming the file, changing extended attributes).


**Important Considerations:**

* **Timestamps are stored in UTC:**  Timestamps are typically stored internally as Coordinated Universal Time (UTC).  When displayed, they are converted to the local time zone.

* **Precision of Timestamps:** The granularity or precision of timestamps can vary depending on the file system.  Some might store timestamps to the nearest second, while others might have millisecond or even nanosecond precision.

* **Anti-Forensics Techniques:**  Attackers might attempt to manipulate timestamps to cover their tracks.  Forensic investigators are aware of these techniques and use various methods to detect timestamp manipulation.

* **Journaling File Systems:**  File systems with journaling capabilities may provide additional timestamp information related to journal entries, which can be valuable in forensic investigations.


Understanding how file timestamps are affected by various operations is crucial for digital forensics and incident response. By analyzing these timestamps, investigators can reconstruct the sequence of events and gain valuable insights into user activity and system changes.
