#!/usr/local/lib/python3.10

import sys
sys.path.insert(0, '/var/www/web_app')


activate_this = '/usr/local/bin/python' #'/usr/local/lib/python3.10'

#with open(activate_this) as file_:
#    exec(file_.read(), dict(__file__ = activate_this))

from run import main_app as application
