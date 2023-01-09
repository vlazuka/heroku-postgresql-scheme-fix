import os
import re


for k, v in sorted(os.environ.items()):
    if v.startswith("postgres://"):
        print(k, v)
        os.system("{0}=\"{1}\"".format(k, re.sub(r"postgres://", "postgresql://", v, 1)))
        # os.environ[k] = re.sub(r"postgres://", "postgresql://", v, 1)
