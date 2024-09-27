### CRC (Cyclic Redundency Check)

CRC is implemented at the lower level of the OSI modal, basically at **Data Link Layer**. CRC is implemented in **Ethernet** (IEEE 802.3), remember Ethernet is an standard, it is protocol that implements the **CRC** for error detection at **frame** level. 

- Error Detection happens on frame-level while the reciver recieves the frame. CRC is added to ensure that any changes hasn't taken place during the transmission of the Data, as there could be interference that might change the **bits**.
- CRC uses **Mathematical Checksum** to calculate the bits on the sender and recivers side.

So you can say that **CRC** is :

- Implemented on Layer 2 **Data Link Layer**, implemented on **Ethernet** that checks for any possible errors during the transmission.
- Error Detection **but not Error Correction**, as the CRC only checks for any possible errors and signal the **re-transmission** of data, through there isn't any mechanisim to data recovery or data correction. 

### Transport Layer 

Transport Layer works on Layer 4, it is ensure the reliability and  **end-to-end connection**. Transport layer has **TCP (Trasmission Control Protocol)** and **UDP (User Datagram Protocol)** that manages the process of end-to-end communication. 

- TCP has its own **error detection** method, **checksum** basically, that is added to the **segment** at Transport Layer and TCP Checksum is send to the reciever and is inspected in order to check for possible errors. 

- Unlike CRC, TCP has **Error Correction**, if the error is detected, TCP will send a request for retransmission of that data segment and recovery of bits can take place in a decent way.

### CRC v/s Tranport Layer Security

|**CRC (Data Link Layer)**|**TCP/UDP (Transport Layer)**|
|-|-|
|CRC is implemented on Data Link Layer, i.e., **Ethernet** frames|In Transport Layer the Checksum is implemented by TCP/UDP, adding it to the data segement|
|CRC provides no **Error Recovery** of data|TCP provides the recovery of data by sending the request for the data segment that haes errors|
|CRC is implemented on Ethernet frames so it ensure that devices/destination is found ensuring the **end-to-end connection**|TCP ensures theh reliable communication such that the data segments are send **correctly** over the multiple networks|


Both have their own pupose, as the purpose of the article was to understand that CRC ensures the frames are sent over to the destination, can also be thought as the connection is ensured locally on the Ethernet connected devices, while TCP ensure the connection is reliable **end-to-end**.  
