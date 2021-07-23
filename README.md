https://www.linkedin.com/in/lucasafonsokremer

Requirements
------------

* tfenv instalado
* Terraform: 0.15.4
* Alterar o credentials path no arquivo main.yml

```
shared_credentials_file = pathexpand("~/yourcredentialspath")
``` 

* Adicionar o backend os blocos data para coletar dados da VPC

Dependencies
------------

* N/A

Example
-------

```
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
```


Informations
------------

## Melhores Práticas

Link: https://docs.aws.amazon.com/msk/latest/developerguide/bestpractices.html#bestpractices-right-size-cluster

## Versões do Kafka disponíveis

Link: https://docs.aws.amazon.com/msk/latest/developerguide/supported-kafka-versions.html#2.7.1
