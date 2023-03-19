#!/bin/sh

./dist/tracee --filter event=sched_process_exec \
	--filter event=sched_process_fork \
	--filter comm!=sshd \
	--filter comm!=bash \
	--output json \
	--output option:exec-hash \
	--output option:exec-env \
	> trace-exec.json &

./dist/tracee --filter event=security_socket_listen \
	--filter event=security_socket_accept \
	--filter event=security_socket_bind \
	--filter event=security_socket_connect \
	--filter event=net_packet_dns_response \
	--filter comm!=sshd \
	--filter comm!=systemd \
	--filter event=net_packet_http_response \
	--output json \
	> trace-listen.json &

./dist/tracee \
	--filter comm!=sshd \
	--filter event=security_file_open \
	--filter comm!=irqbalance \
	--filter comm!=systemd \
	--filter security_file_open.args.pathname!='/sys/fs/cgroup/*' \
	--filter comm!=systemd-journal \
	--filter comm!=lspci \
	--filter comm!=modprobe \
	--output json \
	> trace-file.json &

while true; do
	sleep 1
done
