#!/bin/bash

echo "========================================"
echo "ATCL26 - Starting with ngrok"
echo "========================================"
echo ""
echo "Starting PHP server on localhost:8000..."
php -S localhost:8000 router.php &
PHP_PID=$!
sleep 3
echo ""
echo "Starting ngrok tunnel..."
echo ""
echo "Your application will be available at the ngrok URL shown below."
echo "Press Ctrl+C to stop both servers."
echo ""
ngrok http 8000

# Cleanup on exit
trap "kill $PHP_PID 2>/dev/null" EXIT
