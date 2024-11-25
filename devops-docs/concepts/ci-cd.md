# Test

Automated Tests are performed, necessary changes are implemented in correspodance to the responses recieved from Feedback. The goal is to make things more easy and quick, using CI/CD pipeline we make these processes faster by automating the tests. How these things work is through the Jenkins where we automate the testing environment.

Verify code functionality, performance, and security. After the Build process and dependency resolution, CI/CD pipeline implements the automated testing and providing testing environement and resources such as availability of databases, cloud environment, and test servers, meaning the tool like Jenkins is used to provide a testing environment such as Unit Testing, Integration Testing, Performance Testing and all, thus, the test results are displayed and emails are forwarded, if any test fails, the pipeline stops. Remember Test and Build are kind of prerequisite for the Release phase, which we'll talk next. 

The CI/CD system collects the results of automated tests and generates reports and depending on the result if passed or failed, or if some functions were skipped. If tests are passed, Jenkins proceeds with the deployment to the staging environment or pre-production environment. 

Though without doubt, you can tell that Test process is important but the importance and value that it creates when we do it in context CI/CD pipeline enhances the overall Product delivery and in the context of DevOps, the same concept is defined as Contineous Delivery and Contineous Deployment. We talk about it in next section called Release.

# Release

This is where CI/CD is implemented. This is the repetition is implemented, called contineous integration and contineous deployment, meaning from code integration to the code deployment, all of it is taken care in this Release phase. Basically we'll get into what Release phase is all about and we'll also discuss what is contineous integration and contineous delivery, also about another aspect of contineous deployment.

- Contineous Integration: Contineous Inegration means identifying the deployable artifact, meaning all that code that is on developer wrote are 

What we talked about was the CI/CD pipeline is, never mistake CI/CD pipeline in thinking that it is the one phase within the Release or CI/CD is integral part of the Release phase, no that not right understanding, instead all the phases within the DevOps Modal are integral part of CI/CD pipeline as it is the way that narrates the DevOps culture of iterative evolution and achieveing Product development.

# Deploy

Managing and maintaining the development and deployment of servers within the computing environement, meaning such environment can be traditional environment, virtual environment, and containerised environment. Deploy phase is tightly coupled with the Release phase and CI/CD pipeline is quite strongly in effect here. 

In deploy phase, the release candidate (those selected tests that passes) will be deployed to the target environment according to the deployment strategy (traditional, virtual, and containerised). Once deployed, there is Operating and Monitoring, and rest the cycle is repeated, developer fix bugs or commit changes to their Version Control Repository (GitHub for example), the commit will trigger CI/CD pipeline, package deployment, automated tests, and selection of release candidate will happen automatically through the CI/CD pipeline.

# Operate

When it is about Operate and Monitor you need to conside both of them as part of one process only, as operate and Monitor uses the concept that both work in accordance to each other.  

