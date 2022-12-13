from injector import inject

class BaseModelService:

    model_repository:object = NotImplementedError

    def create(self, data: dict, commit=False) -> object:
        return self.model_repository.create(entity=self.model_repository.entity(data), commit=commit)

    def get_by_id(self, id: int, serialization=False) -> object|None:
        return self.model_repository.get_by_id(id=id, serialization=serialization)

    def get_all(self, serialization=False, relations=[]) -> list:
        return self.model_repository.get_all(serialization=serialization, relations=relations)