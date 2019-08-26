import os


def find_nearest(file_name):
    path = os.getcwd()

    while True:
        if file_name in os.listdir(path):
            return os.path.join(path, file_name)

        if path == '/':
            break

        path = os.path.abspath(os.path.join(path, os.pardir))

    return None
