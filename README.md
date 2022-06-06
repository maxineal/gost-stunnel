# Пример Dockerfile для КриптоПро&trade; Stunnel

Перед сборкой необходимо скачать дистрибутив КриптоПро CSP для Debian (<https://cryptopro.ru/products/csp>) и поместить сюда: dist/csp_deb.tgz.

Сертификат в формате .pfx (сертификат с закрытым ключом) необходимо примонтировать к контейнеру по пути /etc/stunnel/certificate.pfx

Описание переменных окружения:
Имя переменной  |  Описание
--------------  |  ---------
STUNNEL_HOST    |  Адрес хоста, к которому подключаемся по ГОСТ TLS
STUNNEL_HTTP_PROXY | Хост http-прокси
STUNNEL_HTTP_PROXY_PORT | Порт http-прокси, если не указан хост, не используется
STUNNEL_HTTP_PROXY_CREDENTIALS | Учетные данные для http-прокси, например: username:password
STUNNEL_DEBUG_LEVEL | Уровень логирования, 0 - не логировать, 5 - логировать всё
STUNNEL_CERTIFICATE_PFX_FILE | Путь к сертификату с закрытым ключом. По умолчанию /etc/stunnel/certificate.pfx
STUNNEL_CERTIFICATE_PIN_CODE | Пин-код сертификата