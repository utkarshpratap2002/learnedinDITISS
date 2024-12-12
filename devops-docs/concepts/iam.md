# Basics 

*What does it mean?* Remember that IAM user is for subadmins, all the administrators logs in using the root account. Root account is only for the users, as all the critical management of the AWS account is needed to be done using the Root Account. When you go to the IAM services, there you'll find the few details about your account:

- **Account ID** and **Account Alias** which comes into role when you need to assign a admininstrator with permissions, then in that case you share your credentials to allow that sub admin with the credentials.

- *This is the Basics*. It is about **Identity** and literally the **Access Management**, meaning the access that are being provided to these identities, because there are policies that are defined with respect to the access management to the users. These users when request for particular services, there are defined **policies** for the services and it looks whether the identity is the one listed on the authorised list or not.

# Why You should be using IAM?

Basically there is one primary AWS account on which you need to use the IAM (Identity and Access Management) for better utilisation and management of the resources to the users that are using the account. Yeah that's point. Basically you assign the granular permission to point that who can access as well as what action the user can perform, as well what kind of permission over the aciton are to be allowed.

### Shared Access to the AWS Account

This is where AWS account resources can be shared with the multiple IAM users and through IAM you can have better utilisation of the resources and therefore you can have better optimisation of the resources.

### Granular Permission

You can grant different permission to the different users for different resources. For example, you can assign the resources for the permission for the AWS EC2, S3 Buckets, and other resources and for the other users you can assign read-only permission for the reosurces.

### Secure Access for the AWS Resources to the application that run on EC2

You can provide permission to the applicaiton to use the AWS resources such as S3 and RDS database. 

# When should you use IAM?

Understanding the IAM roles is crucial as it is important to know what are the capabilities and what can be done using the IAM capabilities, you can define policies and IAM provides a flexible method of managing and distributing the IAM Policies. 

## When you need to perform various job funcionality

Thus, when it comes to performing various jobs in AWS, it is managed by the *unique identity credentials* of the users for whom the IAM Roles are defined.

- Service User: People who are doing the job on AWS, their administrator assign them a login credentials and passwords, if the job requores more resources the user is suppose to communicate that with their administrator.

- Serivce Administrator: Service usrers should be able to access those resources that they require, as the service administrator is suppose to provide service users with the specific resources, so what service administrator is suppose to identify the resource list for the service user and submit it to IAM Administrator. *Remember*, Service Administrator is in change of the AWS Resources.

- IAM Administrator - IAM adminstrator defines the policies and manages the identify for the IAM users.

## When you need to Sign-in as IAM User

**IAM user** has unique credentials that allow a user to access the resources and applicaiton. IAM user are created to manage and distribute the resources within the AWS account. However, philophically, *it is recommended to use the temprory account for the IAM user for any specific resource*.

**IAM groups** are too identity that can be said as the collection of multiple IAM users, anyone can access resources using the IAM group by logging into the groups. These groups too have the unique identity associate with the permissions and policies regarding AWS resources.

*Remember*, that Users and Roles both are different from each other, as the role are assumable to anything, whereas the users are like single entity that is associated with single person or application.  

## When you assume a IAM Role

IAM role is an identity within the AWS account but not same as IAM users, roles have permissions and can assumed to whatever you might need them to be. You can switch from an IAM user to IAM roles when needed.

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

The Roles defines the AWS services that can be used by the users and that when it comes to making an SSH connection with the EC2 instances for that an user needs an SSH key, that which IAM roles doesn't control directly the acces to the EC2 instances but what services the user will be able to run or use that is defined in the IAM roles. 

Once the user is able to sign into the instance the user doesn't have control over the services defined beyond the IAM roles. Thus, that is controlled using the IAM roles.

# IAM Roles

IAM roles provides the facility of defining the roles that assigns policies and permission for the users to be able to make decision about the resources and therefore, it is possible that you don't have to 