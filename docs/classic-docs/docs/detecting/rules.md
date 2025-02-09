# Available Rules

!!! Tip
    To view the list of available rules, run Tracee with the `--list` flag.

Tracee currently distributes **fully functional signatures** that detect potentially malicious behavior.

## Signatures in Aqua Vulnerability Database (AVD)

The Aqua Vulnerability Database gives detailed information and
remediation guidance for vulnerabilities and weaknesses found in
open source applications and cloud native infrastructure. This
includes information about common techniques and attack vectors
that occur at application runtime, which are generated from the
signatures in tracee. You can see them at
[avd.aquasec.com/tracee](https://avd.aquasec.com/tracee/) and in
the table below:

Name   |Description                               |Full Description
-------|------------------------------------------|----
TRC-101 | Process standard input/output over socket detected | A process has its standard input/output redirected to a socket. This behavior is the base of a Reverse Shell attack, which is when an interactive shell being invoked from a target machine back to the attacker's machine, giving it interactive control over the target. Adversaries may use a Reverse Shell to retain control over a compromised target while bypassing security measures like network firewalls.
TRC-102 | Anti-Debugging detected | A process used anti-debugging techniques to block a debugger. Malware use anti-debugging to stay invisible and inhibit analysis of their behavior.
TRC-103 | Code injection detected using ptrace | Possible code injection into another process was detected. Code injection is an exploitation technique used to run malicious code, adversaries may use it in order to execute their malware.
TRC-104 | Dynamic code loading detected |  Possible dynamic code loading was detected as the binary's memory is both writable and executable. Writing to an executable allocated memory region could be a technique used by adversaries to run code undetected and without dropping executables.
TRC-105 | Fileless execution detected | Fileless execution was detected. Executing a process from memory instead from a file in the filesystem may indicate that an adversary is trying to avoid execution detection.
TRC-106 | Cgroups notify_on_release file modification | An attempt to modify Cgroup notify_on_release file was detected. Cgroups are a Linux kernel feature which limits the resource usage of a set of processes. Adversaries may use this feature for container escaping.
TRC-107 | LD_PRELOAD code injection detected | LD_PRELOAD usage was detected. LD_PRELOAD lets you load your library before any other library, allowing you to hook functions in a process. Adversaries may use this technique to change your applications' behavior or load their own programs.
TRC-108 | K8s service account token file read | The Kubernetes service account token file was read on your container. This token is used to communicate with the Kubernetes API Server. Adversaries may try to communicate with the API Server to steal information and/or credentials, or even run more containers and laterally extend their grip on the systems.
TRC-109 | ASLR inspection detected |  The ASLR (address space layout randomization) configuration was inspected. ASLR is used by Linux to prevent memory vulnerabilities. An adversary may want to inspect and change the ASLR configuration in order to avoid detection.
TRC-1010| Cgroups release agent file modification |  An attempt to modify Cgroup release agent file was detected. Cgroups are a Linux kernel feature which limits the resource usage of a set of processes. Adversaries may use this feature for container escaping.
TRC-1011 | Core dumps configuration file modification detected | Modification of the core dump configuration file (core_pattern) detected. Core dumps are usually written to disk when a program crashes. Certain modifications enable container escaping through the kernel core_pattern feature.
TRC-1012 | Default dynamic loader modification detected |  The default dynamic loader has been modified. The dynamic loader is an executable file loaded to process memory and run before the executable to load dynamic libraries to the process. An attacker might use this technique to hijack the execution context of each new process and bypass defenses.
TRC-1013 | Kubernetes API server connection detected | A connection to the kubernetes API server was detected. The K8S API server is the brain of your K8S cluster, adversaries may try and communicate with the K8S API server to gather information/credentials, or even run more containers and laterally expand their grip on your systems.
TRC-1014 | Container device mount detected | Container device filesystem mount detected. A mount of a host device filesystem can be exploited by adversaries to perform container escape.
TRC-1015 | Hidden executable creation detected | A hidden executable (ELF file) was created on disk. This activity could be legitimate; however, it could indicate that an adversary is trying to avoid detection by hiding their programs.
TRC-1016 | Web server spawned a shell | A web-server program on your server spawned a shell program. Shell is the linux command-line program, web servers usually don't run shell programs, so this alert might indicate an adversary is exploiting a web server program to gain command execution on the server.
TRC-1017|  Kernel module loading detected | Loading of a kernel module was detected. Kernel modules are binaries meant to run in the kernel. Adversaries may try and load kernel modules to extend their capabilities and avoid detection by running in the kernel and not user space.
TRC-1018 | K8s TLS certificate theft detected | Theft of Kubernetes TLS certificates was detected. TLS certificates are used to establish trust between systems. The Kubernetes certificate is used to to enable secure communication between Kubernetes components, such as kubelet scheduler controller and API Server. An adversary may steal a Kubernetes certificate on a compromised system to impersonate Kubernetes components within the cluster.
TRC-1019 | Docker socket abuse detected |  An attempt to abuse the Docker UNIX socket inside a container was detected. docker.sock is the UNIX socket that Docker uses as the entry point to the Docker API. Adversaries may attempt to abuse this socket to compromise the system.
TRC-1020| File operations hooking on proc filesystem detected | File operations hooking on proc filesystem detected. The proc filesystem is an interface for the running processes as files. This allows programs like `ps` and `top` to check what are the running processes. File operations are the functions defined on a file or directory. File operations hooking includes replacing the default function used to perform a basic task on files and directories like enumerating files. By hooking the file operations of /proc an adversary gains control on certain system function, such as file listing or other basic function performed by the operation system. The adversary may also hijack the execution flow and execute it's own code. File operation hooking is considered a malicious behavior that is performed by rootkits and may indicate that the host's kernel has been compromised. Hidden modules are marked as hidden symbol owners and indicate further malicious activity of an adversary.
TRC-1021|  Kcore memory file read | An attempt to read /proc/kcore file was detected. KCore provides a full dump of the physical memory of the system in the core file format. Adversaries may read this file to get all of the host memory and use this information for container escape.
TRC-1022 | New executable dropped | An Executable file was dropped in the system during runtime. Container images are usually built with all binaries needed inside. A dropped binary may indicate that an adversary infiltrated your container.
TRC-1023 | Process memory access detected | Process memory access detected. Adversaries may access other processes memory to steal credentials and secrets.
TRC-1024 | Code injection detected through /proc/<pid>/mem file | Possible code injection into another process was detected. Code injection is an exploitation technique used to run malicious code, adversaries may use it in order to execute their malware.
TRC-1025| Code injection detected using process_vm_writev syscall | Possible code injection into another process was detected. Code injection is an exploitation technique used to run malicious code, adversaries may use it in order to execute their malware.
TRC-1026 | Rcd modification detected | The rcd files were modified. rcd files are scripts executed on boot and runlevel switch. Those scripts are responsible for service control in runlevel switch. Adversaries may add or modify rcd files in order to persist a reboot, thus maintaining malicious execution on the affected host.
TRC-1027 | Scheduled tasks modification detected | The task scheduling functionality or files were modified. Crontab schedules task execution or enables task execution at boot time. Adversaries may add or modify scheduled tasks in order to persist a reboot, thus maintaining malicious execution on the affected host.
TRC-1028 | Sudoers file modification detected | The sudoers file was modified. The sudoers file is a configuration file which controls the permissions and options of the sudo feature. Adversaries may alter the sudoers file to elevate privileges, execute commands as other users or spawn processes with higher privileges.
TRC-1029 | sched_debug CPU file was read | The sched_debug file was read. This file contains information about your CPU and processes. Adversaries may read this file in order to gather that information for their use.
TRC-1030 | Syscall table hooking detected | Syscall table hooking detected. Syscalls (system calls) are the interface between user applications and the kernel. By hooking the syscall table an adversary gains control on certain system function, such as file writing and reading or other basic function performed by the operation system. The adversary may also hijack the execution flow and execute it's own code. Syscall table hooking is considered a malicious behavior that is performed by rootkits and may indicate that the host's kernel has been compromised. Hidden modules are marked as hidden symbol owners and indicate further malicious activity of an adversary.
TRC-1031 | System request key configuration modification | An attempt to modify and activate the System Request Key configuration file was detected. The system request key allows immediate input to the kernel through simple key combinations. Adversaries may use this feature to immediately shut down or restart a system. With read access to kernel logs, host related information such as listing tasks and CPU registers may be disclosed and could be used for container escape.

!!! Note
    And, obviously, you can create your signatures in [golang], [rego] and [go-cel].

[golang]: ./golang.md
[rego]: ./rego.md
[go-cel]: ./go-cel.md
