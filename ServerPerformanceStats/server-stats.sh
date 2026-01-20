#!/bin/bash
TOTAL_CPU=$(nproc)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | \
awk '{print 100 - $8}')
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
TOP_5_PROCESSES=$(ps aux --sort=-%cpu | head -n 6)
TOP_5_PROCESSES_MEM=$(ps aux --sort=-%mem | head -n 6)
OS_VERSION=$(lsb_release -d | awk -F"\t" '{print $2}')

echo "Número total de núcleos de CPU: ${TOTAL_CPU}"
echo "Uso total de CPU: ${CPU_USAGE}%"
echo "Uso de memoria: ${MEMORY_USAGE}%"
echo "Uso de disco en la partición raíz: ${DISK_USAGE}"
echo -e "\nTop 5 procesos por uso de CPU:"
echo "${TOP_5_PROCESSES}"
echo -e "\nTop 5 procesos por uso de memoria:"
echo "${TOP_5_PROCESSES_MEM}"
echo -e "\nVersión del sistema operativo: ${OS_VERSION}"