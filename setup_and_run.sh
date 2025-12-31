#!/bin/bash

echo "========================================="
echo "Loan Management System - Quick Setup"
echo "========================================="
echo ""

# Navigate to backend directory
cd backend

# Install dependencies
echo "📦 Installing dependencies..."
pip3 install -r requirements_dev.txt

# Run migrations
echo ""
echo "🗄️  Setting up database..."
python3 manage.py migrate

# Create superuser
echo ""
echo "👤 Creating admin user..."
python3 create_superuser.py

# Success message
echo ""
echo "========================================="
echo "✅ Setup completed successfully!"
echo "========================================="
echo ""
echo "Admin credentials:"
echo "  Email: admin@loanms.com"
echo "  Password: admin123"
echo ""
echo "To start the server, run:"
echo "  cd backend"
echo "  python3 manage.py runserver 0.0.0.0:8000"
echo ""
echo "Then open in browser:"
echo "  - API: http://127.0.0.1:8000/api/"
echo "  - Admin Panel: http://127.0.0.1:8000/admin/"
echo ""
echo "========================================="
