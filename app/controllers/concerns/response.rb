module Response
  def json_response(msg, is_success, data, status)
    render json: {
      msg: msg,
      is_success: is_success,
      data: data
    }, status: status
  end
end