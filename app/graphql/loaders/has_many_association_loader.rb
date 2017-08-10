class Loaders::HasManyAssociationLoader < GraphQL::Batch::Loader
  def initialize(owned_model_name, owner_key)
    @owned_model_name = owned_model_name
    @owner_key = owner_key
  end

  def perform(owner_ids_array)
    records = @owned_model_name.where(@owner_key => owner_ids_array.flatten.uniq)
    owner_ids_array.each do |owner_ids|
      owned_records = records.select { |r| owner_ids.include?(r.public_send(@owner_key)) }
      fulfill(owner_ids, owned_records)
    end
  end
end
