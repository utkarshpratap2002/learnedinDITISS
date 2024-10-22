## Apple’s Approach vs. RPM Package Management

In **macOS**, package management is much more **abstracted** compared to Linux's RPM-based systems. Here’s how it compares:

| **RPM Package Management** | **macOS Approach** |
|----------------------------|--------------------|
| RPM queries directly interact with a **database of installed packages**. | macOS provides the **`pkgutil` tool** to query and manage installed `.pkg` files. |
| RPM uses **command-line tools** to manage installations and upgrades. | macOS favors **drag-and-drop installations** or **App Store** downloads. |
| **Custom scripts** in RPM packages control installation behavior. | macOS packages can use **post-install scripts** but with tighter security restrictions (e.g., **notarization** and **code signing**). |

Example on macOS to query an installed package:
```bash
pkgutil --pkg-info com.apple.pkg.Safari
```

This breakdown shows the **flexibility of RPM commands** for system administrators, but also why macOS avoids such granular management, aiming for **user-friendly tools** like the **App Store** or **Homebrew**.
