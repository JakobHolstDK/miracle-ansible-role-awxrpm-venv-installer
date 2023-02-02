#!/usr/bin/env python3
from django.core.management import utils
print(utils.get_random_secret_key())