module ApplicationHelper
  def with_pagination_info paginated_records
      {
      total: paginated_records.total_entries,
      current_page: paginated_records.current_page,
      total_pages: paginated_records.total_pages,
      data: paginated_records,
      }
  end
end
