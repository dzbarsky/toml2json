CPUS = ["aarch64", "x86_64"]
OSES = ["linux", "macos", "windows"]

PLATFORMS = [
    struct(os = os, cpu = cpu)
    for os in OSES
    for cpu in CPUS
]

def platform_name(p):
    return p.os + "_" + p.cpu
