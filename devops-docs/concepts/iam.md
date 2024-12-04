# Basics 

*What does it mean?* Remember that IAM user is for subadmins, all the administrators logs in using the root account. Root account is only for the users, as all the critical management of the AWS account is needed to be done using the Root Account. When you go to the IAM services, there you'll find the few details about your account:

- **Account ID** and **Account Alias** which comes into role when you need to assign a admininstrator with permissions, then in that case you share your credentials to allow that sub admin with the credentials.


# Identity and Access Management (IAM)

- IAM is the Core AWS feature that helps to manage and protect the **Resources**.

- Resources are the entities that you create in AWS, for example S3 Bucket and Objects.

- Users attempt to perform the **Action** on the resources , foe example S3::CreateBucket.

- Authorization to perform an **Action** depends on a **Policy**.


# Policy Document

```
{
    "Version": "2012-10-17",  # Arbitrary data
    # There can be many such statements, it is an array
    "Statement": [ 
        {
            "Sid": "CreateFunction", # It can be anything

        }
    ]
}
```

- Implicit Deny, by default the users are on implicity deny where they are not able to access the resources until and unless you explicitly allow them the resources.
- Explicit Deny, if you put `Deny` for the particular object means thare you are explicitly dening that the user can't access the reosurces.


# Understanding the Difference between Users and Roles

The Roles defeines the AWS services that can be used by the users and that when it comes to making an SSH connection with the EC2 instances for that an user needs an SSH key, that which IAM roles doesn't control directly the acces to the EC2 instances but what services the user will be able to run or use that is defined in the IAM roles. 

Once the user is able to sign into the instance the user doesn't have control over the services defined beyond the IAM roles. Thus, that is controlled using the IAM roles.
