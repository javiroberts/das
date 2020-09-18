# Endpoints

**POST** `/auth`

Obtener un token para poder interfacear con el resto de la aplicacion.

Request de ejemplo:

```
POST /auth

Body
{
    "username": "test",
    "password": "test",
    "type": "application"
}
```

**GET** `/api/assistance`

Solicitar un listado de casos de asistencia activos

```
GET /api/assistance

Headers
Authorization: Bearer the.secret.token
```

**POST** `/api/assistance/case`

Solicitar el inicio de un caso de asistencia

```
POST /api/assistance/case

Headers
Authorization: Bearer the.secret.token

Body
{
    "latitude": 0.0000,
    "longitude": 0.0000,
    "severity": "high",
    "street_address": "Calle Falsa 123 - Springfield",
    "case_description": "Se robaron una cosa"
}
```

**GET** `/api/assistance/case/{id}`

Solicitar el estado de un caso de asistencia

```
GET /api/assistance/case/aaa-12345-bbb

Headers
Authorization: Bearer the.secret.token
```