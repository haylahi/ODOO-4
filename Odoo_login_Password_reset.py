# Odoo Encrypted password reset in postgres (Forgot Password)

from passlib.context import CryptContext
print CryptContext(['pbkdf2_sha512']).encrypt('admin')
