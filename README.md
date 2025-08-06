# Jenkins з Docker - Налаштування та Запуск

Цей проект містить конфігурацію для запуску Jenkins через Docker з підтримкою Blue Ocean та Docker-in-Docker функціональності.

## 📋 Вимоги

### Мінімальні системні вимоги:
- **RAM**: 256 MB (рекомендовано 4+ GB)
- **Дисковий простір**: 1 GB (рекомендовано 50+ GB)
- **Docker**: Останню версію
- **Docker Compose**: Останню версію

### Програмні вимоги:
- Java: автоматично встановлюється в контейнері
- Веб-браузер для доступу до Jenkins UI

## 🚀 Швидкий запуск

1. **Клонування та перехід до директорії:**
   ```bash
   cd /opt/jenkins
   ```

2. **Запуск через скрипт:**
   ```bash
   ./start.sh
   ```

3. **Або запуск через Docker Compose:**
   ```bash
   docker-compose up -d
   ```

4. **Доступ до Jenkins:**
   - Відкрийте браузер і перейдіть на `http://localhost:8080`
   - Отримайте початковий пароль:
     ```bash
     docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
     ```

## 🏗️ Архітектура

### Сервіси:
- **jenkins-docker** (docker:dind): Docker-in-Docker для виконання Docker команд
- **jenkins-blueocean**: Основний сервер Jenkins з Blue Ocean

### Мережа:
- **jenkins**: Ізольована мережа для комунікації між контейнерами

### Volumes:
- **jenkins-data**: Зберігає дані Jenkins (`/var/jenkins_home`)
- **jenkins-docker-certs**: TLS сертифікати для Docker

## 🔧 Конфігурація

### Dockerfile
Базується на офіційному образі `jenkins/jenkins:2.516.1-jdk21` з додаванням:
- Docker CLI для виконання Docker команд
- Попередньо встановлені плагіни: Blue Ocean, Docker Workflow, JSON Path API

### Docker Compose
Налаштовує два сервіси з необхідними залежностями та volume-ами.

## 📦 Встановлені плагіни

- **Blue Ocean**: Сучасний UI для Jenkins Pipeline
- **Docker Workflow**: Інтеграція з Docker
- **JSON Path API**: Робота з JSON даними

## 🔒 Безпека

- TLS шифрування для Docker daemon
- Ізольована мережа для контейнерів
- Volumes для безпечного зберігання даних

## 📋 Корисні команди

```bash
# Перегляд статусу контейнерів
docker-compose ps

# Перегляд логів
docker-compose logs -f

# Зупинка сервісів
docker-compose down

# Перезапуск сервісів
docker-compose restart

# Вхід до контейнера Jenkins
docker exec -it jenkins-blueocean bash

# Очищення volumes (УВАГА: втратите всі дані!)
docker-compose down -v
```

## 🛠️ Налаштування після встановлення

1. **Розблокування Jenkins**:
   - Використайте пароль з `/var/jenkins_home/secrets/initialAdminPassword`

2. **Встановлення плагінів**:
   - Оберіть "Install suggested plugins" для базового набору
   - Або налаштуйте вручну необхідні плагіни

3. **Створення адміністратора**:
   - Заповніть форму створення першого користувача

## 🔗 Порти

- **8080**: Jenkins Web UI
- **50000**: Jenkins agent port (для підключення агентів)
- **2376**: Docker daemon port (внутрішній)

## 📚 Додаткові ресурси

- [Офіційна документація Jenkins Docker](https://www.jenkins.io/doc/book/installing/docker/)
- [Blue Ocean документація](https://www.jenkins.io/projects/blueocean/)
- [Jenkins Pipeline документація](https://www.jenkins.io/doc/book/pipeline/)
- [Docker-in-Docker документація](https://hub.docker.com/_/docker)

## 🆘 Вирішення проблем

### Jenkins не запускається:
- Перевірте чи достатньо RAM
- Перевірте логи: `docker-compose logs jenkins`

### Проблеми з Docker-in-Docker:
- Переконайтеся що контейнер запущений з привілейованими правами
- Перевірте мережеві підключення

### Втрата даних:
- Дані зберігаються в Docker volumes
- Для бекапу використайте: `docker cp jenkins-blueocean:/var/jenkins_home ./backup`