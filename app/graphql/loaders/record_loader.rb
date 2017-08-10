class RecordLoader < GraphQL::Batch::Loader
  def initialize(model_name)
    @model_name = model_name
  end

  def perform(ids)
    @model_name.where(id: ids).each { |record| fulfill(record.id, record) }
    ids.each { |id| fulfill(id, nil) unless fulfilled?(id) }
  end
end
