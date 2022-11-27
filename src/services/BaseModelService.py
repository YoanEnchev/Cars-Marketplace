from injector import inject

class BaseModelService:

    model_repository:object = NotImplementedError

    def create(self, data: dict, commit=False) -> object:
        return self.model_repository.create(entity=self.model_repository.entity(data), commit=commit)

    def get_all(self, serialization=False):
        return self.model_repository.get_all(serialization=serialization)