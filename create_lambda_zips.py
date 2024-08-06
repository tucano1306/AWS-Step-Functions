import zipfile

# Crear el archivo ZIP para la función Lambda del proceso de contratación
hire_process_code = '''
def lambda_handler(event, context):
    # Lógica para el proceso de contratación
    print("Proceso de contratación iniciado")
    
    # Simula alguna lógica de negocio
    result = {
        'status': 'Contratación completada',
        'details': {
            'candidateId': event['candidateId'],
            'position': event['position']
        }
    }
    
    print("Proceso de contratación completado")
    
    return {
        'statusCode': 200,
        'body': result
    }
'''  
with open('lambda_hire_process.py', 'w') as f:
    f.write(hire_process_code)

with zipfile.ZipFile('lambda_hire_process.zip', 'w') as z:
    z.write('lambda_hire_process.py')

# Crear el archivo ZIP para la función Lambda del proceso de evaluación de desempeño
performance_evaluation_code = '''
def lambda_handler(event, context):
    # Lógica para el proceso de evaluación de desempeño
    print("Evaluación de desempeño iniciada")
    
    # Simula alguna lógica de negocio
    result = {
        'status': 'Evaluación completada',
        'details': {
            'employeeId': event['employeeId'],
            'performanceRating': 'Excelente'
        }
    }
    
    print("Evaluación de desempeño completada")
    
    return {
        'statusCode': 200,
        'body': result
    }
'''  
with open('lambda_performance_evaluation.py', 'w') as f:
    f.write(performance_evaluation_code)

with zipfile.ZipFile('lambda_performance_evaluation.zip', 'w') as z:
    z.write('lambda_performance_evaluation.py')