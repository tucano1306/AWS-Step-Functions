
def lambda_handler(event, context):
    # L�gica para el proceso de evaluaci�n de desempe�o
    print("Evaluaci�n de desempe�o iniciada")
    
    # Simula alguna l�gica de negocio
    result = {
        'status': 'Evaluaci�n completada',
        'details': {
            'employeeId': event['employeeId'],
            'performanceRating': 'Excelente'
        }
    }
    
    print("Evaluaci�n de desempe�o completada")
    
    return {
        'statusCode': 200,
        'body': result
    }
