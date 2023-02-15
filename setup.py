"""Dotfiles Setup

Usage:
  setup.py install [--backup | --overwrite | --skip]
  setup.py uninstall
  setup.py (-h | --help)
  setup.py --version

Options:
  -h --help       Show this screen.
  -v --version    Show version.
  -b --backup     Backup existing files/symlinks.
  -o --overwrite  Overwrite all files/symlinks.
  -s --skip       Skip existing files/symlinks.

"""

import glob2, logging, os, re, shutil, sys
from docopt import docopt

logger = logging.getLogger('Dotfiles')
hdlr = logging.FileHandler('dotfiles.log')
formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
hdlr.setFormatter(formatter)
logger.addHandler(hdlr)
logger.setLevel(logging.INFO)


def ask_user(file):
    i = 0
    print("""
    File already exists: "{}", please select an option:
    [s]kip,      [S]kip all,
    [o]verwrite, [O]verwrite all,
    [b]ackup,    [B]ackup all,
    [c]ancel
    """.format(file))
    while True:
        ans = input("What would you like to do? ")
        if ans == 'c':
            print('Cancelling...')
            sys.exit(0)
        elif ans != '' and ans in 'sSoObB':
            if ans in 'sS':
                print("Skipping...")
            if ans in 'oO':
                print("Overwriting...")
            return (ans, (ans == 'S'), (ans == 'O'), (ans == 'O'))
        else: # Don't run forever
            i += 1
            if i == 5:
                print('Cancelling...')
                sys.exit(0)


def delete_all(source_file):
    try:
        shutil.rmtree(source_file)
    except OSError:
        os.unlink(source_file)


def overwrite(target_dir, source_file):
    delete_all(source_file)
    os.symlink(target_dir, source_file)
    logger.warning("Overwriting {} => {}".format(source_file, target_dir))


def backup(target_dir, source_file):
    shutil.move(source_file, source_file + ".bak")
    os.symlink(target_dir, source_file)
    logger.warning("Backup and Overwriting {} => {}".format(source_file, target_dir))


def main():
    # Dotfile directories we're supposed to ignore
    ignore_dirs = ['.git', '.rbenv', 'fu', 'hub', 'oh-my-zsh.sl', 'rbenv.sl', 'roles', ]
    # Files to use for symlinks in $HOME
    files = glob2.glob('**/*.sl',)

    args = docopt(__doc__, version='Dotfiles Setup 1.0')

    if (args['install']):
        backup_all = args['--backup']
        overwrite_all = args['--overwrite']
        skip_all = args['--skip']

        logger.info("Install Symlinks start")
        for symlink in (files):
            link_name = "." + os.path.basename(symlink)[:-3]

            source_file = os.path.join(os.path.expanduser('~'), link_name)
            target_dir = os.path.abspath(symlink)

            logger.info('Processing {}'.format(target_dir))

            for m in ignore_dirs:
                if re.match(m, target_dir):
                    pass

            if os.path.exists(source_file):
                if skip_all:
                    logger.warning("Skipping {} => {}".format(source_file, target_dir))
                    pass
                elif overwrite_all:
                    overwrite(target_dir, source_file)
                elif backup_all:
                    backup(target_dir, source_file)
                else:
                    (ans, skip_all, overwrite_all, backup_all) = ask_user(source_file)
                    if ans in 'sS':
                        logger.warning("Skipping {} => {}".format(source_file, target_dir))
                        pass
                    if ans in 'oO':
                        overwrite(target_dir, source_file)
                    if ans in 'bB':
                        backup(target_dir, source_file)
            else:
                os.symlink(target_dir, source_file)
                logger.info("Created symlink {} => {}".format(source_file, target_dir))
    elif (args['uninstall']):
        logger.info("Uninstall Symlinks start")
        for symlink in (files):
            link_name = "." + os.path.basename(symlink)[:-3]
            source_file = os.path.join(os.path.expanduser('~'), link_name)
            target_dir = os.path.abspath(symlink)

            logger.info('Processing {}'.format(source_file))

            for m in ignore_dirs:
                if re.match(m, target_dir):
                    pass

            if os.path.exists(source_file):
                logger.info('Deleting {}'.format(source_file))
                delete_all(source_file)
    else:
        print(__doc__)
        sys.exit(1)

    print("Symlinks finished successfully")
    logger.info("Symlinks finished successfully")

if __name__ == '__main__':
    main()
