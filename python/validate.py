import sys
import os
import json

invalid_json_files = [];
read_json_files = [];

def check_json(path = None):
    if path:
        path = os.path.abspath(path)
    else:
        path = os.getcwd()
    for file in os.listdir(path):
        with open(os.path.join(path, file)) as json_file:
            try:
                json.load(json_file);
                read_json_files.append(file);
            except ValueError, e:
                print ("JSON object issue with %s: %s") % (file, e);
                invalid_json_files.append(file);
    print("%s passed, %s failed" % (len(read_json_files), len(invalid_json_files)));
    sys.exit(len(invalid_json_files))


if __name__ == "__main__":
    check_json(sys.argv[1])