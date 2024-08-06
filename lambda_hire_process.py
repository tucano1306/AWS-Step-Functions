
def lambda_handler(event, context):
    # L�gica para el proceso de contrataci�n
    print("Proceso de contrataci�n iniciado")
    
    # Simula alguna l�gica de negocio
    result = {
        'status': 'Contrataci�n completada',
        'details': {
            'candidateId': event['candidateId'],
            'position': event['position']
        }
    }
    
    print("Proceso de contrataci�n completado")
    
    return {
        'statusCode': 200,
        'body': result
    }
