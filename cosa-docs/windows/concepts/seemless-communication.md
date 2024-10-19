# DNS Zone Configuration

If there are two Parent Domain, say **cdac.lab** and **sunbeam.lab**. When you'll create or say configure AD for both the domain, you'll find one Primary zone created by the DNS for itself, meaning one entry of cdac.lab will be created on the **CDAC** and one will be created on **SUNBEAM** with entry of sunbeam.lab. Now if you'v further created two different child domain within the cdac.lab, say acts.cdac.lab and sunbeam.cdac.lab. How the seemless communication between the two zones will flow, though remember that there is trust within the forest, as both domain within the forest is part of one forest but you need to tell the DC where to send the request when someone from sunbeam.lab wants to go to the acts.cdac.lab and this is said like this, *The DC holds the authoritive server of all the DNS servers within the Domain.*



