Prerequisite: Mozilla Firefox is installed.
1. Install Ruby 2.1.6 from http://rubyinstaller.org/downloads/
Tick Add Ruby executables to your PATH, Associate .rb and .rbw files with this Ruby installation.
2. In command line go to your Ruby installation bin folder (like ..\Ruby21-x64\bin) and run "gem install bundle".
3. Dowload and install the DevKit from 'http://rubyinstaller.org/downloads' (for use with Ruby 2.0 and above) and follow the instructions at 'http://github.com/oneclick/rubyinstaller/wiki/Development-Kit'. 
4. Go to project folder ..\TestCarnect and run "bundle install", "selenium install", "gem install gherkin --platform=ruby".
5. Run tests "rake features".