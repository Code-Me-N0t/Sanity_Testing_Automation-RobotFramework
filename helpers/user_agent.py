# user_agent.py
from fake_useragent import UserAgent

def get_mobile_user_agent():
    user_agent = UserAgent(platforms='mobile')
    return user_agent.random