# Automation for Fidelidade 
 
# Author: Tiago Felipe Dias de Oliveira

## Installation:
- Requires Robot
- Python 3.7 or above
- after downloading the project, please install python and use these pip commands: 

```shell
pip install -r requirements.txt
```

- Add webdriver to the path (eg: Chromedriver, geckodriver)

## Screenshots, Console log and reports:
project\logs

## Console logs:
project\logs

## Commands:
full test cycle: 
```shell
robot -d ./logs tests
```

Run specific test
```shell
robot -d ./logs/ tests/automovel/simular.robot
```

Smoke test: 
```shell
robot -d ./logs -i critical
```

## Results:
To save the insurance value, the output.txt file was created