## Terraform Web Server 

This project demonstrates how to deploy a simple web server on AWS using Terraform with variables for customization. 

### Project Overview

This Terraform configuration creates a single EC2 instance running a web server. The server responds with a basic "Hello, World" message when accessed on a user-defined port. This example prioritizes flexibility by allowing you to easily modify the server port through variables.

### Requirements

* **Terraform:** Ensure you have Terraform installed on your system. Download it from the official website [https://www.terraform.io/](https://www.terraform.io/).
* **AWS Account:** You'll need an AWS account with proper access credentials. 
* **Terraform AWS Provider:** This code leverages the Terraform AWS Provider to interact with AWS resources. 
* **Terraform Version:** This code was written and tested with Terraform 0.10.x. Compatibility with newer versions might require adjustments.

### Setting Up Your Environment

1. **Configure AWS Credentials:**

   For security reasons, it's highly recommended to use IAM users instead of the root account for AWS access. Here are two common approaches for setting up your credentials(use any one):

     * **Default Credentials File:**

        Create a file named `~/.aws/credentials` on Linux/macOS/Unix or `C:\Users\USERNAME\.aws\credentials` on Windows. This file should contain your AWS credentials in the following format:

        ```
        [default]
        aws_access_key_id = <your_access_key_id>
        aws_secret_access_key = <your_secret_access_key>
        ```

        Replace `<your_access_key_id>` and `<your_secret_access_key>` with your actual AWS credentials.

     * **Environment Variables:**

        Set the environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` with your AWS credentials.

        On Linux/macOS/Unix, use the `export` command:

        ```bash
        export AWS_ACCESS_KEY_ID=<your_access_key_id>
        export AWS_SECRET_ACCESS_KEY=<your_secret_access_key>
        ```

        On Windows, use the `set` command:

        ```bash
        set AWS_ACCESS_KEY_ID=<your_access_key_id>
        set AWS_SECRET_ACCESS_KEY=<your_secret_access_key>
        ```

2. **Initialize Terraform Project:**

   Navigate to the project directory containing the Terraform configuration files. Run the following command to initialize the project and download any required provider plugins:

   ```bash
   terraform init
   ```

### Customizing Server Port

The web server in this example listens on port 8080 by default. This is defined as a variable named `server_port` in the `vars.tf` file. Here's how you can customize this port:

* **Command-Line Flags:**

   Pass the desired port as a flag when running Terraform commands:

   ```bash
   terraform plan -var 'server_port=8080'  # Replace 8080 with your desired port
   ```

   ```bash
   terraform apply -var 'server_port=8080'  # Replace 8080 with your desired port
   ```

* **`terraform.tfvars` File:**

   Create a file named `terraform.tfvars` in the project directory. This file allows you to define variable values that Terraform will use during execution. Add a line like this to specify the port:

   ```
   server_port = "8080"  # Replace 8080 with your desired port
   ```

* **Environment Variables:**

   Terraform can also read variables from environment variables prefixed with `TF_VAR_`. Set an environment variable named `TF_VAR_server_port` with your desired port value.

* **Modifying Variable Defaults:**

   You can directly modify the `default` value assigned to the `server_port` variable within the `vars.tf` file itself.

### Verifying and Deploying Your Infrastructure

1. **Validate Changes (Plan):**

   Before deploying the infrastructure, run the following command to preview the changes Terraform will make:

   ```bash
   terraform plan
   ```

   This will show you a detailed list of resources that will be created or modified. Review the plan carefully to ensure everything is as expected.

### Verifying and Deploying Your Infrastructure (continued)

2. **Deploy Infrastructure (Apply):**

   Once you're satisfied with the plan, proceed with deploying the infrastructure by running:

   ```bash
   terraform apply
   ```

   This will create the AWS resources as defined in your Terraform configuration.

3. **Test the Web Server:**

   You can test the deployed web server in two ways:

   * **Using curl:**

     Replace `<server_public_ip>` with the actual public IP address of your EC2 instance:

     ```bash
     curl http://<server_public_ip>:8080/
     ```

   * **Using a web browser:**

     Access the following URL in your web browser, replacing `<server_public_ip>` with the actual public IP address:

     ```
     http://<server_public_ip>:8080/
     ```

   If everything is set up correctly, you should see a response of "Hello, World".

### Destroying the Infrastructure (Optional)

**Important:** Destroying the infrastructure removes all resources created by Terraform in your AWS account. This is irreversible. 

When you're finished with the web server and want to clean up the resources, run the following command:

```bash
terraform destroy
```

Terraform will display a list of resources that will be destroyed.  Carefully review this list to ensure you understand what will be removed.  If you're confident about the changes, type `yes` at the prompt to confirm the destruction.

This will remove the web server instance and any associated resources from your AWS account.

### Additional Notes

* This is just a basic authentication. In production environments, consider proper security measures like firewalls and access controls.
* The code might need adjustments as per your Terraform versions. Refer to the official Terraform documentation for updates.
