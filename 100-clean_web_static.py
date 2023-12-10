#!/usr/bin/python3
""" scrpit that deploys """
from fabric.api import *


env.hosts = ['54.164.103.65', '52.91.121.75']
env.user = "ubuntu"



def do_clean(number=0):
    """ do clean function"""

    number = int(number)

    if number == 0:
        number = 2
    else:
        number += 1

    local('cd versions ; ls -t | tail -n +{} | xargs rm -rf'.format(number))
    path = '/data/web_static/releases'
    run('cd {} ; ls -t | tail -n +{} | xargs rm -rf'.format(path, number))
