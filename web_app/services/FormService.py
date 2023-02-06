from wtforms import Form

class FormService():

    def get_error_message(self, form: Form) -> str|None:
        errors = form.errors

        if len(errors) > 0:
            return errors[list(errors.keys())[0]][0]
        
        return None
        
    