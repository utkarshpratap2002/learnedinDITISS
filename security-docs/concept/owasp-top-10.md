# OWASP Top 10

Refer to [OWASP Top 10](https://owasp.org/Top10/A01_2021-Broken_Access_Control/) to get more information and read more about it, but here we are going to describe with some practical example.

# 01: Broken Access Control 

1. Broken Access control is the violation of the least priviledges or say deny by default law, that focuses restricting the users from accessing the information to specific roles and users only, but at the same time it is accessible to everyone.

2. Second, it is about the restricting the users from modification of the confidential data using the URL.
  - For example we can talk about the website such as below:
    ```
    https://example.com/cart?item_id=123&quantity=1&price=50
    ```
  - It is the website that is visible to the user, which a user can change using the following modification.
    ```
    https://example.com/cart?item_id=123&quantity=1&price=1
    ```
  - If the price is not verified with database then a user can cause the violation of intended price control check, this is also called **parameter tampering**.

# 02: Cryptographic Failure

1. It is related to broader symtoms of the security implementation rather than the root symtoms. Because it focuses on implementation of the protection need when data in transit as well as at rest

2. For example, implementation of th GDRP, PCI DSS and other policies that are very need, examples includes implemenation of strong passwords.

# 03: Injection

1. This includes comman weakness such as SQL Injection, Cross-site Scripting. It basically includes the bypassing of the input verification, such as application taking inputs without paramertierizing and input verification.

2. Execution of Dynamic Queries are used without context-aware escaping within the interpreter. For example, there is a query, that goes something like this.

    ```
    search_term = request.GET.get('q')
    query = "SELECT * FROM products WHERE name LIKE '%" + search_term + "%'"
    cursor.execute(query)
    results = cursor.fetchall()
    ```

3. If some gave the input something like this, `%; DROP TABLE products;--%`, then in place of the SELECT query the DROP query will be executed.

# 04: Insecure Design