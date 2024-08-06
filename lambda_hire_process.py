
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
