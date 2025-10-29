CPUS = ["aarch64", "x86_64"]
OSES = ["linux", "macos"]

PLATFORMS = [
    struct(os = os, cpu = cpu)
    for os in OSES
    for cpu in CPUS
]

# TODO(zbarsky): enable windows? [struct(os = "windows", cpu = "x86_64")]

def platform_name(p):
    return p.os + "_" + p.cpu
