import logging
import os
import sys
import traceback
from configparser import ConfigParser, ExtendedInterpolation


def create_file_logger(file_path):
    """add file handler to logger"""
    file_handler = logging.FileHandler(file_path, mode='a')
    file_handler.setFormatter(logging.Formatter('%(asctime)s %(levelname)s : %(message)s'))
    log.addHandler(file_handler)


def create_stream_logger():
    """add stream handler to logger"""
    stream_handler = logging.StreamHandler()
    stream_handler.setFormatter(logging.Formatter('%(levelname)s : %(message)s'))
    log.addHandler(stream_handler)


def set_env_variables():
    """Set environment variables from INI Files"""
    config = ConfigParser(interpolation=ExtendedInterpolation())
    admin_path = os.path.join(env_root_path, 'Admin')
    ini_path = os.path.join(admin_path, 'Environment.INI')
    if not os.path.exists(ini_path):
        raise ValueError(f"Can not find ini file at location: {ini_path}")
    config.read(ini_path)
    env_name = sys.argv[2]
    if env_name:
        ini_path = os.path.join(admin_path, 'Environment_' + env_name + '.INI')
        if not os.path.exists(ini_path):
            raise ValueError(f"Can not find environment specific ini file at location: {ini_path} for environment {env_name}")
        config.read(ini_path)
    return config


def call_pasrau_file(config):
    """Call PASRAU script"""
    pasrau_file_path = os.path.join(config.get('WydeEnvironment', 'wf-root'), 'Python', 'Pasrau_File')
    if not os.path.exists(pasrau_file_path):
        raise ValueError(f"Can not find Pasrau script directory at location: {pasrau_file_path}")
    log.info(f"Pasrau.py: {pasrau_file_path}")
    sys.path.insert(0, pasrau_file_path)
    import Pasraufile
    Pasraufile.manage_pasrau(config)

def call_pasrau_crm(config):
    """Call PASRAU CRM script"""
    pasrau_crm_path = os.path.join(config.get('WydeEnvironment', 'wf-root'), 'Python', 'Pasrau_CRM')
    if not os.path.exists(pasrau_crm_path):
        raise ValueError(f"Can not find Pasrau script directory at location: {pasrau_crm_path}")
    log.info(f"Pasrau.py: {pasrau_crm_path}")
    #sys.path.append(pasrau_path)
    sys.path.insert(0, pasrau_crm_path)
    import Pasraucrm
    Pasraucrm.manage_pasrau_crm(config)



def dispatch():
    """
    Main method of the dispatcher
        - Set up logger
        - Read ini files to get the configuration context
        - Call the proper script according to first argument
    """
    global log
    log = logging.getLogger(__name__)
    create_stream_logger()
    try:
        global env_root_path
        env_root_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        dispatcher_log_path = os.path.join(env_root_path, 'Log', 'Python', 'Dispatcher')
        if not os.path.exists(dispatcher_log_path):
            log.info(f"Create directory for file at location: {dispatcher_log_path}")
            os.mkdir(dispatcher_log_path)
        create_file_logger(os.path.join(dispatcher_log_path, 'dispatcher.log'))
        config = set_env_variables()
        script_name = sys.argv[1]
        if script_name == 'PASRAU_FILE':
            call_pasrau_file(config)
        elif script_name == 'PASRAU_CRM':
            call_pasrau_crm(config)
        else:
            raise ValueError(f"Can not find script to call, unknown script name: {script_name}")
    except Exception:
        log.error(traceback.format_exc())


if __name__ == '__main__':
    dispatch()


