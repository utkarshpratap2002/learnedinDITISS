# PowerShell

It is Scripting Language that allows the retrieval of information based on the specific commands, such as:

- `Get -`
- `Set -`
- `Install -WindowFeature`
- `Show -`
- `Now -`

PowerShell Scripting has `.ps1` extension that shows the PowerShell Scripting language.

PowerShell has various feature to manage the Active Directory operations but remember that most of its commands are like Linux. It allows various commands which are like Linux, such as **`clear`** and 

- `Get-` will give you all the extension features.
  - `Get-ComputerInfo` is another command that will list all the information about the DC, such as Role, TIme one, Installation details and others. These are called Command leds, these are helpful for **Auditing**.
  - `Rename-COmputer -NewName` *"UpdatedName"* to update the name of the system.
  - `Rename-COmputer -NewName` *"UpdatedName"* -Restart to update the name of the system.
  - `set-TimeZone` will expand various options for the Time Zone options. 
  - `get-TimeZone` will give you the current time zone of the AD.
  - *So How can you set the Time Zone?* First list all the Time Zones available
    ```
    Get-TimeZone -ListAvailable
    ```
  - Now you need to set the time zone:
    ```
    Set-TimeZone -Name "Your Desired Time Zone Name"
    ```