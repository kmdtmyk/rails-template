# frozen_string_literal: true

module PaginationHelper

  def page_entries_info(page)
    render 'kaminari/page_entries_info', page: page
  end

  def render_with_pagination(records)
    if records.respond_to? :per
      page = records
    else
      page = records.page(params[:page])
    end
    if page.empty?
      return page_entries_info(page)
    end

    if browser.device.mobile?
      pagination = capture{ render 'shared/mobile_paginator', page: page }
    else
      pagination = paginate(page)
    end

    page_entries_info(page) +
    capture{ yield page } +
    pagination
  end

end
