# Домашнее задание к занятию "`Кластеризация и балансировка нагрузки`" - `Скворцов Александр`

### Задание 1

1. Запустите два simple python сервера на своей виртуальной машине на разных портах
2. Установите и настройте HAProxy, воспользуйтесь материалами к лекции по ссылке
3. Настройте балансировку Round-robin на 4 уровне.
4. На проверку направьте конфигурационный файл haproxy, скриншоты, где видно перенаправление запросов на разные серверы при обращении к HAProxy.


**Код для первого сервера:**
```
# server1.py
import http.server
import socketserver

PORT = 8888

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(b"<h1>Hello from Server 1 on Port 8888!</h1>")
        self.wfile.write(b"<p>This is the first simple Python server.</p>")

print(f"Starting server on port {PORT}...")
with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    print(f"Serving at port {PORT}")
    httpd.serve_forever()
```

**Код для второго сервера:**
```
# server2.py
import http.server
import socketserver

PORT = 9999

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(b"<h1>Hello from Server 2 on Port 9999!</h1>")
        self.wfile.write(b"<p>This is the second simple Python server.</p>")

print(f"Starting server on port {PORT}...")
with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    print(f"Serving at port {PORT}")
    httpd.serve_forever()
```

![Проверка доступности HAProxy](img/1.png)
![Перенаправление запросов на разные серверы](img/2.png)


---


