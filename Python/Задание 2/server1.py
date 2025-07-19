# server1.py
import http.server
import socketserver

PORT = 8000

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(b"<h1>Hello from Server 1 on Port 8000! (Weight 2)</h1>")
        self.wfile.write(b"<p>This is the first server for Task 2.</p>")

print(f"Starting server on port {PORT}...")
with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    print(f"Serving at port {PORT}")
    httpd.serve_forever()
