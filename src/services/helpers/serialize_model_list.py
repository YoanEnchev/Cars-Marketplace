def serialize_model_list(collection:list) -> list:
    return [obj.serialize for obj in collection]