variable "basic_auth" {
  type        = string
  description = "test of secret"
  default     = "authorization: d01e02f5-170e-4d51-93ba-4a6c0a25bf84"
}

variable "basic_auth2" {
  type        = string
  description = "test of secret"
  default     = "Basic amFtZXM6cGFzc3dvcmQxMjM="
}
