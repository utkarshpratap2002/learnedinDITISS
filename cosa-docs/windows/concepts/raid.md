# RAID (Redundant Array of Independent Disk)

There are reasons why you would need RAID, it is for having redundency within your organisation, as **raid 5** or **raid 6** are the standards used within the organisations to store the backups and use them when needed. There are certain reasons why you would need **RAID**:

1. **Number of Drives**:  
   Different RAID levels have specific minimum drive requirements. The number of drives you add depends on the RAID level you're configuring. For example:
   - **RAID 0**: Requires at least 2 drives for striping, but offers no redundancy.
   - **RAID 1**: Requires at least 2 drives for mirroring.
   - **RAID 5**: Requires at least 3 drives for block-level striping with distributed parity.
   - **RAID 6**: Requires at least 4 drives, adding double distributed parity for better fault tolerance.
   - **RAID 10 (1+0)**: Requires at least 4 drives for combining mirroring and striping.

2. **Capacity Considerations**:  
   Adding hard disks increases the overall storage capacity of the RAID array. However, the actual usable storage space varies based on the RAID level:
   - **RAID 0**: Total usable space is the sum of all drives’ capacities.
   - **RAID 1**: Usable space is equal to the size of one drive, as data is mirrored.
   - **RAID 5**: Usable space is total capacity minus the equivalent of one drive’s capacity (for parity).
   - **RAID 6**: Usable space is total capacity minus the equivalent of two drives’ capacity (for parity).

3. **Drive Size**:  
   All the hard drives should ideally have the same capacity and speed for optimal performance. In most RAID configurations, if you use drives of different sizes, the RAID array will only use the capacity of the smallest drive for all drives (i.e., the larger drives will have unused space).

4. **Drive Type (HDD vs. SSD)**:  
   RAID can be configured with either HDDs (Hard Disk Drives) or SSDs (Solid State Drives), but mixing these two types in a RAID array is not advisable. The performance will usually be limited by the slowest drive, and in a mixed environment, HDDs will slow down the SSDs.

### Why Adding Hard Disks is Crucial in RAID Configuration

1. **Data Redundancy (Fault Tolerance)**:  
   - In RAID levels like **RAID 1**, **RAID 5**, **RAID 6**, and **RAID 10**, hard disks are added to improve fault tolerance. If one disk fails, data can still be recovered or reconstructed from the remaining drives due to the redundancy provided by mirroring or parity.
   - Adding multiple disks allows for greater redundancy and protection against data loss in case of hardware failure.

2. **Performance Improvement**:  
   - RAID can significantly improve read and write performance by distributing data across multiple disks. In **RAID 0** and **RAID 10**, adding more disks improves performance since data is split and accessed in parallel.
   - For RAID levels with parity (RAID 5 and RAID 6), the RAID controller can distribute read and write operations across the drives, improving performance in multi-tasking or data-heavy environments like databases or web servers.

3. **Increased Storage Capacity**:  
   - Adding hard disks increases the total available storage in the RAID array. In configurations like **RAID 5** or **RAID 6**, despite allocating some space for parity, you can still achieve large usable storage by adding multiple disks to the array.
   - Organizations often configure RAID in large storage systems to scale their infrastructure.

4. **Balanced Workloads and Disk Utilization**:  
   - In RAID, adding more hard disks allows you to distribute the workload more evenly, reducing the chance of overloading any single drive.
   - This is especially important in enterprise environments where data throughput and uptime are critical. RAID helps distribute both read and write operations across multiple drives, ensuring better performance and workload distribution.

5. **Scalability**:  
   - Adding disks to a RAID configuration allows for easy scalability. When your storage needs increase, you can often add more disks (in certain RAID configurations) without needing to overhaul the entire system.
   - For instance, in some setups, RAID arrays can be expanded by adding additional disks to the existing RAID configuration without downtime.

### RAID Level Considerations for Adding Hard Disks

- **RAID 0** (Striping):  
  If you add more drives, you'll get more performance and space, but **no fault tolerance**. Any drive failure means data loss across the array.
  
- **RAID 1** (Mirroring):  
  Adding more drives doesn't increase storage capacity but adds redundancy. Each drive is mirrored, so you get higher fault tolerance but no performance gains.

- **RAID 5** (Striping with Parity):  
  Adding more drives increases both storage capacity and redundancy. The parity data ensures that even if one drive fails, the data can be recovered.

- **RAID 6** (Striping with Double Parity):  
  Adding more drives increases both storage and fault tolerance (withstanding two simultaneous drive failures). It's ideal for critical systems where uptime and data integrity are crucial.

- **RAID 10** (Mirroring + Striping):  
  Adding drives increases both redundancy and performance since data is mirrored for fault tolerance and striped for performance.

### Conclusion
The requirement for adding hard disks when configuring RAID depends on the desired **level of redundancy, performance**, and **storage capacity**. Additional drives offer benefits like improved fault tolerance and performance through parallel access to data, but the exact number of drives and their configuration should align with your RAID level and the organization's needs.