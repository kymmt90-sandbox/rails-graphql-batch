class Loaders::HasManyAssociationLoader < GraphQL::Batch::Loader
  def initialize(owned_model_name, owner_key)
    @owned_model_name = owned_model_name
    @owner_key = owner_key
  end

  def perform(owner_ids)
    records = @owned_model_name.where(@owner_key => owner_ids.uniq)
    owner_ids.each do |owner_id|
      owned_records = records.select { |r| r.public_send(@owner_key) == owner_id }
      fulfill(owner_id, owned_records)
    end
  end
end
