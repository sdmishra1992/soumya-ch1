<img src="https://www.datocms-assets.com/2885/1506457071-blog-terraform-list.svg" align="right" width="120">

# AWS SOUMYA CH1 Terraform

Website: https://www.terraform.io/

## Overview
This repository contains the terraform code that comprises the infrastructure of
the multi tire application on the AWS platform. In this README you can find or
be directed to all the relevant information regarding the infrastructure for the
this application.

End to End application flow from user's browser to webserver and get response back.
Its highly available and load balanced design with highly secure.

## Contents
- [Requirements](#requirements)
- [Design](#design)
- [Folder Structure](#folder-structure)
  - [Environment Structure](#environment-structure)
  - [Modules Structure](#Module-Structure)
  - [Projects ](#Projects)
- [Terraform Commands ](#Terraform-Commands)

<a name="requirements"/>

## Requirements
Type | Version
----------- | -----------
Terraform | 0.12.x

<a name="design"/>

## Design
Type        | Link  
----------- | -----------
**Drawio** | [Design](https://github.com/sdmishra1992/soumya-ch1/blob/main/aws.drawio)

<a name="folder-structure"/>

## Folder Structure

<a name="environment-structure"/>

### Environment Structure
```bash
  +---env_var
  |       env.tfvars
  |
```

<a name="stack-structure"/>

### Modules Structure
```bash
  .
  .
+---modules
|   +---compute
|   |   +---asg
|   |   |       main.tf
|   |   |       outputs.tf
|   |   |       variables.tf
|   |   |
|   |   +---elb
|   |   |       main.tf
|   |   |       outputs.tf
|   |   |       variables.tf
|   |   |
|   |   \---sg
|   |           main.tf
|   |           outputs.tf
|   |           variables.tf
|   |
|   +---database
|   |   \---rds
|   |       |   main.tf
|   |       |   variables.tf
|   |       |
|   |       \---modules
|   |           +---db_instance
|   |           |       main.tf
|   |           |       outputs.tf
|   |           |       variables.tf
|   |           |
|   |           +---db_option_group
|   |           |       main.tf
|   |           |       outputs.tf
|   |           |       variables.tf
|   |           |
|   |           \---db_parameter_group
|   |                   main.tf
|   |                   outputs.tf
|   |                   variables.tf
|   |
```

<a name="additional-items"/>

### Projects Items
```bash
  \---project
    +---database
    |   +---dns
    |   |       main.tf
    |   |       outputs.tf
    |   |       variables.tf
    |   |
    |   +---main
    |   |       main.tf
    |   |       output.tf
    |   |       variable.tf
    |   |
    |   \---securitygroup
    |           main.tf
    |           outputs.tf
    |           variables.tf
    |
    +---frontend
    |   +---dns
    |   |       main.tf
    |   |       outputs.tf
    |   |       variables.tf
    |   |
    |   +---main
    |   |       main.tf
    |   |       outputs.tf
    |   |       user_data.tpl
    |   |       variables.tf
    |   |
    |   \---securitygroup
    |           main.tf
    |           outputs.tf
    |           variables.tf
    |
    \---newvpc
            main.tf
            outputs.tf
            variable.tf
```
## Terraform commands
Go to respective folder structure and run below command to provision resources.

Note :: You have to know resources dependencies before run below commands. 
        Automation pipeline is the best way for infrastructure creation. (EX: Jenkins declarative pipelines)

 - $ terraform init
 - $ terraform plan -var-file= << *** path to env.tfvars *** >> -out << *** resource *** >>.tfplan
 - $ terraform apply << *** resource *** >>.tfplan
