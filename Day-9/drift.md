# Terraform Refresh

Now, let’s say the state of your infrastructure changes outside of Terraform. You can use the terraform refresh command to update your state file to match the real-world state:

```   terraform refresh           ```

The terraform refresh command is used to update the state file with the real-world status of your infrastructure. It queries your infrastructure providers to find out what's actually running and updates the state file with this new information. Running refresh does not modify infrastructure, but it does modify the state file. If the state has drifted from the last time Terraform ran, refresh allows that drift to be detected.

Drift Detected in Code
Let’s take the above example:

Now, let’s say someone manually logs into the AWS console and changes the instance type from t2.micro to t2.small. This change is not reflected in the Terraform configuration, and thus, a drift has occurred.

When you run terraform plan, Terraform will compare the real-world state (the t2.small instance) with the state defined in the configuration (the t2.micro instance). The output will show that a drift has been detected:
```
# aws_instance.example will be updated in-place
~ resource "aws_instance" "example" {
    id                           = "i-0c6187123456789ab"
    instance_type                = "t2.micro" -> "t2.small"
    # (other attributes omitted for brevity)
}

```
The ~ symbol indicates that Terraform has detected a difference between the configuration and the real-world state. The -> symbol shows the change that Terraform will make to reconcile the drift: it will change the instance type from t2.micro (the current real-world state) back to t2.small (the state defined in the configuration).

This is a simple example of how Terraform can detect and manage drift in your infrastructure. In more complex scenarios, managing drift can involve reconciling multiple changes across multiple resources.