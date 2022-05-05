
from secrets import token_hex as gen

print(f'{"{"}{gen(4)}-{gen(2)}-{gen(2)}-{gen(2)}-{gen(6)}{"}"}'.upper())
