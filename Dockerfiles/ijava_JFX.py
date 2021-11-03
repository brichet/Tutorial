import json
import jupyter_client

from pathlib import PosixPath

COMMAND_PARAMETERS = ["--module-path=/usr/share/openjfx/lib/", "--add-modules=ALL-MODULE-PATH"]

kernel_file = PosixPath(jupyter_client.kernelspec.KernelSpecManager().get_kernel_spec('java').resource_dir) / "kernel.json"

with open(kernel_file, 'r') as fd:
    kernel_desc = json.load(fd)

kernel_desc['argv'][1:1] = COMMAND_PARAMETERS

with open(kernel_file, 'w') as fd:
    json.dump(kernel_desc, fd, indent=4)
