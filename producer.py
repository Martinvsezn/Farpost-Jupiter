import random
import string
import time
import redis
import json  # Добавляем модуль json для сериализации

# Подключение к Redis
r = redis.Redis(host='localhost', port=6379, db=0)

while True:
    # Генерация случайного сообщения
    message = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    # Делаем сериализацию в json
    json_message = json.dumps({'message': message})

    # Отправляем в Redis
    r.lpush('messages', json_message)
    print(f"Sent: {message}")

    time.sleep(60)  # Ждать 1 минуту