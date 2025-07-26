# 🏗️ AWS Mid-Market Enterprise Architecture

Diese Architektur implementiert eine skalierbare, sichere Umgebung für wachsende Unternehmen mit getrennter Dev/Prod-Infrastruktur.

## 🔧 Infrastrukturkomponenten

- Zwei AWS Accounts: `dev`, `prod`
- VPCs mit 3 Availability Zones pro Account
- EC2-Instanzen mit ALB
- RDS (PostgreSQL) in privaten Subnets
- S3-Buckets mit Versioning, KMS
- IAM mit Rollen, Policies, MFA
- CloudTrail & CloudWatch für zentrale Logs
- GitHub Actions mit Terraform

## 📁 Struktur

Siehe den `terraform/`-Ordner für modulare Definition.
