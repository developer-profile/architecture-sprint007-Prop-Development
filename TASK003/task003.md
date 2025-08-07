# Задание 3. Внешние интеграции

PropDevelopment планирует расширение бизнес-функций (business capabilities) для собственников и резидентов. Организация намерена интегрировать новые IoT-сервисы (IoT services) «Умный дом» через партнерскую экосистему (partner ecosystem).

Согласованы технические требования (technical requirements) с бизнесом и выбраны две услуги для имплементации (implementation):

- **Интеллектуальный домофон (Smart Intercom)**. Включает функции классического видеодомофона с возможностью remote unlock. Реализована биометрическая аутентификация (biometric authentication) с распознаванием лиц (facial recognition) и автоматическим контролем доступа (automated access control) для авторизованных пользователей.

- **Интеллектуальный шлагбаум (Smart Barrier)**. Включает функции классического управления шлагбаумом с автоматическим ANPR (Automatic Number Plate Recognition) для авторизованных транспортных средств.

Новые сервисы должны быть доступны через существующее мобильное приложение (mobile application), используемое собственниками.

## Решение

### Диаграмма контекста в модели C4

[Диаграмма контекста в модели C4](./context-diagram.puml)

### Диаграмма контейнеров в модели C4

[Диаграмма контейнеров в модели C4](./container-diagram.puml)

### Диаграмма контейнеров в Drawio

[Диаграмма контейнеров в Drawio](./container-diagram.drawio)

### Список требований к внешним интеграциям (External Integration Requirements)

**Требования к информационной безопасности (Security Requirements):**  
- Шифрование данных при передаче (data encryption in transit) с использованием TLS 1.2+ (Transport Layer Security) между системами и партнерами.  
- Шифрование биометрических данных пользователей (biometric data encryption).  
- Ограничение доступа к API через белый список IP-адресов (IP whitelisting).  
- Централизованное логирование и мониторинг пользовательских действий (centralized logging & monitoring).  
- Регулярный аудит безопасности (security audit) партнеров.  
- Периодический аудит прав доступа пользователей (access rights audit).  
- Реализация RBAC (Role-Based Access Control) с ролями: пользователь (user), гость (guest), администратор (admin).  
- Использование 2FA (Two-Factor Authentication) для усиления защиты доступа к устройствам.  
- Хранение логов доступа (access logs retention) не менее 6 месяцев.  
- Защита от DDoS-атак (DDoS protection) на уровне сети и приложений (network & application layers).  

**Протоколы аутентификации и авторизации (Authentication & Authorization Protocols):**  
- Использование OAuth 2.0 для межсистемного взаимодействия (inter-system communication).  
- Аутентификация через существующую систему PropDevelopment с интеграцией Keycloak/Active Directory (IdP - Identity Provider).  
- Авторизация на уровне API с использованием JWT (JSON Web Tokens) для передачи прав доступа (claims).  
- Внедрение SSO (Single Sign-On) для упрощения и унификации доступа к сервисам.  

**Взаимодействие между корпоративными системами и внешней платформой (Enterprise-to-External Platform Integration):**  
- Мобильное приложение осуществляет API-запросы (API requests) к серверу PropDevelopment.  
- Сервер взаимодействует с партнерским API (partner API), вся бизнес-логика контроля доступа (access control logic) реализована на стороне PropDevelopment.  
- Сервис умного дома построен по микросервисной архитектуре (microservices architecture) — выделен отдельный Smart Home Service, который интегрируется с домофоном и шлагбаумом (intercom, barrier gate).  
- Каждый микросервис использует выделенную базу данных (dedicated database) для хранения пользовательских конфигураций (user configurations).  
- Все данные сериализуются в JSON (JSON format) и передаются через REST API.  