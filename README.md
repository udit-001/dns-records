# DNS Records Backup

Backup DNS records (A, AAAA, MX, TXT, NS, CNAME) for any domain.

## Usage

```bash
./scripts/dns-backup.sh example.com
```

## Automated Backup
- Monthly backup on 7th at 17:00 UTC
- Creates GitHub release with backup file
- Configure schedule in `.github/workflows/dns-backup.yml`

## Manual Backup
1. Go to Actions tab
2. Select "DNS Backup" workflow
3. Click "Run workflow"

## Requirements
- `dig` command
- GitHub Actions enabled 

## Workflow Status
- 🔄 Last Run: 2026-01-07 17:25 UTC