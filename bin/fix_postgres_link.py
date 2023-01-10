import os
import re


for k, v in sorted(os.environ.items()):
    if v.startswith("postgres://"):
        # print(k, v)
        # print("export {0}=\"{1}\"".format(k, re.sub(r"postgres://", "postgresql://", v, 1)))
        # os.system("export {0}=\"{1}\"".format(k, re.sub(r"postgres://", "postgresql://", v, 1)))
        os.environ[k] = re.sub(r"postgres://", "postgresql://", v, 1)
        # print(os.environ[k])
        # os.environ[k] = re.sub(r"postgres://", "postgresql://", v, 1)
