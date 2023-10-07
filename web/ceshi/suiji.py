import random
from faker import Faker


def seed_random(sun):
    """
    在函数下面 输入""""""或者''''''回车即可
    :param sun: 几条数据
    :return:
    {% multi_menu request %}
    {% breadcrumb request %}
    """
    fake = Faker("zh_CN")

    customers = []

    for _ in range(sun):
        customer = {
            "姓名": fake.name(),
            "年龄": random.randint(18, 60),
            "邮箱": fake.email(),
            "公司": fake.company(),
        }
        customers.append(customer)

    for customer in customers:
        print(customer)  # 输出客户信息


if __name__ == '__main__':
    seed_random(10)
