import logging


def setup_logger(logger_name, log_file, level=logging.INFO):
    l = logging.getLogger(logger_name)
    logger = logging.getLogger(logger_name)
    formatter = logging.Formatter('%(asctime)s : %(message)s')
    filehandler = logging.FileHandler(log_file, mode='w')
    filehandler.setFormatter(formatter)
    streamhandler = logging.StreamHandler()
    streamhandler.setFormatter(logging.Formatter('%(message)s'))
    logger.setLevel(level)
    logger.addHandler(filehandler)
    logger.addHandler(streamhandler)


setup_logger('log1', 'log1.log')
setup_logger('log2', 'log2.log')
log1 = logging.getLogger('log1')
log2 = logging.getLogger('log2')
log1.info('Info for log 1!')
log2.info('Info for log 2!')
