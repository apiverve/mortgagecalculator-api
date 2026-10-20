from setuptools import setup, find_packages

setup(
    name='apiverve_mortgagecalculator',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Mortgage Calculator computes monthly and annual loan payments from principal, interest rate, and term. It breaks totals down by principal, interest, property tax, insurance, and HOA dues, with paid plans adding full amortization schedules.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/mortgagecalculator?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
