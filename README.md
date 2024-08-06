# AWS-Step-Functions
Descripción de la Arquitectura de AWS Step Functions para Procesos de RRHH
Esta arquitectura utiliza AWS Step Functions para coordinar flujos de trabajo complejos, como procesos de contratación y evaluación de desempeño, mediante funciones Lambda escritas en Python. La configuración de Terraform se utiliza para definir y desplegar todos los recursos necesarios en AWS.
Componentes Principales
1. AWS Step Functions
Máquina de Estados: Coordina los flujos de trabajo complejos. En este caso, la máquina de estados orquesta el proceso de contratación y evaluación de desempeño.
Estados: Cada paso del flujo de trabajo es un estado en la máquina de estados. Los estados incluyen tareas como ejecutar funciones Lambda.
2. AWS Lambda
Funciones Lambda: Ejecutan el código necesario para cada paso del flujo de trabajo. En este caso, hay dos funciones Lambda:
Proceso de Contratación (lambda_hire_process.py): Maneja la lógica para el proceso de contratación.
Evaluación de Desempeño (lambda_performance_evaluation.py): Maneja la lógica para el proceso de evaluación de desempeño.
Archivos ZIP: El código de las funciones Lambda se empaqueta en archivos ZIP (lambda_hire_process.zip y lambda_performance_evaluation.zip).
3. AWS IAM (Identity and Access Management)
Roles de IAM: Proveen los permisos necesarios para que las funciones Lambda y la máquina de estados de Step Functions puedan interactuar con otros servicios de AWS.
Rol para Lambda (venezuela123456): Permite que las funciones Lambda se ejecuten y accedan a los recursos necesarios.
Rol para Step Functions (sfn_exec_role): Permite que la máquina de estados de Step Functions ejecute las funciones Lambda.
4. Terraform
Archivos de Configuración: Define y despliega los recursos de AWS.
main.tf: Contiene la definición principal de los recursos.
variables.tf: Define las variables utilizadas en la configuración.
outputs.tf: Define las salidas que Terraform generará después de aplicar la configuración.
Uso de la Arquitectura
1. Coordinación de Flujos de Trabajo
Step Functions: Orquesta los flujos de trabajo complejos, asegurando que cada paso se ejecute en el orden correcto y maneje cualquier error que pueda ocurrir.
Estados de la Máquina de Estados:
HireProcess: Ejecuta la función Lambda que maneja el proceso de contratación.
PerformanceEvaluation: Ejecuta la función Lambda que maneja la evaluación de desempeño.
2. Ejecución de Funciones Lambda
Proceso de Contratación:
La función Lambda lambda_hire_process.py se ejecuta cuando el estado HireProcess es alcanzado.
Esta función maneja la lógica de contratación, como validar la información del candidato y registrar la contratación.
Evaluación de Desempeño:
La función Lambda lambda_performance_evaluation.py se ejecuta cuando el estado PerformanceEvaluation es alcanzado.
Esta función maneja la lógica de evaluación de desempeño, como calcular la calificación de desempeño y registrar los resultados.
3. Gestión de Permisos
Roles de IAM:
Rol para Lambda: Asegura que las funciones Lambda tengan los permisos necesarios para ejecutarse y acceder a otros recursos de AWS.
Rol para Step Functions: Asegura que la máquina de estados de Step Functions tenga los permisos necesarios para ejecutar las funciones Lambda.
4. Despliegue y Gestión con Terraform
Terraform: Proporciona una manera reproducible y gestionada de desplegar la infraestructura.
Inicialización: terraform init inicializa el directorio de Terraform.
Planificación: terraform plan muestra los recursos que se crearán.
Aplicación: terraform apply despliega los recursos en AWS.
Beneficios de la Arquitectura
Automatización: Automatiza flujos de trabajo complejos, reduciendo la intervención manual y minimizando errores.
Escalabilidad: AWS Step Functions y Lambda escalan automáticamente para manejar cargas variables.
Seguridad: IAM roles aseguran que solo los recursos autorizados puedan ejecutar funciones específicas.
Flexibilidad: Terraform permite gestionar la infraestructura como código, facilitando cambios y despliegues consistentes.
Monitoreo y Auditoría: AWS Step Functions proporciona capacidades de monitoreo y auditoría para rastrear la ejecución de los flujos de trabajo.
En resumen, esta arquitectura proporciona una solución robusta y escalable para coordinar flujos de trabajo complejos en procesos de RRHH, como contratación y evaluación de desempeño, utilizando AWS Step Functions y Lambda, con una gestión eficiente de permisos y despliegue automatizado mediante Terraform.

NOTA: FUE APROVISIONADA EN AWS FUNCIONA
