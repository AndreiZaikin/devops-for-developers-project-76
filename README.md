[![Actions Status](https://github.com/AndreiZaikin/devops-for-developers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AndreiZaikin/devops-for-developers-project-76/actions)

# Деплой Docker-образов с помощью Ansible

Проект разворачивает Redmine на двух серверах в Yandex Cloud с балансировщиком и кластером PostgreSQL.

## Инфраструктура

- 2 ВМ (Compute Cloud) с Ubuntu и Docker
- Application Load Balancer (L7)
- Кластер Managed PostgreSQL
- DNS-зона и сертификат Let's Encrypt

## Подготовка серверов

1. Скопируйте `inventory.ini.example` в `inventory.ini` и укажите IP серверов
2. Установите зависимости:
   ```bash
   ansible-galaxy install -r requirements.yml
   ```
3. Создайте `extra_vars.yml` в корне проекта и заполните секреты:
    ```yaml
    vault_redmine_db_password: <пароль_БД>
    vault_secret_key_base: <сгенерированный_ключ>
    vault_datadog_api_key: <API-ключ_DataDog>
    ```
    Секретный ключ генерируется командой:
    ```bash
    openssl rand -hex 32
    ```
    API-ключ DataDog получается в Organization Settings → API Keys после регистрации на DataDog.

## Деплой

```bash
make deploy
```
Команда установит Docker, запустит Redmine с подключением к PostgreSQL и настроит агент DataDog.

## Приложение

Доступно по адресу: [hexlet-deploy-project.ru](https://hexlet-deploy-project.ru)
