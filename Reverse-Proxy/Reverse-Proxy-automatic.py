import os

def read(path):
    try:
        fr = open(path+'rb')
    except IOError:
        print("The file does not exist!")
        return
    lines = fr.readlines()
    res = ''
    for line in lines:
        res += line
    return res


def cmd(command):
    return os.popen(command).read()

def get_name(container):
    return cmd("docker inspect -f '{{.Name}}' " + container).replace("/", "").replace('\n', '')


def get_ip(container):
    return cmd("docker inspect -f '{{.NetworkSettings.IPAddress}}' " + container).replace('\n', '')


def get_port(container):
    return cmd("docker inspect -f '{{.Config.ExposedPorts}}' " + container).replace('/tcp:{}]', '').replace('map[', '').replace('\n', '')


def get_info(container):
    filename = "/var/lib/docker/containers/" + container + "/config.v2.json"
    config = read_jsonfile(filename)

    name = config['Name'].replace("/", "")
    port = config['Config']['ExposedPorts'].keys()[0].replace('/tcp', '')
    ip = cmd("docker inspect -f '{{.NetworkSettings.IPAddress}}' " + name)
    # ip = config['NetworkSettings']['Networks']['bridge']['IPAddress']

    ret = {'name': name, 'port': port, 'ip': ip}
    return ret
