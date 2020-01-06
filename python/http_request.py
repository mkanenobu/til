#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import requests

response = requests.get('http://www.example.com')
print(response.status_code)
print(response.text)
