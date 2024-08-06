variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "state_machine_name" {
  description = "The name of the Step Functions state machine"
  type        = string
  default     = "HRWorkflowStateMachine"
}

variable "lambda_hire_process_file" {
  description = "The path to the ZIP file containing the Lambda function code for the hire process"
  type        = string
  default     = "lambda_hire_process.zip"
}

variable "lambda_performance_evaluation_file" {
  description = "The path to the ZIP file containing the Lambda function code for the performance evaluation process"
  type        = string
  default     = "lambda_performance_evaluation.zip"
}