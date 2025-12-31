#!/bin/bash

echo "========================================="
echo "Starting Loan Management System Server"
echo "========================================="
echo ""
echo "Server will be available at:"
echo "  - API: http://127.0.0.1:8000/api/"
echo "  - Admin Panel: http://127.0.0.1:8000/admin/"
echo ""
echo "Admin credentials:"
echo "  Email: admin@loanms.com"
echo "  Password: admin123"
echo ""
echo "Press Ctrl+C to stop the server"
echo "========================================="
echo ""

cd backend
python3 manage.py runserver 0.0.0.0:8000
