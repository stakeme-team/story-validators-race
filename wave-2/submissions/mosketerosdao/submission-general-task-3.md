# General Task 3: Dashboard para el nodo Story

## Descripción
He desarrollado un **dashboard en Grafana** que proporciona métricas clave para monitorear el estado y rendimiento del nodo Story. Este dashboard incluye información sobre:

- **Memoria disponible del nodo**: Métrica `node_memory_MemAvailable_bytes`. Indica la cantidad de memoria RAM disponible en el nodo.
- **Uso de CPU del nodo**: Métrica `node_cpu_seconds_total`. Monitoriza la carga y uso de la CPU para asegurar un rendimiento óptimo.
- **Espacio disponible en disco**: Métrica `node_filesystem_avail_bytes`. Permite verificar que el almacenamiento no se quede sin espacio.
- **Número de peers conectados**: Métrica `p2p_peers`. Monitoriza la cantidad de peers conectados al nodo, indicando la calidad de la conectividad.
- **Uso de red**: Métricas `node_network_receive_bytes_total` y `node_network_transmit_bytes_total`. Muestra la cantidad de datos recibidos y enviados por el nodo.

## Enlaces a los dashboards
Puedes acceder a los dashboards desde los siguientes enlaces:

- **Memoria disponible del nodo**: [188.65.88.83:4001](http://188.65.88.83:4001/d/fe1dqo70fh4hsd/memoria-nodo-story?orgId=1&from=1729408597635&to=1729430197636&viewPanel=1)
- **Uso de CPU del nodo**: [188.65.88.83:4001](http://188.65.88.83:4001/d/ae1fyahfnn2m8d/uso-cpu-story?orgId=1&from=1729408640866&to=1729430240866&viewPanel=1)
- **Espacio disponible en disco**: [188.65.88.83:4001](http://188.65.88.83:4001/d/be1g0ylai251ce/espacio-en-disco-story?orgId=1&refresh=auto&from=1729408558205&to=1729430158205&viewPanel=1)

## Instalación del Dashboard
Para instalar el dashboard, he utilizado Prometheus como fuente de datos, configurado en el puerto **4001**. Los gráficos se crean utilizando las métricas clave proporcionadas por Prometheus. Para configurar Prometheus en Grafana, sigue los siguientes pasos:

1. Accede a Grafana desde la dirección: `http://188.65.88.83:4001:4001`.
2. Navega a "Configuración" -> "Fuentes de datos" y selecciona "Agregar fuente de datos".
3. Selecciona "Prometheus" y asegúrate de ingresar la URL correcta (`http://localhost:9090` si está en la misma máquina).
4. Guarda y verifica la conexión para asegurarte de que está funcionando.
