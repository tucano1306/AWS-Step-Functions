output "state_machine_arn" {
  description = "The ARN of the Step Functions state machine"
  value       = aws_sfn_state_machine.hr_workflow.arn
}

output "hire_process_lambda_arn" {
  description = "The ARN of the Lambda function for the hire process"
  value       = aws_lambda_function.hire_process.arn
}

output "performance_evaluation_lambda_arn" {
  description = "The ARN of the Lambda function for the performance evaluation process"
  value       = aws_lambda_function.performance_evaluation.arn
}