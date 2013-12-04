#CF HDFS Broker

CF HDFS Broker provides Hadoop HDFS as a Cloud Foundry service.  This broker demonstrates the v2 services API between cloud controllers and service brokers. This API is not to be confused with the cloud controller API; for more info see [http://docs.cloudfoundry.com/docs/running/architecture/services/].

The broker does not include a Hadoop HDFS cluster. Instead, it is meant to be deployed alongside a Hadoop HDFS cluster, which it manages. These are the Hadoop HDFS management tasks that the broker performs.

* Provisioning of Hadoop HDFS filesystem (create)
* Creation of credentials (bind)
* Removal of credentials (unbind)
* Unprovisioning of Hadoop HDFS filesystem (delete)

## Running Tests

The CF HDFS Broker integration specs will exercise the catalog fetch, create, bind, unbind, and delete functions against its locally installed database.

1. Run the following commands

```
$ cd cf-hdfs-broker
$ bundle
$ bundle exec rake spec
```
