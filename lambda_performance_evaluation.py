
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
