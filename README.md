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
3. Создайте `group_vars/webservers/vault.yml` из шаблона и заполните секреты:
    ```bash
    cp group_vars/webservers/vault.yml.example group_vars/webservers/vault.yml
    ```
    * `vault_redmine_db_password` - пароль от БД
    * `vault_secret_key_base` — сгенерируйте ключ:
        ```bash
        openssl rand -hex 32
        ```
    * vault_datadog_api_key — API-ключ из DataDog (Organization Settings → API Keys)
5. Зашифруйте файл `vault.yml`:
    ```bash
    ansible-vault encrypt group_vars/webservers/vault.yml
    ```
## Деплой

```bash
make deploy
```
Команда установит Docker, запустит Redmine с подключением к PostgreSQL и настроит агент DataDog.

## Мониторинг
Приложение мониторится с помощью DataDog. Агент устанавливается автоматически при деплое.

1. Зарегистрируйтесь на [DataDog](https://www.datadoghq.com/)
2. Получите API-ключ в Organization Settings → API Keys
3. Добавьте ключ в `group_vars/webservers/vault.yml` в переменную `vault_datadog_api_key`
4. Зашифруйте vault:
   ```bash
   ansible-vault encrypt group_vars/webservers/vault.yml
   ```

## Приложение

Доступно по адресу: [hexlet-deploy-project.ru](https://hexlet-deploy-project.ru)
