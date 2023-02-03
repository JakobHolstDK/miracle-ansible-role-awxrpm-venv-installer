#!/opt/awx/virtualenv/bin/python
from django.core.management import utils
print(utils.get_random_secret_key())