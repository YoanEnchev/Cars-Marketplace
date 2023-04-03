import os, stat

def del_rw(action, name, exc):
    os.chmod(name, stat.S_IWRITE)
    action(name)
    