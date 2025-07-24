/*resource "aws_route53_record" "api_record" {
  zone_id = var.hosted_zone_id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = var.api_gateway_domain_name
    zone_id                = var.api_gateway_zone_id
    evaluate_target_health = false
  }
}
*/