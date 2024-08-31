# istoreos Firmware Compilation Using GitHub Actions
This repository automates the process of compiling istoreos firmware using GitHub Actions. Currently, it supports rk33xx and rk35xx devices, with plans to add support for x86 devices in the future.

# Features
Automated Builds: Utilize GitHub Actions to automatically compile firmware for supported devices.
Multi-Device Support: Initially supports rk33xx and rk35xx devices, with x86 support coming soon.
Customizable Configurations: Easily modify configurations to suit your needs.

# Supported Devices
rk33xx
rk35xx
x86 (coming soon)

# Getting Started
To start using this repository, follow these steps:

Fork the Repository: Click the "Fork" button at the top right corner of this page to create your own copy of this repository.
Configure Your Build: Edit the .config file or use the default configuration for your target device.
Enable GitHub Actions: Make sure GitHub Actions are enabled in your forked repository.
Start a Build: Trigger a build manually or push changes to your repository to start the build process.

# Usage
Clone the Repository:

bash
复制代码
git clone https://github.com/your-username/istoreos-action.git
cd istoreos-action
Customize Configuration:

Edit .config to change the build configuration.
Trigger a Build:

Push changes to your repository, and GitHub Actions will automatically start the build process.
Future Plans
x86 Device Support: We plan to extend support to x86 devices in the near future.
Enhanced Customization: More options for customization and optimization of builds.
Contributing
Contributions are welcome! Feel free to open issues or submit pull requests to enhance the functionality of this repository.

License
This project is licensed under the MIT License - see the LICENSE file for details.
