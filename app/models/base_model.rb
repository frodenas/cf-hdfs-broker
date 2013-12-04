class BaseModel
  include ActiveModel::Model

  private

  def self.dfs_client
    WebHDFS::Client.new(Settings.dfs_host, Settings.dfs_port, Settings.dfs_user)
  end

  def dfs_client
    self.class.dfs_client
  end
end
