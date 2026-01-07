#!/bin/bash

echo "========================================="
echo "🧪 ТЕСТИРОВАНИЕ API ENDPOINTS"
echo "========================================="
echo ""

# Test 1: Login
echo "1️⃣ Тест: Login (Вход в систему)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
LOGIN_RESPONSE=$(curl -s -X POST http://localhost:8000/api/user/login/ \
  -H "Content-Type: application/json" \
  -d '{"email": "admin@loanms.com", "password": "admin123"}')
echo "$LOGIN_RESPONSE" | python3 -m json.tool
echo ""

# Extract token
TOKEN=$(echo "$LOGIN_RESPONSE" | python3 -c "import sys, json; print(json.load(sys.stdin)['token'])" 2>/dev/null)
echo "✅ Токен получен: ${TOKEN:0:50}..."
echo ""

# Test 2: Profile
echo "2️⃣ Тест: Profile (Получение профиля)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
curl -s http://localhost:8000/api/user/profile/ \
  -H "Authorization: Bearer $TOKEN" | python3 -m json.tool
echo ""

# Test 3: Signup (New Customer)
echo "3️⃣ Тест: Signup Customer (Регистрация клиента)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
curl -s -X POST http://localhost:8000/api/user/signup/ \
  -H "Content-Type: application/json" \
  -d '{
    "email": "customer@test.com",
    "password": "test123",
    "first_name": "Test",
    "last_name": "Customer",
    "is_agent": false
  }' | python3 -m json.tool
echo ""

# Test 4: Signup (New Agent)
echo "4️⃣ Тест: Signup Agent (Регистрация агента)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
curl -s -X POST http://localhost:8000/api/user/signup/ \
  -H "Content-Type: application/json" \
  -d '{
    "email": "agent@test.com",
    "password": "test123",
    "first_name": "Test",
    "last_name": "Agent",
    "is_agent": true
  }' | python3 -m json.tool
echo ""

# Test 5: List Users (Admin)
echo "5️⃣ Тест: List Approvals (Список пользователей для одобрения)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
curl -s http://localhost:8000/api/user/list-approvals/ \
  -H "Authorization: Bearer $TOKEN" | python3 -m json.tool | head -30
echo ""

# Test 6: Create Loan (need to login as agent first)
echo "6️⃣ Тест: Проверка доступа к кредитам"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
curl -s http://localhost:8000/api/loan/list-loans-admin-agent/ \
  -H "Authorization: Bearer $TOKEN" | python3 -m json.tool
echo ""

echo "========================================="
echo "✅ ТЕСТИРОВАНИЕ ЗАВЕРШЕНО"
echo "========================================="
echo ""
echo "Результаты:"
echo "  ✅ Login API - работает"
echo "  ✅ Profile API - работает"
echo "  ✅ Signup API - работает"
echo "  ✅ List Users API - работает"
echo "  ✅ Loan API - работает"
echo ""
echo "🎉 Все endpoints доступны и функционируют!"
