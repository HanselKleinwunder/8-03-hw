# Домашнее задание к занятию "`Система мониторинга Zabbix`" - `Скворцов Александр`



### Задание 1

Установите Zabbix Server с веб-интерфейсом.

**Процесс выполнения:**
1. Выполняя ДЗ, сверяйтесь с процессом отражённым в записи лекции.
2. Установите PostgreSQL. Для установки достаточна та версия, что есть в системном репозитороии Debian 11.
3. Пользуясь конфигуратором команд с официального сайта, составьте набор команд для установки последней версии Zabbix с поддержкой PostgreSQL и Apache.
4. Выполните все необходимые команды для установки Zabbix Server и Zabbix Web Server.

**Требования к результатам:**
1. Прикрепите в файл README.md скриншот авторизации в админке.
2. Приложите в файл README.md текст использованных команд в GitHub.

**1. Установка PostgreSQL:**
```
sudo apt install postgresql postgresql-contrib -y
sudo systemctl status postgresql
```

**2. Установка репозитория Zabbix:**
```
wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.0+ubuntu24.04_all.deb
dpkg -i zabbix-release_latest_7.0+ubuntu24.04_all.deb
sudo apt update

```
**3. Установка Zabbix сервера, веб-интерфейса и агента:**
```
sudo apt install zabbix-server-pgsql zabbix-frontend-php php8.3-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent

```

**4. Создание базы данных:**
```
sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix
zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix

```

![Панель авторизации Zabbix](img/1.png)`

![Панель управления Zabbix](img/2.png)`


---


