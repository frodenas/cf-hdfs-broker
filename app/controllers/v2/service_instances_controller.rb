class V2::ServiceInstancesController < V2::BaseController
  def update
    if instance = ServiceInstance.find_by_id(params.fetch(:id))
      status = 409
    else
      instance = ServiceInstance.new(id: params.fetch(:id))
      instance.save
      status = 201
    end

    render status: status, json: instance
  end

  def destroy
    if instance = ServiceInstance.find_by_id(params.fetch(:id))
      instance.destroy
      status = 204
    else
      status = 410
    end

    render status: status, json: {}
  end
end
