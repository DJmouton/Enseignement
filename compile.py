import os, fnmatch, argparse, sys, subprocess

ROOT = "."
PATTERN_FILES = ".compiletargets"


def get_all_files(root: str) -> list:
    files = []
    for dirpath, dirnames, filenames in os.walk(root):
        if not filenames:
            continue
        files.append("{}/{}".format(dirpath, filenames[0]))
    return files


def find_patterns(files: list) -> tuple[list, list]:
    unwanted_patterns = []
    wanted_patterns = []

    for file in files:
        if not fnmatch.filter(file, PATTERN_FILES):
            continue

        dirpath = os.path.dirname(os.path.abspath(file))
        with open(file, "r") as pattern_file:
            for line in pattern_file:
                full_pattern = "{}/{}".format(dirpath, line[1:-1])
                if line[0] == "-":
                    unwanted_patterns.append(full_pattern)
                if line[0] == "+":
                    wanted_patterns.append(full_pattern)

    unwanted_patterns = [p for p in unwanted_patterns if p not in wanted_patterns]
    return unwanted_patterns, wanted_patterns


def filter_files_by_patterns(files: list, patterns: list) -> list:
    filtered_files = []
    for file in files:
        for pattern in patterns:
            if fnmatch.filter(file, pattern):
                filtered_files.append(file)
    return filtered_files


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", help="Sets the root of the compilation.")
    parser.add_argument(
        "--destination",
        help="Sets the destination of the compilation.\nWill copy any file matching the patterns in .compiletargets files.",
    )
    args = parser.parse_args()

    root = ROOT
    if args.root:
        root = args.root
    files = get_all_files(root)
    unwanted_patterns, wanted_patterns = find_patterns(files)
    unwanted_files = filter_files_by_patterns(files, unwanted_patterns)
    wanted_files = filter_files_by_patterns(files, wanted_patterns)

    typst_files = fnmatch.filter(files, "*.typ")
    wanted_typst_files = [
        f for f in typst_files if not f in unwanted_files or not f in wanted_files
    ]
    for typst_file in wanted_typst_files:
        subprocess.call(["tinymist", "compile", "--root", root, typst_file])

    """ if args.destination:
        return
        wanted_typst_files_destination = [
            "{}/{}".format(args.destination, f[1:]) for f in wanted_typst_files
        ]

        # subprocess.call(["tinymist", 'compile', '--root', root, ])

        wanted_files = [f for f in wanted_files if not f in typst_files]
        wanted_files_destination = [
            "{}/{}".format(args.destination, f[1:]) for f in wanted_files
        ] """
