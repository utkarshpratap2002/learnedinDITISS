# Load Balancer DNS Names

The local DNS cache on HAProxy plays a crucial role in performance and resilience when dealing with hundreds of backend servers, especially in high-traffic environments. Here's how:

1. **Reduced Latency:** Resolving DNS names for backend servers can introduce latency. HAProxy's local DNS cache stores the IP addresses of backend servers, eliminating the need for repeated DNS lookups for each client request. This significantly reduces the overall request processing time and improves user experience.

2. **Improved Performance:** By caching DNS resolutions, HAProxy reduces the load on your DNS servers. This is especially important in high-traffic scenarios where frequent DNS lookups could overwhelm your DNS infrastructure.

3. **Increased Resilience:**  If your DNS servers become unavailable, HAProxy can still function using the cached IP addresses. This provides a level of resilience against DNS outages, ensuring that your application remains available even during DNS issues.

4. **Faster Health Checks:** HAProxy often uses DNS resolution for health checks.  Caching DNS results speeds up health checks, allowing HAProxy to react more quickly to server failures or recoveries.

5. **Control over DNS Resolution:** HAProxy allows you to configure specific DNS servers for resolving backend hostnames, giving you more control over the DNS resolution process. You can specify multiple DNS servers for redundancy and choose servers that are closer to your HAProxy instances for faster resolution.


**How it Works:**

* When HAProxy encounters a hostname in its configuration (e.g., in a `server` directive with the `resolve` keyword), it resolves the hostname to an IP address using the configured DNS servers.
* The resolved IP address is then cached locally.
* Subsequent requests to the same hostname use the cached IP address, bypassing the DNS resolution process.
* HAProxy periodically refreshes the cache according to the configured `timeout resolve` setting. This ensures that the cached IP addresses are up-to-date.


**Example Configuration:**

```
resolvers mydns
  nameserver dns1 10.0.0.1:53
  nameserver dns2 10.0.0.2:53
  hold valid 30s

defaults
  timeout resolve 10s

backend my_backend
  server my_service_1 my_service.example.com:8080 resolvers mydns resolve check
  server my_service_2 my_service.example.com:8080 resolvers mydns resolve check
```

In this example:

* The `resolvers mydns` section defines two DNS servers.
* The `hold valid 30s` directive tells HAProxy to consider DNS responses valid for 30 seconds even if the TTL is shorter. This can reduce the load on DNS servers.
* The `timeout resolve 10s` setting in the `defaults` section configures the DNS resolution timeout.
* The `resolve` keyword in the `server` lines tells HAProxy to resolve the hostname `my_service.example.com`.

**Key Considerations:**

* **Cache Invalidation:**  Ensure that the `timeout resolve` is set appropriately. Too long a timeout can lead to stale IP addresses being used if a backend server moves. Too short a timeout can increase the load on your DNS servers.
* **Multiple A Records:** HAProxy can handle multiple A records for a single hostname. It will typically load balance across all resolved IP addresses.
* **SRV Records:**  HAProxy also supports SRV records for service discovery.


By effectively utilizing HAProxy's local DNS cache, you can significantly improve the performance, resilience, and scalability of your load balancing infrastructure, especially when dealing with a large number of backend servers.
