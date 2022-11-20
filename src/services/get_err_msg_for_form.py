def get_err_msg_for_form(form):
    errors = form.errors

    if len(errors) > 0:
        return errors[list(errors.keys())[0]][0]
    
    return None