#!/usr/local/lib/python3.10

import sys

print('#############', sys.version, '#############')

sys.path.insert(0, '/var/www/web_app')

from run import main_app as application
