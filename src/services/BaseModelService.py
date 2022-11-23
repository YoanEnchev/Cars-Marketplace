from injector import inject

class BaseModelService:

    model:object = NotImplementedError
    model_repository:object = NotImplementedError

    def create(self, data: dict, commit=False) -> object:
        return self.model_repository.create(entity=self.model(data), commit=commit)