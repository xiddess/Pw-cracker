
# 🧩 Ruby Password Cracker

Welcome to the Password Cracker project! 🚀 This program is a brute-force password cracker built with Ruby. It can break passwords from various types of files (like .pdf, .docx, .xlsx, .json, .csv, etc.) and web login pages. The brute-force technique will try every combination from the provided dictionary to find the correct password. 🔓

## Features ✨
- Brute-force Password Files: 🗂️ Crack passwords from PDF, DOCX, XLSX, JSON, CSV, and more!

- Brute-force Web Login: 🌐 Try logging in to websites with combinations from a dictionary.

- Uses rockyou.txt Dictionary: 📜 This program uses the famous rockyou.txt dictionary file to perform brute-force attacks.

## Prerequisites 🛠️
Before running the program, make sure Ruby is set up along with the necessary gems.

1. Install Ruby & rbenv 🔧
Install Ruby using rbenv:

    Make sure you have rbenv to manage isolated Ruby versions.

    Follow the installation guide for rbenv on rbenv docs if it's not installed yet.

2. Install Bundler & Dependencies:

    Install Bundler to manage project dependencies:
```ruby
gem install bundler
```
Install all required gems with:
```ruby
bundle install
```

## Usage 🚀
1. Cracking File Passwords 🔓

You can use the program to crack passwords for various file types (e.g., PDF, DOCX, XLSX). Here's an example:
```bash
ruby cracker.rb --file path_to_file --dictionary rockyou.txt
```
Replace path_to_file with the path to the file you want to crack.

2. Cracking Web Login Passwords 🌍
The program can also brute-force login pages. Here's how you can use it:
```bash
ruby cracker.rb --url "http://example.com/login" --dictionary rockyou.txt
```
Replace the URL with the login page you want to attack.

3. Available Parameters 🔧
--file: Path to the file you want to crack the password for. 📄

--url: The URL of the login page to brute-force. 🌐

--dictionary: Path to the dictionary file (default: rockyou.txt). 📜

## Dependencies (Gems) 💎
Make sure you have the following gems to run the program smoothly:

- mechanize - For automating login on websites. 🤖

- rubyzip - For cracking ZIP file passwords. 📦

- pdf-reader - For cracking PDF file passwords. 📄

- docx - For cracking DOCX file passwords. 📑

These gems will be installed automatically when you run bundle install

## Installation and Setup 🛠️
Step 1: Clone the Repository 🧑‍💻

Clone this repository to your local machine:
```bash
git clone https://github.com/xiddess/Pw-cracker
cd password-cracker
```
Step 2: Install Dependencies 📦

Install all the required dependencies using Bundler:
```bash
bundle install
```
Step 3: Run the Program 🎮

Once the dependencies are installed, you can run the program based on your needs.

## Contributing 💡
Want to help improve this project? 🚀 Feel free to fork the repo and submit a pull request with your changes! Be sure to create an issue first if you'd like to add a feature or report a bug. 😊

Steps for contributing:

- Fork this repository.

- Create a branch (git checkout -b new-feature).

- Commit your changes (git commit -am 'Add new feature').

- Push to your branch (git push origin new-feature).

- Create a pull request.

## License 📄
This project is licensed under the [MIT License](https://choosealicense.com/licenses/mit/).
