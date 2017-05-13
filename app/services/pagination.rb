class Pagination
  PAGE = 1
  PER_PAGE = 100
  MIN_PER_PAGE = 5
  MAX = 1_000_000_000_000
  
  def self.call(params)
    case params[:pagination]
    when nil
      first = PAGE
      last = PER_PAGE
      numbers = (first..last).to_a
      { page: PAGE, per_page: PER_PAGE, numbers: numbers }
    when 'next'
      page = get_page(params)
      per_page = get_per_page(params)
      first = page
      first = (((page - 1) * per_page) + 1) if page > 1
      last = (page * per_page)
      numbers = (first..last).to_a
      { page: page, per_page: per_page, numbers: numbers }
    when 'previous'
      page = get_page(params) 
      per_page = get_per_page(params) 
      first = page
      last = per_page
      last = (page * per_page) if page > 1
      first = ((last - per_page) + 1) if page > 1
      numbers = (first..last).to_a
      { page: page, per_page: per_page, numbers: numbers }
    when 'faves'
      page = get_page(params) 
      per_page = get_per_page(params) 
      first = page
      first = (((page - 1) * per_page) + 1) if page > 1
      last = (page * per_page)
      numbers = (first..last).to_a
      { page: page, per_page: per_page, numbers: numbers }
    else
      { page: PAGE, per_page: PER_PAGE, numbers: [] }
    end
  end
  private
  def self.get_page(params)
    page = (params[:page] || PAGE).to_i
    return 1 if page < 1
    page
  end

  def self.get_per_page(params)
    per_page = (params[:per_page] || PER_PAGE).to_i
    return PER_PAGE if per_page < 1
    per_page
  end
end
