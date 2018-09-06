class ArticlesFinder
  def initialize(written_by: nil, from: nil, till: nil)
    @written_by = written_by
    @from = from
    @till = till
  end

  def find
    query = Article
    query = query.eager_load(:user).where(user: @written_by) if @written_by
    if @from && @till
    else
      query = query.created_after(@from) if @from
      query = query.created_before(@till) if @till
    end

    query
  end
end
