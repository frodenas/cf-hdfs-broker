class ServiceBinding < BaseModel
  attr_accessor :id, :service_instance

  def self.find_by_id(id, instance)
    binding = new(id: id, service_instance: instance)
  end

  def host
    Settings.dfs_host
  end

  def port
    Settings.dfs_port
  end

  def path
    service_instance.dfs_path
  end

  def username
    service_instance.dfs_owner
  end

  def save
    # noop
  end

  def destroy
    # noop
  end

  def to_json(*)
    {
      'credentials' => {
        'host' => host,
        'port' => port,
        'path' => path,
        'username' => username,
        'uri' => uri
      }
    }.to_json
  end

  private

  def uri
    "hdfs://#{host}:#{port}#{path}"
  end
end
