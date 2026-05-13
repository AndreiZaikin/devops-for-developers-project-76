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
3. Создайте group_vars/webservers.yml из шаблона:
    ```bash
    cp group_vars/webservers.yml.example group_vars/webservers.yml
    ```
    Заполните своими данными
4. Зашифруйте файл:
    ```bash
    ansible-vault encrypt group_vars/webservers.yml
    ```
5. Запустите подготовку:
    ```bash
    make prepare
    ```
## Деплой

```bash
make deploy
```

## Приложение

Доступно по адресу: [hexlet-deploy-project.ru](https://hexlet-deploy-project.ru)
