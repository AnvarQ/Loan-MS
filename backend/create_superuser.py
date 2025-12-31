#!/usr/bin/env python
"""Script to create superuser programmatically"""
import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
django.setup()

from user.models import User

# Create superuser
email = 'admin@loanms.com'
password = 'admin123'

if not User.objects.filter(email=email).exists():
    user = User.objects.create_superuser(
        email=email,
        password=password
    )
    user.is_admin = True
    user.is_staff = True
    user.is_superuser = True
    user.is_customer = False
    user.is_agent = False
    user.save()
    print(f'Superuser created successfully!')
    print(f'Email: {email}')
    print(f'Password: {password}')
    print(f'Role: ADMIN')
else:
    print(f'Superuser with email {email} already exists!')
