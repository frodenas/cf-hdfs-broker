class ServiceInstance < BaseModel
  attr_accessor :id

  def self.find_by_id(id)
    instance = new(id: id)
    begin
      dfs_client.stat(instance.dfs_path)
    rescue WebHDFS::FileNotFoundError
      instance = nil
    end
    instance
  end

  def self.find(id)
    find_by_id(id) || raise("Couldn't find ServiceInstance with id=#{id}")
  end

  def dfs_path
    @dfs_path ||= begin
      raise 'Only ids matching [^0-9,a-z,A-Z$\-_.]+ are allowed' if id =~ /[^0-9,a-z,A-Z$\-_.]+/

      dfs_path = id.gsub('-', '_')

      "#{Settings.dfs_path_prefix}#{dfs_path}"
    end
  end

  def dfs_owner
    @dfs_owner ||= Digest::MD5.base64digest(id).gsub(/[^a-zA-Z0-9]+/, '')[0...16]
  end

  def dfs_group
    @dfs_group ||= dfs_owner
  end

  def save
    dfs_client.mkdir(dfs_path, permission: Settings.dfs_permission)
    dfs_client.chown(dfs_path, owner: dfs_owner, group: dfs_group)
  end

  def destroy
    dfs_client.delete(dfs_path, recursive: true)
  end

  def to_json(*)
    {}.to_json
  end
end
