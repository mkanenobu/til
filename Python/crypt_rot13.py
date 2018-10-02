import codecs
import sys

plain = sys.argv[1]
print(codecs.encode(plain,  'rot13'))

