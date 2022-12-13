def serialize_model_list(collection:list, relations=[]) -> list:
    return [obj.serialize(relations) for obj in collection]