provider "aws" {
  region = var.region
}

# Crear una función Lambda para el proceso de contratación
resource "aws_lambda_function" "hire_process" {
  filename         = var.lambda_hire_process_file
  function_name    = "HireProcessFunction"
  role             = aws_iam_role.venezuela123456.arn
  handler          = "lambda_hire_process.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = filebase64sha256(var.lambda_hire_process_file)
  environment {
    variables = {
      STAGE = "production"
    }
  }
}

# Crear una función Lambda para el proceso de evaluación de desempeño
resource "aws_lambda_function" "performance_evaluation" {
  filename         = var.lambda_performance_evaluation_file
  function_name    = "PerformanceEvaluationFunction"
  role             = aws_iam_role.venezuela123456.arn
  handler          = "lambda_performance_evaluation.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = filebase64sha256(var.lambda_performance_evaluation_file)
  environment {
    variables = {
      STAGE = "production"
    }
  }
}

# Crear un rol de IAM para las funciones Lambda
resource "aws_iam_role" "venezuela123456" {
  name = "venezuela123456"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Adjuntar políticas al rol de IAM para las funciones Lambda
resource "aws_iam_role_policy_attachment" "lambda_exec_policy_attachment" {
  role       = aws_iam_role.venezuela123456.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Definir la máquina de estados de Step Functions
resource "aws_sfn_state_machine" "hr_workflow" {
  name     = var.state_machine_name
  role_arn = aws_iam_role.sfn_exec.arn
  definition = jsonencode({
    Comment = "HR Workflow for hiring and performance evaluation",
    StartAt = "HireProcess",
    States = {
      HireProcess = {
        Type = "Task",
        Resource = aws_lambda_function.hire_process.arn,
        Next = "PerformanceEvaluation"
      },
      PerformanceEvaluation = {
        Type = "Task",
        Resource = aws_lambda_function.performance_evaluation.arn,
        End = true
      }
    }
  })
}

# Crear un rol de IAM para la máquina de estados de Step Functions
resource "aws_iam_role" "sfn_exec" {
  name = "sfn_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "states.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Adjuntar políticas al rol de IAM para la máquina de estados
resource "aws_iam_role_policy_attachment" "sfn_exec_policy_attachment" {
  role       = aws_iam_role.sfn_exec.name
  policy_arn = "arn:aws:iam::aws:policy/AWSStepFunctionsFullAccess"
}