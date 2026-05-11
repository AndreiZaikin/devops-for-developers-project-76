[![Actions Status](https://github.com/AndreiZaikin/devops-for-developers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AndreiZaikin/devops-for-developers-project-76/actions)

# Деплой Docker-образов с помощью Ansible

## Подготовка серверов

1. Установите зависимости Ansible:
    ```bash
    ansible-galaxy install -r requirements.yml
    ```
2. Настройте инвентарь в `inventory.ini`

3. Запустите подготовку серверов:
    ```bash
    make prepare
    ```
