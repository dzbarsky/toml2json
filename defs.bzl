CPUS = ["aarch64", "x86_64"]
OSES = ["linux", "macos"]

LINUX_PLATFORMS = [
    struct(os = os, cpu = cpu)
    for os in OSES
    for cpu in CPUS
]

WINDOWS_PLATFORMS = [struct(os = "windows", cpu = "x86_64")]

PLATFORMS = LINUX_PLATFORMS + WINDOWS_PLATFORMS

def platform_name(p):
    return p.os + "_" + p.cpu
