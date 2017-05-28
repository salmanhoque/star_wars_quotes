ROOT_DIR = Dir.pwd

worker_processes 2
working_directory ROOT_DIR

timeout 30

listen "#{ROOT_DIR}/tmp/sockets/unicorn.sock", backlog: 64

# Set process id path
pid "#{ROOT_DIR}/tmp/pids/unicorn.pid"

