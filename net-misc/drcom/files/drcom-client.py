#!/usr/bin/python2

import httplib
import sys
import ConfigParser


config = ConfigParser.ConfigParser()
config.read('/etc/drcom.cfg')


USER   = config.get('LOGIN','USER')
PWD    = config.get('LOGIN','PASSWD')
SERVER = config.get('SERVER', 'SERVER')


def login():
    conn = httplib.HTTPConnection(SERVER)
    conn.request("POST", '', "DDDDD="+USER+"&upass="+PWD+"&0MKKey=%25B5%25C7%25C2%25BC%2BLogin")
    response = conn.getresponse()
    print response.status, response.reason
    data = response.read()
    conn.close()


def logout():
    conn = httplib.HTTPConnection(SERVER)
    conn.request("GET", '/F.htm', "Submit2=logout")
    response = conn.getresponse()
    print response.status, response.reason
    data = response.read()
    conn.close()


if __name__ == "__main__":
    try:
        if sys.argv[1] == "logout":
            logout()
    except:
        login()
